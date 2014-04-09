//
//  ViewController.h
//  Colorblind
//
//  Created by Tim Wood on 4/7/14.
//  Copyright (c) 2014 Tim Wood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPUImage.h"
#import "CBTypeView.h"

@interface CBViewController : UIViewController

@property (strong) GPUImageVideoCamera *camera;
@property (strong) NSArray *types;
@property (strong) CBTypeView *activeView;

@end
