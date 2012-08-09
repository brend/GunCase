//
//  GCMath.h
//  GunCase
//
//  Created by Philipp Brendel on 12.08.12.
//
//


#define GCIsPowerOf2(x)		(((x) & ((x) - 1)) == 0)

NSInteger GCNearestPowerOf2(NSInteger x);
