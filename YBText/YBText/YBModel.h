//
//  YBModel.h
//  YBText
//
//  Created by FuYun on 2016/11/19.
//  Copyright © 2016年 FuYun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YBModel : NSObject

@property(nonatomic, assign) CGFloat r;
@property(nonatomic, assign) CGFloat centerX;
@property(nonatomic, assign) CGFloat centerY;
@property(nonatomic, assign) CGFloat jiaoDu;
@property(nonatomic, assign) CGFloat currentJiaoDu;
@property(nonatomic, strong) UIColor *color;

+ (instancetype)modelWithR:(CGFloat)r centerX:(CGFloat)centerX centerY:(CGFloat)centerY jiaoDu:(CGFloat)jiaoDu color:(UIColor *)color;

@end
