//
//  JAODMThirdpartyItem.h
//  WJFileTool
//
//  Created by OneJun on 2018/5/14.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, JAODMThirdpartyItemType) {
    JAODMThirdpartyItemTypeWeChat,
    JAODMThirdpartyItemTypeQQ,
    JAODMThirdpartyItemTypeGoogle,
};

@interface JAODMThirdpartyItem : NSObject

@property (nonatomic, assign) JAODMThirdpartyItemType type;
@property (nonatomic, copy) NSString *key;
@property (nonatomic, assign) BOOL isEnble;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name;

- (instancetype)initWithType:(JAODMThirdpartyItemType)type Key:(NSString *)key Enble:(BOOL)enble Icon:(NSString *)icon Name:(NSString *)name;

@end
