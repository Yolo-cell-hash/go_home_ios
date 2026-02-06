//
//  JAODMPlayerInfo.m
//  eseecloud
//
//  Created by Wynton on 2018/10/16.
//  Copyright © 2018 juanvision. All rights reserved.
//

#import "JAODMPlayerInfo.h"
#import "UIColor+JAColor.h"

#define JA_FILE_NAME @"PreviewPlayback.json"

@implementation JAODMPlayerInfo

- (void)setup
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:JA_FILE_NAME ofType:nil];
    NSData *data = [[NSData alloc] initWithContentsOfFile:filePath];
    // 对数据进行JSON格式化并返回字典形式
    NSDictionary *info = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//     = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    
    //Color
    NSDictionary *colorDict = [info objectForKey:@"Color"];
    JAODMPlayerColor *color = [JAODMPlayerColor new];
    color.backgoundColor = [UIColor ja_hexadecimalColor:[colorDict objectForKey:@"BackgroundColor"]];
    color.navBarColor = [UIColor ja_hexadecimalColor:[colorDict objectForKey:@"NavBarColor"]];
    color.toolBarColor = [UIColor ja_hexadecimalColor:[colorDict objectForKey:@"ToolBarColor"]];
    color.buttonSelectedColor = [UIColor ja_hexadecimalColor:[colorDict objectForKey:@"ButtonSelectedColor"]];
    color.videoBorderColor = [UIColor ja_hexadecimalColor:[colorDict objectForKey:@"VideoBorderColor"]];
    color.timingRecordColor = [UIColor ja_hexadecimalColor:[colorDict objectForKey:@"TimingRecordColor"]];
    color.moveRecordColor = [UIColor ja_hexadecimalColor:[colorDict objectForKey:@"MoveRecordColor"]];
    
    //是否进入预览时先加载最后一次播放的图片
    self.isLoadingLastPicture = [info objectForKey:@"LoadingLastPicture"];
    self.interface = [[info objectForKey:@"Interface"] integerValue]; //预览页面，1代表3.3.0之后的新预览，0代表3.3.0之前的旧预览
    
    //DeviceOption
    JAODMPlayerDeviceOption *option = [JAODMPlayerDeviceOption new];

    JAODMPlayerSingleDevice *singleDevice = [JAODMPlayerSingleDevice new];

    JAODMPlayerPanoramaDevice *panoramaDevice = [JAODMPlayerPanoramaDevice new];
    JAODMPlayer180 *dev180 = [JAODMPlayer180 new];
    JAODMPlayerInstallMode *dev180InstallMode = [JAODMPlayerInstallMode new];
    JAODMPlayerInstallModeInfo *dev180Ceil = [JAODMPlayerInstallModeInfo new];
    JAODMPlayerInstallModeInfo *dev180Wall = [JAODMPlayerInstallModeInfo new];

    JAODMPlayer360 *dev360 = [JAODMPlayer360 new];
    JAODMPlayerInstallMode *dev360InstallMode = [JAODMPlayerInstallMode new];
    JAODMPlayerInstallModeInfo *dev360Ceil = [JAODMPlayerInstallModeInfo new];
    JAODMPlayerInstallModeInfo *dev360Wall = [JAODMPlayerInstallModeInfo new];

    JAODMPlayerPatrol *dev180CeilPatrol = [JAODMPlayerPatrol new];
    JAODMPlayerPatrol *dev180wallPatrol = [JAODMPlayerPatrol new];
    JAODMPlayerPatrol *dev360CeilPatrol = [JAODMPlayerPatrol new];
    JAODMPlayerPatrol *dev360wallPatrol = [JAODMPlayerPatrol new];
    
    JAODMPlayerGeneralDevice *generalDevice = [JAODMPlayerGeneralDevice new];

    JAODMPlayerNVR *nvr = [JAODMPlayerNVR new];
    JAODMPlayerGateway *gateway = [JAODMPlayerGateway new];

    JAODMPlayerVideoRatio *generalVideoRatio = [JAODMPlayerVideoRatio new];
    JAODMPlayerVideoRatio *nvrRatio = [JAODMPlayerVideoRatio new];
    JAODMPlayerVideoRatio *gatewayRatio = [JAODMPlayerVideoRatio new];
    
    generalDevice.videoRatio = generalVideoRatio;
    nvr.videoRatio = nvrRatio;
    gateway.videoRatio = gatewayRatio;
    
    self.color = color;
    self.deviceOption = option;
    option.singleDevice = singleDevice;
    option.nvr = nvr;
    option.gateway = gateway;

    singleDevice.panoramaDevice = panoramaDevice;
    singleDevice.generalDevice = generalDevice;
    
    panoramaDevice.dev180 = dev180;
    panoramaDevice.dev360 = dev360;
    
    dev180.installMode = dev180InstallMode;
    dev360.installMode = dev360InstallMode;
    
    dev180InstallMode.ceil = dev180Ceil;
    dev180InstallMode.wall = dev180Wall;
    
    dev360InstallMode.ceil = dev360Ceil;
    dev360InstallMode.wall = dev360Wall;
    
    dev180Ceil.patrol = dev180CeilPatrol;
    dev180Wall.patrol = dev180wallPatrol;
    dev360Ceil.patrol = dev360CeilPatrol;
    dev360Wall.patrol = dev360wallPatrol;
    
    
    
    dev180CeilPatrol.enable = info[@"DeviceOption"][@"SingleDevice"][@"Panorama"][@"180"][@"InstallMode"][@"ceil"][@"Patrol"][@"Enable"];
    dev180CeilPatrol.defaultStart = info[@"DeviceOption"][@"SingleDevice"][@"Panorama"][@"180"][@"InstallMode"][@"ceil"][@"Patrol"][@"DefaultStart"];
    
    dev180wallPatrol.enable = info[@"DeviceOption"][@"SingleDevice"][@"Panorama"][@"180"][@"InstallMode"][@"wall"][@"Patrol"][@"Enable"];
    dev180wallPatrol.defaultStart = info[@"DeviceOption"][@"SingleDevice"][@"Panorama"][@"180"][@"InstallMode"][@"wall"][@"Patrol"][@"DefaultStart"];
    
    dev360CeilPatrol.enable = info[@"DeviceOption"][@"SingleDevice"][@"Panorama"][@"360"][@"InstallMode"][@"ceil"][@"Patrol"][@"Enable"];
    dev360CeilPatrol.defaultStart = info[@"DeviceOption"][@"SingleDevice"][@"Panorama"][@"360"][@"InstallMode"][@"ceil"][@"Patrol"][@"DefaultStart"];
    
    dev360wallPatrol.enable = info[@"DeviceOption"][@"SingleDevice"][@"Panorama"][@"360"][@"InstallMode"][@"wall"][@"Patrol"][@"Enable"];
    dev360wallPatrol.defaultStart = info[@"DeviceOption"][@"SingleDevice"][@"Panorama"][@"360"][@"InstallMode"][@"wall"][@"Patrol"][@"DefaultStart"];
    
    
    dev180Ceil.enable = info[@"DeviceOption"][@"SingleDevice"][@"Panorama"][@"180"][@"InstallMode"][@"ceil"][@"Enable"];
    dev180Ceil.displayMode = [info[@"DeviceOption"][@"SingleDevice"][@"Panorama"][@"180"][@"InstallMode"][@"ceil"][@"DisplayMode"] integerValue];
    dev180Ceil.defaultDisplayMode = [info[@"DeviceOption"][@"SingleDevice"][@"Panorama"][@"180"][@"InstallMode"][@"ceil"][@"DefaultDisplayMode"] integerValue];
    
    dev180Wall.enable = info[@"DeviceOption"][@"SingleDevice"][@"Panorama"][@"180"][@"InstallMode"][@"wall"][@"Enable"];
    dev180Wall.displayMode = [info[@"DeviceOption"][@"SingleDevice"][@"Panorama"][@"180"][@"InstallMode"][@"wall"][@"DisplayMode"] integerValue];
    dev180Wall.defaultDisplayMode = [info[@"DeviceOption"][@"SingleDevice"][@"Panorama"][@"180"][@"InstallMode"][@"wall"][@"DefaultDisplayMode"] integerValue];
    
    
    dev360Ceil.enable = info[@"DeviceOption"][@"SingleDevice"][@"Panorama"][@"360"][@"InstallMode"][@"ceil"][@"Enable"];
    dev360Ceil.displayMode = [info[@"DeviceOption"][@"SingleDevice"][@"Panorama"][@"360"][@"InstallMode"][@"ceil"][@"DisplayMode"] integerValue];
    dev360Ceil.defaultDisplayMode = [info[@"DeviceOption"][@"SingleDevice"][@"Panorama"][@"360"][@"InstallMode"][@"ceil"][@"DefaultDisplayMode"] integerValue];
    
    dev360Wall.enable = info[@"DeviceOption"][@"SingleDevice"][@"Panorama"][@"360"][@"InstallMode"][@"wall"][@"Enable"];
    dev360Wall.displayMode = [info[@"DeviceOption"][@"SingleDevice"][@"Panorama"][@"360"][@"InstallMode"][@"wall"][@"DisplayMode"] integerValue];
    dev360Wall.defaultDisplayMode = [info[@"DeviceOption"][@"SingleDevice"][@"Panorama"][@"360"][@"InstallMode"][@"wall"][@"DefaultDisplayMode"] integerValue];
    
    dev180.defaultInstallMode = [info[@"DeviceOption"][@"SingleDevice"][@"Panorama"][@"180"][@"DefaultInstallMode"] integerValue];
    dev180.ability = [info[@"DeviceOption"][@"SingleDevice"][@"Panorama"][@"180"][@"Ability"] integerValue];
    
    dev360.defaultInstallMode = [info[@"DeviceOption"][@"SingleDevice"][@"Panorama"][@"360"][@"DefaultInstallMode"] integerValue];
    dev360.ability = [info[@"DeviceOption"][@"SingleDevice"][@"Panorama"][@"360"][@"Ability"] integerValue];
    
    generalDevice.ability = [info[@"DeviceOption"][@"SingleDevice"][@"General"][@"Ability"] integerValue];
    generalDevice.videoRatio.enable = [info[@"DeviceOption"][@"SingleDevice"][@"General"][@"VideoRatio"][@"Enable"] boolValue];
    generalDevice.videoRatio.defaultRatio = info[@"DeviceOption"][@"SingleDevice"][@"General"][@"VideoRatio"][@"VideoRatio"];
    generalDevice.videoRatio.ratioOptions = info[@"DeviceOption"][@"SingleDevice"][@"General"][@"VideoRatio"][@"VideoRatioOptions"];
    
    nvr.screenSplit = [info[@"DeviceOption"][@"NVR"][@"ScreenSplit"] integerValue];
    nvr.ability = [info[@"DeviceOption"][@"NVR"][@"Ability"] integerValue];
    nvr.videoRatio.enable = [info[@"DeviceOption"][@"NVR"][@"VideoRatio"][@"Enable"] boolValue];;
    nvr.videoRatio.defaultRatio = info[@"DeviceOption"][@"NVR"][@"VideoRatio"][@"VideoRatio"];
    nvr.videoRatio.ratioOptions = info[@"DeviceOption"][@"NVR"][@"VideoRatio"][@"VideoRatioOptions"];
    
    gateway.ability = [info[@"DeviceOption"][@"Gateway"][@"Ability"] integerValue];
    gateway.videoRatio.enable = [info[@"DeviceOption"][@"Gateway"][@"VideoRatio"][@"Enable"] boolValue];;
    gateway.videoRatio.defaultRatio = info[@"DeviceOption"][@"Gateway"][@"VideoRatio"][@"VideoRatio"];
    gateway.videoRatio.ratioOptions = info[@"DeviceOption"][@"Gateway"][@"VideoRatio"][@"VideoRatioOptions"];
}



@end
