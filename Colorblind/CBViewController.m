//
//  ViewController.m
//  Colorblind
//
//  Created by Tim Wood on 4/7/14.
//  Copyright (c) 2014 Tim Wood. All rights reserved.
//

#import "CBViewController.h"
#import "CBType.h"

@implementation CBViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.types = [CBType findAll];
    }
    return self;
}

- (void)viewDidLoad {
    self.camera = [[GPUImageVideoCamera alloc] initWithSessionPreset:AVCaptureSessionPreset640x480 cameraPosition:AVCaptureDevicePositionBack];
    self.camera.outputImageOrientation = UIInterfaceOrientationPortrait;
    [self.camera startCameraCapture];

    self.view.backgroundColor = [UIColor whiteColor];
    
    for (CBType *type in self.types) {
        CBTypeView *view = [[CBTypeView alloc] initWithFrame:CGRectZero];
        view.type = type;
        [self.view addSubview:view];
        [self.camera addTarget:view.cropFilter];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [view addGestureRecognizer:tap];
    }
    [self _updateLayout];
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    if (self.activeView) {
        self.activeView = nil;
    } else {
        self.activeView = (CBTypeView *)recognizer.view;
    }
    [self _updateLayout];
}

- (void)_updateLayoutAnimated {
    [UIView animateWithDuration:0.25 animations:^{
        [self _updateLayout];
    }];
}

- (void)_updateLayout {
    CGFloat count = self.view.subviews.count;
    CGFloat index = 0;
    CGFloat height = self.view.bounds.size.height - 2;
    CGFloat width  = self.view.bounds.size.width;
    
    BOOL reachedActiveView = NO;
    
    for (CBTypeView *view in self.view.subviews) {
        CGRect rect;
        
        view.hidden = NO;
        if (self.activeView) {
            if (view == self.activeView) {
                rect = CGRectInset(self.view.bounds, 2, 2);
                reachedActiveView = YES;
            } else {
                if (reachedActiveView) {
                    rect = CGRectMake(0, height - 1, width, 1);
                } else {
                    rect = CGRectMake(0, 0, width, 1);
                }
                view.hidden = YES;
            }
        } else {
            rect = self.view.bounds;
            rect.origin.y = 1 + index * height / count;
            rect.size.height = height / count;
            rect = CGRectInset(rect, 2, 1);
        }
        
        view.frame = rect;
        
        index++;
    }
}


@end
