//
//  JAODMEnum.h
//  eseecloud
//
//  Created by Wynton on 2018/10/17.
//  Copyright © 2018 juanvision. All rights reserved.
//

#ifndef JAODMEnum_h
#define JAODMEnum_h

typedef NS_OPTIONS(NSUInteger, JADOMDisplayMode) {
    JADOMDisplayModeDefault    = 0,
    JADOMDisplayModeHemisphere = 1 << 0,
    JADOMDisplayModeCylinder   = 1 << 1,
    JADOMDisplayModeUpdown     = 1 << 2,
    JADOMDisplayModeFour       = 1 << 3,
    JADOMDisplayModeExpand     = 1 << 4,
    JADOMDisplayModeVR         = 1 << 5,
};

typedef NS_OPTIONS(NSUInteger, JAODMPlayerAbility) {
    JAODMPlayerAbilityDefault  = 0,
    JAODMPlayerAbilityPTZ      = 1 << 0,
    JAODMPlayerAbilityIntercom = 1 << 1,
    JAODMPlayerAbilityAudio    = 1 << 2,
};

typedef NS_OPTIONS(NSUInteger, JAODMPlayerScreenSplit) {
    JAODMPlayerScreenSplitDefault = 0,
    JAODMPlayerScreenSplit1 = 1 << 0,
    JAODMPlayerScreenSplit4 = 1 << 1,
    JAODMPlayerScreenSplit6 = 1 << 2,
    JAODMPlayerScreenSplit8 = 1 << 3,
    JAODMPlayerScreenSplit9 = 1 << 4,
    JAODMPlayerScreenSplit13 = 1 << 5,
    JAODMPlayerScreenSplit16 = 1 << 6,
};



#endif /* JAODMEnum_h */
