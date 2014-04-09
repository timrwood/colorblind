//
//  ColorblindImageView.m
//  Colorblind
//
//  Created by Tim Wood on 4/7/14.
//  Copyright (c) 2014 Tim Wood. All rights reserved.
//

#import "CBTypeView.h"
#import <QuartzCore/QuartzCore.h>

@implementation CBTypeView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.fillMode = kGPUImageFillModeStretch;
        
        self.cropFilter = [[GPUImageCropFilter alloc] init];
        self.colorFilter = [[GPUImageColorMatrixFilter alloc] init];
        
        [self.cropFilter addTarget:self.colorFilter];
        [self.colorFilter addTarget:self];
        
        self.typeLabel = [[UILabel alloc] initWithFrame:CGRectInset(self.bounds, 10, 0)];
        self.typeLabel.font = [UIFont fontWithName:@"AvenirNext-Heavy" size:24];
        self.typeLabel.textColor = [UIColor whiteColor];
        self.typeLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:self.typeLabel];
        
        self.layer.cornerRadius = 4;
    }
    return self;
}

- (void)setType:(CBType *)type {
    _type = type;
    self.typeLabel.text = type.name.uppercaseString;
    self.colorFilter.colorMatrix = type.matrix;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self _updateCropRegion];
    [self _updateLabels];
}

- (void)_updateLabels {
    CGRect labelRect = CGRectInset(self.bounds, 10, 10);
    labelRect.size.height = MIN(labelRect.size.height, 100);
    self.typeLabel.frame = labelRect;
}

- (void)_updateCropRegion {
    if (!self.superview) {
        return;
    }
    
    CGFloat w = self.superview.frame.size.width;
    CGFloat h = self.superview.frame.size.height;
    CGFloat parentWOverH = w / h;
    CGFloat targetWOverH = 2.0 / 3.0;
    
    if (parentWOverH > targetWOverH) {
        h = w / targetWOverH;
    } else {
        w = h * targetWOverH;
    }
    
    CGRect frame = self.frame;
    frame.origin.x -= w * 0.5;
    frame.origin.y -= h * 0.5;
    
    frame.origin.x /= w;
    frame.origin.y /= h;
    frame.size.width  /= w;
    frame.size.height /= h;
    
    frame.origin.x += 0.5;
    frame.origin.y += 0.5;
    
    frame.size.width  = MAX(1.0 / 400.0, frame.size.width);
    frame.size.height = MAX(1.0 / 600.0, frame.size.height);
    
    self.cropFilter.cropRegion = frame;
}

@end
