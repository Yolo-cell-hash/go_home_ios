//
//  NSString+JACodeGenAndScan.m
//  eseecloud
//
//  Created by haidong on 25/04/2018.
//  Copyright © 2018 juanvision. All rights reserved.
//

#import "NSString+JACodeGenAndScan.h"


#define LT(key,table) [[JASettingLanguagesManager shareInstance] localizedStringForKey:@#key tableName: @#table]

@implementation NSString (JACodeGenAndScan)

+ (NSString *)ja_cancelText {
    return LT(cancel, JACodeGenAndScan);
}

+ (NSString *)ja_okText {
    return LT(confirm, JACodeGenAndScan);
}

+ (NSString *)ja_openCameraSettingText {
    return LT(setting_phone_open_camera, JACodeGenAndScan);
}

+ (NSString *)ja_openPhotoSettingText {
    return LT(setting_phone_selectAndWrite_options, JACodeGenAndScan);
}

+ (NSString *)ja_noPermissionText {
    return LT(competence_lack, JACodeGenAndScan);
}

+ (NSString *)ja_albumText {
    return LT(photo_album, JACodeGenAndScan);
}

+ (NSString *)ja_manullyText {
    return LT(adddevice_add_manully, JACodeGenAndScan);
}

+ (NSString *)ja_guideText {
    return LT(addDevice_point, JACodeGenAndScan);
}

+ (NSString *)ja_validText {
    return LT(addDevice_share_vailidTime, JACodeGenAndScan);
}

+ (NSString *)ja_secondsText {
    return LT(plural_ios, JACodeGenAndScan);
}

+ (NSString *)ja_shareText {
    return LT(share, JACodeGenAndScan);
}

+ (NSString *)ja_IDText {
    return LT(text_ID, JACodeGenAndScan);
}

+ (NSString *)ja_codeOutdatedMessage {
    return LT(addDevice_share_overdue, JACodeGenAndScan);
}
@end
