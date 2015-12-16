//
//  ViewController.m
//  TCSliderViewDemo
//
//  Created by 程天聪 on 15/12/14.
//  Copyright © 2015年 ctc. All rights reserved.
//

#import "ViewController.h"
#import "TCSliderView.h"
#define Color(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define ColorWithAlpha(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

@interface ViewController () <TCSliderViewDelegate>
@property (weak, nonatomic) IBOutlet TCSliderView *sliderView2;
@property (strong, nonatomic) TCSliderView *sliderView;
@property (strong, nonatomic) TCSliderView *sliderView3;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _sliderView = [[TCSliderView alloc] initWithFrame:CGRectMake(100, 110, 240, 12)];
//    [self.view addSubview:_sliderView];
    _sliderView.backgroundColor = [UIColor clearColor];
    _sliderView.delegate = self;
    _sliderView.trackColor = Color(24, 63, 67);
    
    [_sliderView2 setTrackColor:[UIColor yellowColor]];
    
    _sliderView3 = [TCSliderView new];
    _sliderView3.frame = CGRectMake(100, 210, 240, 120);
    _sliderView3.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_sliderView3];
}


#pragma mark - TCSliderViewDelegate - Method 
- (void)sliderView:(TCSliderView *)sliderView slideAtPercent:(CGFloat)percent {
    NSLog(@"percent:%f",percent);
}


@end
