//
//  GCTiledMapParser.m
//  GunCase
//
//  Created by Philipp Brendel on 08.08.12.
//
//

#import "GCTiledMapParser.h"
#import "GCMapLayerDataDecoder.h"
#import "GCMapLayerDataDecompressor.h"

#import "GCTiledMapIdentityDecompressor.h"
#import "GCTiledMapGzipDecompressor.h"
#import "GCTiledMapBase64Decoder.h"

typedef enum {
    GCTiledMapNoPropertiesScope = 0,
    GCTiledMapMapPropertiesScope = 1,
    GCTiledMapLayerPropertiesScope = 2
} GCTiledMapPropertiesScope;

@interface GCTiledMapParser ()
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) id<GCMapLayerDataDecoder> decoder;
@property (nonatomic, strong) id<GCMapLayerDataDecompressor> decompressor;

// {Map, Layer} properties
@property (nonatomic, strong) NSMutableDictionary *currentProperties;
@property (nonatomic) GCTiledMapPropertiesScope currentPropertiesScope;
- (void) beginProperties;
- (void) setProperties;
- (void) addProperty: (NSDictionary *) attributes;

@end

@implementation GCTiledMapParser

- (id) initWithURL: (NSURL *) url
{
    self = [super init];
    
    if (self) {
        self.url = url;
    }
    
    return self;
}

- (BOOL) parse
{
    NSXMLParser *xmlParser =
        [[NSXMLParser alloc] initWithContentsOfURL: self.url];
    
    xmlParser.delegate = self;
    
    return [xmlParser parse];
}

#pragma mark -
#pragma mark XML Parser Delegate

- (void)parserDidStartDocument:(NSXMLParser *)parser
{
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    
}

- (void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qualifiedName
     attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString: @"map"]) {
        [self createMapWithAttributes: attributeDict];
    }
    
    else if ([elementName isEqualToString: @"data"]) {
        [self prepareForLayerDataWithEncoding: [attributeDict objectForKey: @"encoding"]
                             compression: [attributeDict objectForKey: @"compression"]];
    }
    
    else if ([elementName isEqualToString: @"tileset"]) {
        [self addTilesetWithAttributes: attributeDict];
    }
    
    else if ([elementName isEqualToString: @"tileoffset"]) {
        [self addTileOffsetWithAttributes: attributeDict];
    }
    
    else if ([elementName isEqualToString: @"image"]) {
        [self addImageWithAttributes: attributeDict];
    }
    
    else if ([elementName isEqualToString: @"layer"]) {
        [self addLayerWithAttributes: attributeDict];
    }
    
    else if ([elementName isEqualToString: @"properties"]) {
        [self beginProperties];
    }
    
    else if ([elementName isEqualToString: @"property"]) {
        [self addProperty: attributeDict];
    }
    
    else {
        NSLog(@"Unknown xml element encountered: %@", elementName);
    }
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString: @"properties"]) {
        [self setProperties];
    }
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    NSLog(@"Parse error: %@", parseError);
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    NSString *data = [string stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if (data.length) {
        [self parseLayerData: data];
    }
}

#pragma mark -
#pragma mark Processing Map Elements

- (void) createMapWithAttributes: (NSDictionary *) attrs
{
    GCMap *map = [self createMap];
    
    map.version = [attrs objectForKey: @"version"];
    map.orientation = [attrs objectForKey: @"orientation"];
    map.width = [[attrs objectForKey: @"width"] integerValue];
    map.height = [[attrs objectForKey: @"height"] integerValue];
    map.tileWidth = [[attrs objectForKey: @"tilewidth"] integerValue];
    map.tileHeight = [[attrs objectForKey: @"tileheight"] integerValue];
    
    // Update parser state
    self.currentPropertiesScope = GCTiledMapMapPropertiesScope;
}

- (void) fillLayerWithData: (id) data
{
    
}

- (void) addTilesetWithAttributes: (NSDictionary *) attrs
{
    GCMapTileset *tileset = [self addTileset];
    
    tileset.firstID = [[attrs objectForKey: @"firstgid"] integerValue];
    tileset.name = [attrs objectForKey: @"name"];
    tileset.tileWidth = [[attrs objectForKey: @"tilewidth"] integerValue];
    tileset.tileHeight = [[attrs objectForKey: @"tileheight"] integerValue];
}

- (void) addImageWithAttributes: (NSDictionary *) attrs
{
    NSString *filename = [attrs objectForKey: @"source"];
    NSURL *url = [[NSBundle bundleForClass: [self class]] URLForImageResource: [filename stringByDeletingPathExtension]];
    NSImage *image = [[NSImage alloc] initWithContentsOfURL: url];
    
    [self setTilesetImage: image];
}

- (void) addLayerWithAttributes: (NSDictionary *) attrs
{
    GCMapLayer *layer = [self addLayer];
    id visibility = [attrs objectForKey: @"visible"];
    
    layer.name = [attrs objectForKey: @"name"];
    layer.width = [[attrs objectForKey: @"width"] integerValue];
    layer.height = [[attrs objectForKey: @"height"] integerValue];
    layer.visible = visibility == nil ? YES : [visibility boolValue];
    
    layer.tileWidth = self.map.tileWidth;
    layer.tileHeight = self.map.tileHeight;
    
    // Update parser state
    self.currentPropertiesScope = GCTiledMapLayerPropertiesScope;
}

- (void) addTileWithID: (NSInteger) identifier
            attributes: (NSDictionary *) attrs
{
    [self addTileWithID: identifier];
}

- (void) addTileOffsetWithAttributes: (NSDictionary *) attrs
{
    float
        x = [[attrs objectForKey: @"x"] floatValue],
        y = [[attrs objectForKey: @"y"] floatValue];
    
    [self addTileOffset: NSMakeSize(x, y)];
}

#pragma mark -
#pragma mark Processing Map Data

- (void) prepareForLayerDataWithEncoding: (NSString *) encoding
                             compression: (NSString *) compression
{
    self.decoder = nil;
    self.decompressor = nil;
    
    if ([encoding isEqualToString: @"base64"]) {
        self.decoder = [[GCTiledMapBase64Decoder alloc] init];
        
        if (compression == nil || [compression isEqualToString: @""]) {
            self.decompressor = [[GCTiledMapIdentityDecompressor alloc] init];
        }
        
        else if ([compression isEqualToString: @"gzip"]) {
            self.decompressor = [[GCTiledMapGzipDecompressor alloc] init];
        }
        
        else if ([compression isEqualToString: @"zlib"]) {
            NSLog(@"zlib map compression is not implemented");
        }
        
        else {
            NSLog(@"Unknown map compression type: %@", compression);
        }
    }
    
    else if (encoding == nil || [encoding isEqualToString: @"xml"]) {
        NSLog(@"XML map encoding is not implemented");
    }
    
    else if ([encoding isEqualToString: @"csv"]) {
        NSLog(@"CSV map encoding is not implemented");
    }
    
    else {
        NSLog(@"Unknown map encoding type: %@", encoding);
    }
}

- (void) parseLayerData: (NSString *) text
{
    if (text == nil) {
        @throw [NSException exceptionWithName: @"InvalidArgument" reason: @"Layer data text is nil" userInfo: nil];
    }
    
    NSData *decoded = [self.decoder decode: text];
    
    if (decoded == nil) {
        NSLog(@"Decoding failed");
        return;
    }
    
    NSData *decompressed = [self.decompressor decompress: decoded];
        
    if (decompressed == nil) {
        NSLog(@"Decompression failed");
        return;
    }
    
    // The raw data is an array of integers
    if (decompressed.length % 4 != 0) {
        NSLog(@"Data length is not multiple of 4");
        return;
    }
    
    const int32_t *rawData = decompressed.bytes;
    
    for (NSInteger i = 0; i  < decompressed.length / 4; ++i) {
        NSInteger identifier = rawData[i];
        
        [self addTileWithID: identifier attributes: nil];
    }
}

- (void) beginProperties
{
    self.currentProperties = [NSMutableDictionary dictionary];
}

- (void) setProperties
{
    switch (self.currentPropertiesScope) {
        case GCTiledMapMapPropertiesScope:
            self.map.properties = self.currentProperties;
            break;
        case GCTiledMapLayerPropertiesScope:
            self.map.topmostLayer.properties = self.currentProperties;
            break;
        default:
            @throw [NSException exceptionWithName: @"InvalidState" reason: @"Invalid properties scope" userInfo: nil];
    }
    
    self.currentProperties = nil;
}

- (void) addProperty: (NSDictionary *) attributes
{
    NSString
        *name = [attributes objectForKey: @"name"],
        *value = [attributes objectForKey: @"value"];
    
    if (name == nil || value == nil)
        @throw [NSException exceptionWithName: @"InvalidArgument" reason: @"Attributes 'name' and 'value' mustn't be nil" userInfo: nil];
    
    [self.currentProperties setObject: value forKey: name];
}

@end
