//
// Created by Chan Jason on 2017/7/19.
// Copyright (c) 2017 LiHong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    JAScreenTypeNormal = 0,
    JAScreenTypePanorama
} JAScreenType;

typedef enum : NSUInteger {
    JAPixelFrameFormatRGBA,
} JAPixelFrameFormat;


typedef enum : NSUInteger {
    JADeviceFixModeWall = 1,
    JADeviceFixModeCeil,
    JADeviceFixModeTable,
    JADeviceFixModeNone,
    JADeviceFixMode720,
} JADeviceFixMode;

typedef enum : NSUInteger {
    JAScreenDisplayModeNormal            = 0,
    JAScreenDisplayModeHemisphere,
    JAScreenDisplayModeCylinder,
    JAScreenDisplayModeExpand,
    JAScreenDisplayModeUpdown,
    JAScreenDisplayModeFour,
    JAScreenDisplayModeVR,
    JAScreenDisplayModeSphere,
    JAScreenDisplayModeThree,
    JAScreenDisplayModeSix,
    JAScreenDisplayModeModtionDetection,
    JAScreenDisplayModePanorama,
    JAScreenDisplayModeCircleDetection,
    JAScreenDisplayModeStitch,
    JAScreenDisplayModeCup,
    JAScreenDisplayModeFourex,
    JAScreenDisplayModeSphereVR,
    JAScreenDisplayModeStitch2,
}JAScreenDisplayMode;

typedef enum : NSUInteger {
    JAPanoramaScreenAnimationTypePosition = 0,
    JAPanoramaScreenAnimationTypeScale,
    JAPanoramaScreenAnimationTypeRotate,
    JAPanoramaScreenAnimationTypeTransparent,
    JAPanoramaScreenAnimationTypeLookAt,
} JAPanoramaScreenAnimationType;

typedef struct ja_coordinate {
    float x,y,z;
} JACoordinate;

///*********************
/// delegate
///*********************

@class JAScreen,JAFishEyeParam;

@protocol JAScreenDelegate <NSObject>

@optional

/**
 * @details 单击手势触发
 *
 * @param jaScreen 触发对象
 * @param singleTapGesture 触发手势对象
 * */
- (void)jaScreen:(JAScreen *)jaScreen onSingleTapGestureActived:(UITapGestureRecognizer *)singleTapGesture;

/**
 * @details 双击手势触发
 *
 * @param jaScreen 触发对象
 * @param doubleTapGesture 触发手势对象
 * */
- (void)jaScreen:(JAScreen *)jaScreen onDoubleTapGestureActived:(UITapGestureRecognizer *)doubleTapGesture;


- (BOOL)jaScreen:(JAScreen *)jaScreen GestureBegin:(UIGestureRecognizer *)gester;
- (void)jaScreen:(JAScreen *)jaScreen GestureChanged:(UIGestureRecognizer *)gester;
- (void)jaScreen:(JAScreen *)jaScreen GestureEnd:(UIGestureRecognizer *)gester;
///手势轻扫
- (void)jaScreen:(JAScreen *)panoramaScreen swipeAction:(UISwipeGestureRecognizer *)sender;
///手势放大缩小比例
- (void)jaScreen:(JAScreen *)jaScreen screenDidZoom:(CGFloat)zoomScale;
///全景设备放大缩小比例
- (void)jaScreen:(JAScreen *)jaScreen screenHemisphereDidZoom:(CGFloat)zoomScale;

@end

///*********************
/// Interface
///*********************

@interface JAScreen : UIView

@property (nonatomic, assign) JADeviceFixMode fixMode;      /**> 需要调用者set值，默认为JADeviceFixModeCeil */

@property (nonatomic, assign) JAScreenDisplayMode displayMode;

@property (nonatomic, assign) NSUInteger width;
@property (nonatomic, assign) NSUInteger height;

@property (nonatomic, assign) BOOL audioEnable;

/**
 在应用进入后台之后，请将此属性设置为NO，并且在应用回到前台时，将此属性设置为YES
 */
@property (nonatomic, assign) BOOL renderEnable;

@property (nonatomic, assign) id<JAScreenDelegate> delegate;

#pragma mark - Display

+ (instancetype)getInstanceWithFrame:(CGRect)frame ScreenType:(JAScreenType)screenType;

//进入预览预览时开启（监听对讲需要）
+ (void)startAuidoUnit;
//推送预览时停用（播放教学视频和播放添加提示音时需要）
+ (void)stopAudioUnit;

///设置画布缩放阈值
+ (void)setScaleMaxValue:(NSInteger)scaleMax;
///读取画布缩放阈值
+ (NSInteger)getScaleMaxValue;

/**
 显示解码后的数据   *需在主线程上调用

 @param frame 解码后的视频帧数据
 @param frameSize 数据大小
 @param width 视频宽
 @param height 视频高
 @param pixelFormat 像素格式
 @param timestamp 时间戳
 @param index coonector下标
 */
- (void)loadFrame:(void *)frame
        FrameSize:(NSUInteger)frameSize
            Width:(NSUInteger)width
           Height:(NSUInteger)height
      PixelFormat:(JAPixelFrameFormat)pixelFormat
        Timestamp:(NSUInteger)timestamp
            Index:(NSUInteger)index;

- (void)render;

- (void)playAudioFrame:(void *)frame size:(NSUInteger)frameSize sampleRate:(NSUInteger)sampleRate channelCount:(NSUInteger)channelCount bitrate:(NSUInteger)bitrate type:(NSUInteger)type index:(NSUInteger)index;

- (UIImage *)RGBA2UIImage:(uint8_t *)imageBytes ImageSize:(CGSize)imageSize;

- (void)setFishEyeParam:(NSArray <JAFishEyeParam *> *)params DistortionData:(NSData *)distData;
//(float centerx, float centery, float radius, float anglex, float angley, float anglez, int index,bool v720)
- (void)setFishEyeCenterX:(float)centerX
                  CenterY:(float)centery
                   Radius:(float)radius
                   AngleX:(float)angleX
                   AngleY:(float)angleY
                   AngleZ:(float)angleZ
                    Index:(int)index;

- (void)cleanFishEyeParam;

/**
 清屏
 */
- (void)cleanScreen;

- (void)cleanScreen:(NSUInteger)screenIndex;

- (void)updateAspect:(CGFloat)aspect;


/**
 截图
 */
- (UIImage *)capture;


/**
 录像

 @param savePath 保存路径
 */
- (void)recordStartWithPath:(NSString *)savePath;
- (void)recordStop:(void(^)(BOOL success))complete;

/**
 开始画面的平移、缩放、旋转动画
 
 @param animationType 动画类型
 @param coordinate 画面目标坐标点
 @param texture 是否贴图变化
 @param step 分多少步完成此次动画
 @param duration 动画过程持续时长
 @param isRepeat 是否为重复动画
 @param Inertia ？
 @param screenIndex 分屏下标，全景设备通常为0
 */
- (long)startAnimation:(JAPanoramaScreenAnimationType)animationType
            Coordinate:(JACoordinate)coordinate
      TextureTransform:(BOOL)texture
                  Step:(NSUInteger)step
              Duration:(NSUInteger)duration
              isRepeat:(BOOL)isRepeat
               Inertia:(BOOL)Inertia
           ScreenIndex:(NSUInteger)screenIndex
                  Flag:(int)flag;

- (void)showOSDWithBuffer:(NSData *)buffer;

/**
 获取画面的坐标信息
 
 @param coordinateType 坐标类型
 @param texture 是否为贴图变化
 @param screenIndex 分屏下标
 @return 坐标信息
 */
- (JACoordinate)getCoordinate:(JAPanoramaScreenAnimationType)coordinateType
                      Texture:(BOOL)texture
                  ScreenIndex:(NSUInteger)screenIndex;


- (void)cleanAnimation;
- (void)cleanAnimation:(NSUInteger)screenIndex;

- (void)setupGestures;
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer;
- (void)gestureRecognizerChnaged:(UIGestureRecognizer *)gestureRecognizer;
- (void)gestureRecognizerEnd:(UIGestureRecognizer *)gestureRecognizer;

- (void)setGSensorDataWithX:(double)x Y:(double)y Z:(double)z;
//是否要快速播放
- (void)changeCurrentPlayerModeToFastPlayerModeWith:(bool)isFastPlayer;
//获取当前是不是快进播放模式
- (BOOL)isFastPlayer;

@end
