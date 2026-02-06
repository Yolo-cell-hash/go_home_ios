//
//  JAODMPersonal.h
//  eseecloud
//
//  Created by Wynton on 2018/10/17.
//  Copyright © 2018 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, JAODMPersonalItem) {
    JAODMPersonalItemCaptureAndRecord = 1 << 0,
    JAODMPersonalItemBackup           = 1 << 1,
    JAODMPersonalItemAlarmMessage     = 1 << 2,
    JAODMPersonalItemSettings         = 1 << 3,
    JAODMPersonalItemShareManager     = 1 << 4,
    JAODMPersonalItemHelps            = 1 << 5,
    JAODMPersonalItemPrivacyPolicy    = 1 << 6,
    JAODMPersonalItemCompanyProfile   = 1 << 7,
    JAODMPersonalItemStatement        = 1 << 8,
    JAODMPersonalItemCloudStore       = 1 << 9,
};

NS_ASSUME_NONNULL_BEGIN

@interface JAODMPersonal : NSObject

@property (nonatomic, assign) JAODMPersonalItem horizontalItem;
@property (nonatomic, assign) JAODMPersonalItem ListItem;
@property (nonatomic, assign) BOOL HistoryDateEnable;
@property (nonatomic, assign) BOOL userHeaderImageEnable;

- (void)setup;

@end

NS_ASSUME_NONNULL_END
