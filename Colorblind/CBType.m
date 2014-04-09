//
//  CBType.m
//  Colorblind
//
//  Created by Tim Wood on 4/7/14.
//  Copyright (c) 2014 Tim Wood. All rights reserved.
//

#import "CBType.h"

@implementation CBType

+ (NSArray *)findAll {
    CBType *normal = [CBType new];
    normal.name = @"Normal";
    normal.matrix = (GPUMatrix4x4){
        1, 0, 0, 0,
        0, 1, 0, 0,
        0, 0, 1, 0,
        0, 0, 0, 1
    };
    
    CBType *protanopia = [CBType new];
    protanopia.name = @"Protanopia";
    protanopia.matrix = (GPUMatrix4x4){
        0.567, 0.433, 0,     0,
        0.558, 0.442, 0,     0,
        0,     0.242, 0.758, 0,
        0,     0,     0,     1
    };
    
    CBType *protanomaly = [CBType new];
    protanomaly.name = @"Protanomaly";
    protanomaly.matrix = (GPUMatrix4x4){
        0.817, 0.183, 0,     0,
        0.333, 0.667, 0,     0,
        0,     0.125, 0.875, 0,
        0,     0,     0,     1
    };
    
    CBType *deuteranopia = [CBType new];
    deuteranopia.name = @"Deuteranopia";
    deuteranopia.matrix = (GPUMatrix4x4){
        0.625, 0.375, 0,   0,
        0.7,   0.3,   0,   0,
        0,     0.3,   0.7, 0,
        0,     0,     0,   1
    };
    
    CBType *deuteranomaly = [CBType new];
    deuteranomaly.name = @"Deuteranomaly";
    deuteranomaly.matrix = (GPUMatrix4x4){
        0.8,   0.2,   0,     0,
        0.258, 0.742, 0,     0,
        0,     0.142, 0.858, 0,
        0,     0,     0,     1
    };
    
    CBType *tritanopia = [CBType new];
    tritanopia.name = @"Tritanopia";
    tritanopia.matrix = (GPUMatrix4x4){
        0.95,  0.05,  0,     0,
        0,     0.433, 0.567, 0,
        0,     0.475, 0.525, 0,
        0,     0,     0,     1
    };
    
    CBType *tritanomaly = [CBType new];
    tritanomaly.name = @"Tritanomaly";
    tritanomaly.matrix = (GPUMatrix4x4){
        0.967, 0.033, 0,     0,
        0,     0.733, 0.267, 0,
        0,     0.183, 0.817, 0,
        0,     0,     0,     1
    };
    
    CBType *achromatopsia = [CBType new];
    achromatopsia.name = @"Achromatopsia";
    achromatopsia.matrix = (GPUMatrix4x4){
        0.299, 0.587, 0.114, 0,
        0.299, 0.587, 0.114, 0,
        0.299, 0.587, 0.114, 0,
        0,     0,     0,     1
    };
    
    CBType *achromatomaly = [CBType new];
    achromatomaly.name = @"Achromatomaly";
    achromatomaly.matrix = (GPUMatrix4x4){
        0.618, 0.320, 0.062, 0,
        0.163, 0.775, 0.062, 0,
        0.163, 0.320, 0.516, 0,
        0,     0,     0,     1
    };
    
    return @[
             normal,
             protanopia,
             protanomaly,
             deuteranopia,
             deuteranomaly,
             tritanopia,
             tritanomaly,
             achromatopsia,
             achromatomaly
             ];
}

@end
