//
//  YBModel.m
//  YBText
//
//  Created by FuYun on 2016/11/19.
//  Copyright © 2016年 FuYun. All rights reserved.
//

#import "YBModel.h"

@implementation YBModel

+ (instancetype)modelWithR:(CGFloat)r centerX:(CGFloat)centerX centerY:(CGFloat)centerY jiaoDu:(CGFloat)jiaoDu color:(UIColor *)color{
    YBModel *model = [YBModel new];
    model.r = r;
    model.centerX = centerX;
    model.centerY = centerY;
    model.jiaoDu = jiaoDu;
    model.color = color;
    return model;
}

@end
