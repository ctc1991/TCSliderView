//
//  TCSliderView.m
//  TCSliderViewDemo
//
//  Created by 程天聪 on 15/12/14.
//  Copyright © 2015年 ctc. All rights reserved.
//

#import "TCSliderView.h"

#define Color(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define ColorWithAlpha(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

@interface TCSliderView ()
@property (strong, nonatomic) UIImageView *iv;
@end

@implementation TCSliderView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    if (!_trackView) {
        [self initSelf];
    }
    // 背景
    _backgroundView.frame = CGRectMake(0, rect.size.height*0.25, rect.size.width, rect.size.height*0.5);
    // 滑块
    CGFloat radius = rect.size.height*1.5*0.5*0.5;
    _sliderView.frame = CGRectMake(-radius, rect.size.height*0.5-radius, radius*2, radius*2);
    if (_sliderImage) {
        _iv.frame = _sliderView.bounds;
        [_sliderView addSubview:_iv];
        _sliderView.backgroundColor = [UIColor clearColor];
    } else {
        _sliderView.layer.masksToBounds = YES;
        _sliderView.layer.cornerRadius = radius;
    }
    // 轨迹
    _trackView.frame = CGRectMake(0, self.bounds.size.height*0.25, 0, self.bounds.size.height*0.5);
    // 处理圆角
    if (_cornerRadius) {
        _backgroundView.layer.masksToBounds = YES;
        _backgroundView.layer.cornerRadius = _cornerRadius;
        _trackView.layer.masksToBounds = YES;
        _trackView.layer.cornerRadius = _cornerRadius;
    }
    if (_backgroundViewColor) {
        _backgroundView.backgroundColor = _backgroundViewColor;
    }
    if (_trackColor) {
        _trackView.backgroundColor = _trackColor;
    }
}

- (void)initSelf {
    [self setBackgroundView];
    [self setTrackView];
    [self setSliderView];
}

- (void)setSliderView {
    _sliderView = [UIView new];
    _sliderView.backgroundColor = [UIColor blueColor];
    [self addSubview:_sliderView];
}

- (void)setTrackView {
    _trackView = [UIView new];
    _trackView.backgroundColor = [UIColor blackColor];
    [self addSubview:_trackView];
}

- (void)setBackgroundView {
    _backgroundView = [UIView new];
    _backgroundView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_backgroundView];
}

- (void)setSliderImage:(UIImage *)sliderImage {
    _sliderImage = sliderImage;
    _iv = [[UIImageView alloc] initWithImage:sliderImage];
    _iv.contentMode = UIViewContentModeScaleAspectFill;
}

/**
 *  返回当前百分比
 */
- (CGFloat)percent {
    return _sliderView.center.x/self.bounds.size.width;
}

// 手势操作
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    [UIView animateWithDuration:0.12 animations:^{
        [self setSliderXwithTouchPoint:p];
        [self sliderMove];
    }];
    [_delegate sliderView:self slideAtPercent:self.percent];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    [self setSliderXwithTouchPoint:p];
    [self sliderMove];
    [_delegate sliderView:self slideAtPercent:self.percent];
}

/**
 *  轨道长度变化
 */
- (void)sliderMove {
    CGRect frame = _trackView.frame;
    frame.size.width = _sliderView.center.x;
    _trackView.frame = frame;
}

/**
 *  设置滑块的位置
 *
 *  @param point 触碰的点
 */
- (void)setSliderXwithTouchPoint:(CGPoint)point {
    if (point.x<0) {
        point.x = 0;
    }
    if (point.x>self.bounds.size.width) {
        point.x = self.bounds.size.width;
    }
    CGPoint center = _sliderView.center;
    center.x = point.x;
    _sliderView.center = center;
}


@end
