//
//  ColorblindImageView.h
//  Colorblind
//
//  Created by Tim Wood on 4/7/14.
//  Copyright (c) 2014 Tim Wood. All rights reserved.
//

#import "GPUImage.h"
#import "CBType.h"

@interface CBTypeView : GPUImageView

@property (nonatomic, strong) CBType *type;
@property (strong) GPUImageCropFilter *cropFilter;
@property (strong) GPUImageColorMatrixFilter *colorFilter;
@property (strong) UILabel *typeLabel;

@end
