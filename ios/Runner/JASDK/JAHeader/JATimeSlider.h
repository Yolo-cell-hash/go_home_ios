//
//  WJTimer.h
//  WJTimerTest
//
//  Created by Wynton on 2016/12/21.
//  Copyright © 2016年 juanvision. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JATimeSlider,JARecordParagraph;
@protocol JATimeSliderDelegate <NSObject>

@optional
- (void)JATimeSlider:(JATimeSlider *)timeSlider CurrentTimeChanged:(NSTimeInterval)time;
- (void)JATimeSlider:(JATimeSlider *)timeSlider SlideEndWithTime:(NSTimeInterval)time;
- (void)JATimeSlider:(JATimeSlider *)timeSlider SlideBeginWithTime:(NSTimeInterval)time;
@end

@interface JATimeSlider : UIView

@property (nonatomic,assign) id <JATimeSliderDelegate> delegate;

@property (nonatomic, assign) NSTimeInterval currentTime;
@property (nonatomic, assign, readonly) NSTimeInterval leftTime;
@property (nonatomic, assign, readonly) NSTimeInterval rightTime;

@property (nonatomic, assign) CGFloat hourWidth;
@property (nonatomic, assign) CGFloat currentScale;
@property (nonatomic, assign) CGFloat maxScale;
@property (nonatomic, assign) CGFloat minScale;
@property (nonatomic, assign) CGFloat currentTimeLineX;
@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) NSArray *existPathTimesArr;
@property (nonatomic, strong) UIColor *existRecordPathColor;
@property (nonatomic, assign) CGFloat hourLineHeight;
@property (nonatomic, assign) CGFloat minLineHeight;

@property (nonatomic, assign) BOOL moving;
@property (nonatomic, assign) BOOL isParentViewDealloc;//父视图被释放了
//渲染视频段颜色
@property (nonatomic, strong) NSArray <UIColor *> *existRecordPathColorsArray;

@property (nonatomic, strong) NSArray<JARecordParagraph *> *existRecordTimeParagrapArr;
- (BOOL)cureentTimeNextRecordTimeParagrapContainTime:(NSInteger)time;
- (BOOL)cureentPlayTimeGreaterThanRecordLastTime:(NSInteger)time;
- (void)statusBarOrientationChangeEndResetTimerSlider;
- (void)stopScroll;//停止滚动
- (NSTimeInterval)firstItemStartTime;
- (NSTimeInterval)lastItemEndTime;
//重绘视图
- (void)reDrawView;
//横竖屏
- (void)refreshDerectionView:(BOOL)isHon;
@end


typedef NS_ENUM(NSInteger,JARecordParagraphType) {
    JARecordParagraphTypeTimingNone,
    JARecordParagraphTypeTimingVideo,  //定时录像
    JARecordParagraphTypeMobileVideo,  //移动录像
    JARecordParagraphTypeWarningVideo, //报警录像
    JARecordParagraphTypeManualVideo,  //手动录像
};

@interface JARecordParagraph : NSObject<NSCoding>

@property (nonatomic, assign) NSInteger startTime;
@property (nonatomic, assign) NSInteger endTime;
@property (nonatomic, assign) JARecordParagraphType recordType;

+ (instancetype)paragraphWithStartTime:(int)startTime EndTime:(int)endTime recordType:(int)recordType;

@end
