//
//  GCGzipDecompressor.m
//  TheUnzipper
//
//  Created by Philipp Brendel on 17.08.12.
//  Copyright (c) 2012 Philipp Brendel. All rights reserved.
//

#import "GCTiledMapGzipDecompressor.h"

@implementation GCTiledMapGzipDecompressor

- (NSData *) decompress: (NSData *) compressedData
{
    static NSString *GCGunzipExecutablePath = @"/usr/bin/gunzip";
    
    if (![[NSFileManager defaultManager] fileExistsAtPath: GCGunzipExecutablePath]) {
        NSLog(@"gunzip not present at %@", GCGunzipExecutablePath);
        return nil;
    }
    
    NSTask *task = [[NSTask alloc] init];
    
    task.launchPath = GCGunzipExecutablePath;
    
    NSPipe
        *inpipe = [NSPipe pipe],
        *outpipe = [NSPipe pipe];
    
    task.standardInput = inpipe;
    task.standardOutput = outpipe;
        
    NSFileHandle
        *inputFile = [inpipe fileHandleForWriting],
        *outputFile = [outpipe fileHandleForReading];
    
    [task launch];
    
    [inputFile writeData: compressedData];
    [inputFile closeFile];
    
    NSData *decompressedData = [outputFile readDataToEndOfFile];
    
    // TODO: Handle standard error
    
    [task waitUntilExit];
    
    if (0 != task.terminationStatus) {
        NSLog(@"Error: gunzip task terminated with code %d", task.terminationStatus);
        return nil;
    }
    
    return decompressedData;
}

@end
