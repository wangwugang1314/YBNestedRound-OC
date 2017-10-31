//
//  YBView.m
//  YBText
//
//  Created by FuYun on 2016/11/19.
//  Copyright © 2016年 FuYun. All rights reserved.
//

#import "YBView.h"
#import "YBModel.h"

#define CenterLintPointY 200

@interface YBView ()

@property(nonatomic, strong) NSTimer *timer;
@property(nonatomic, strong) NSArray *yuanArr;
@property(nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation YBView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(timerFunc) userInfo:nil repeats:YES];
        self.dataArr = [NSMutableArray array];
        for (NSInteger i = 0; i < 100; i++) {
            [self.dataArr addObject:@(CenterLintPointY)];
        }
        
    }
    return self;
}

- (void)timerFunc {
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef ref = UIGraphicsGetCurrentContext();
    [self.yuanArr enumerateObjectsUsingBlock:^(YBModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx != 0) {
            YBModel *beforeModel = self.yuanArr[idx - 1];
            CGFloat jiaoDu = obj.currentJiaoDu * M_PI / 180;
            obj.centerX = beforeModel.centerX + beforeModel.r * cos(jiaoDu);
            obj.centerY = beforeModel.centerY + beforeModel.r * sin(jiaoDu);
        }
        CGContextSetFillColorWithColor(ref, obj.color.CGColor);
        CGContextAddArc(ref, obj.centerX, obj.centerY, obj.r, 0, M_PI * 2, true);
        CGContextFillPath(ref);
        obj.currentJiaoDu += obj.jiaoDu;
    }];
    YBModel *lastModel = self.yuanArr.lastObject;
    CGContextMoveToPoint(ref, lastModel.centerX, lastModel.centerY);
    [self.dataArr removeLastObject];
    [self.dataArr insertObject:@(lastModel.centerY) atIndex:0];
    [self.dataArr enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGContextAddLineToPoint(ref, 400 + 3 * idx, obj.floatValue);
    }];
    CGContextSetStrokeColorWithColor(ref, [UIColor orangeColor].CGColor);
    CGContextSetLineWidth(ref, 3);
    CGContextStrokePath(ref);
}

- (NSArray *)yuanArr {
    if(_yuanArr == nil){
        _yuanArr = @[[YBModel modelWithR:70 centerX:CenterLintPointY centerY:CenterLintPointY jiaoDu:1 color:[UIColor redColor]],
                     [YBModel modelWithR:50 centerX:CenterLintPointY centerY:CenterLintPointY jiaoDu:2 color:[UIColor grayColor]],
                     [YBModel modelWithR:40 centerX:CenterLintPointY centerY:CenterLintPointY jiaoDu:3 color:[UIColor blueColor]],
                     [YBModel modelWithR:30 centerX:CenterLintPointY centerY:CenterLintPointY jiaoDu:4 color:[UIColor purpleColor]],
                     [YBModel modelWithR:20 centerX:CenterLintPointY centerY:CenterLintPointY jiaoDu:5 color:[UIColor orangeColor]]];
    }
    return _yuanArr;
}

@end
