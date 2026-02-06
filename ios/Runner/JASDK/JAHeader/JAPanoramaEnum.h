//
//  JAPanoramaEnum.h
//  eseecloud
//
//  Created by Mr.Z on 2018/6/4.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#ifndef JAPanoramaEnum_h
#define JAPanoramaEnum_h

typedef enum : NSInteger {
    JADeviceSceneTypeUnknow = -1,
    JADeviceSceneTypeNormal = 0,
    JADeviceSceneType180 = 180,
    JADeviceSceneType360 = 360,
    JADeviceSceneType720 = 720,
}JADeviceSceneType;

typedef NS_ENUM(NSInteger,DeviceChannelType) {
    DeviceChannelTypeFishEye,  //鱼眼
    DeviceChannelTypeSingle,   //单品，cx、cxs
    DeviceChannelTypeGATEWAY,  //gateway
    DeviceChannelTypeNVR       //nvr
};

typedef NS_ENUM(NSInteger,JADeviceFixType) {
    JADeviceFixNone = -1, //没有
    JADeviceFixWall, //壁装
    JADeviceFixCeil  //吊装
};



#endif /* JAPanoramaEnum_h */
