//
//  JAMutableScreen.h
//  Module360
//
//  Created by Wynton on 2018/8/10.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JAVideoPlayer.h"
#import "JAConnector.h"

typedef NS_ENUM(NSUInteger, JAMutableScreenSplit) {
    JAMutableScreenSplitChannel1,
    JAMutableScreenSplitChannel2,
    JAMutableScreenSplitChannel3,
    JAMutableScreenSplitChannel4,
    JAMutableScreenSplitMutable4
};
@class JAMutableScreen;

@protocol JAMutableScreenDelegate <NSObject>

- (void)sendFirstImage:(UIImage *)image WithChannel:(NSInteger)channel;

@end


@interface JAMutableScreen : UIView<JAConnectordataSource>

@property (nonatomic, assign) JAMutableScreenSplit split;
@property (nonatomic, assign) JAVideoPlayer *currentScreen;
@property (nonatomic, assign) BOOL soundOn;
@property (nonatomic, assign) id<JAMutableScreenDelegate> delegate;
@property (nonatomic, assign) NSInteger selectIndex;
- (void)setSplit:(JAMutableScreenSplit)split Animated:(BOOL)animated;
- (void)resetScreen;
- (JAVideoPlayer *)getVideoWithIndex:(NSInteger)index;
@end
