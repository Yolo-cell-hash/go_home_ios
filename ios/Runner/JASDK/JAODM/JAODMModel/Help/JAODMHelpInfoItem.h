//
//  JAODMHelpInfoItem.h
//  WJFileTool
//
//  Created by OneJun on 2018/5/14.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>

//typedef NS_ENUM(NSUInteger, JAODMHelpInfoItemType) {
//    JAODMHelpInfoItemTypeText,
//    JAODMHelpInfoItemTypeImage,
//};

typedef NS_ENUM(NSUInteger, JAODMHelpInfoItemType) {
    JAODMHelpInfoItemTypeString,
    JAODMHelpInfoItemTypeImage,
    JAODMHelpInfoItemImageString,
    JAODMHelpInfoItemImageCenter //图片居中显示
};


@interface JAODMHelpInfoItem : NSObject

//@property (nonatomic, strong) id value;
//@property (nonatomic, assign) NSInteger textSize;
//@property (nonatomic, copy) NSString *textColor;
//@property (nonatomic, assign) NSInteger type;
//@property (nonatomic, assign) BOOL blod;


@property (nonatomic, assign) JAODMHelpInfoItemType type;
@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont *font;

@property (nonatomic, assign) CGSize imgSize;
@property (nonatomic, assign) CGFloat height;

@property (nonatomic, strong) NSString *language;

@property (nonatomic, strong) NSString *inlineImage;

@property (nonatomic, assign) CGSize inlineImageSize;

+ (instancetype)modelsWithJSON:(NSDictionary *)json;

@end
