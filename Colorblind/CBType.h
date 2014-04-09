//
//  CBType.h
//  Colorblind
//
//  Created by Tim Wood on 4/7/14.
//  Copyright (c) 2014 Tim Wood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GPUImage.h"

@interface CBType : NSObject

@property GPUMatrix4x4 matrix;
@property CGFloat femalePercentage;
@property CGFloat malePercentage;
@property NSString *name;

+ (NSArray *)findAll;

@end
