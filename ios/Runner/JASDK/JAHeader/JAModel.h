//
//  JAModel.h
//  eseecloud
//
//  Created by haidong on 10/02/2018.
//  Copyright © 2018 juanvision. All rights reserved.
//

#ifndef JAModel_h
#define JAModel_h

#if __OBJC__

typedef NS_ENUM(NSInteger, JADeviceConnectionStatus) {
    JADeviceConnectionStatusNone = 0,
    JADeviceConnectionStatusConnecting =1,
    JADeviceConnectionStatusConnected = 2,
    JADeviceConnectionStatusAuthFailed = 3,
    JADeviceConnectionStatusFailed = 4,
    JADeviceConnectionStatusDisconnected = 5
};

#endif

#endif /* JAModel_h */
