//
//  Macros.h
//  GunBelt
//
//  Created by Philipp Brendel on 04.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#ifndef GunBelt_Macros_h
#define GunBelt_Macros_h

#pragma mark -
#pragma mark Macros
#define GBIsPowerOf2(x)		(((x) & ((x) - 1)) == 0)
#define GBFindPowerOf2(x)	(exp2(ceil(log2((x)))))
#define GBSign(x)			(((x) >= 0) - ((x) <= 0))

#endif
