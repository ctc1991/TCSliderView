//
//  TCSliderView.h
//  TCSliderViewDemo
//
//  Created by 程天聪 on 15/12/14.
//  Copyright © 2015年 ctc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TCSliderView;
@protocol TCSliderViewDelegate <NSObject>

- (void)sliderView:(TCSliderView *)sliderView slideAtPercent:(CGFloat)percent;

@end

@interface TCSliderView : UIView
@property (weak, nonatomic) id<TCSliderViewDelegate>delegate;
/** 当前百分比 */
@property (nonatomic) CGFloat percent;
/** 轨迹 */
@property (strong, nonatomic) UIView *trackView;
/** 轨迹颜色 */
@property (strong, nonatomic) UIColor *trackColor;
/** 滑块 */
@property (strong, nonatomic) UIView *sliderView;
/** 滑块图片 */
@property (strong, nonatomic) UIImage *sliderImage;
/** 背景 */
@property (strong, nonatomic) UIView *backgroundView;
/** 背景颜色 */
@property (strong, nonatomic) UIColor *backgroundViewColor;
/** 圆角 */
@property (nonatomic) CGFloat cornerRadius;

@end
