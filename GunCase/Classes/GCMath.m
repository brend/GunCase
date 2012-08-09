//
//  GCMath.m
//  GunCase
//
//  Created by Philipp Brendel on 12.08.12.
//
//

#import "GCMath.h"

NSInteger GCNearestPowerOf2(NSInteger x)
{
    if (x <= 0)
        return 0;
    
    return exp2(ceil(log2(x)));
}
