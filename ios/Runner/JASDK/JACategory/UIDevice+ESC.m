//
//  UIDevice+ESC.m
//  eseecloud
//
//  Created by developer on 2022/6/15.
//  Copyright © 2022 juanvision. All rights reserved.
//

#import "UIDevice+ESC.h"

@implementation UIDevice (ESC)

+ (void)switchNewOrientation:(UIInterfaceOrientation)interfaceOrientation {
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        NSNumber * resetOrientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationUnknown];
        [[UIDevice currentDevice] setValue:resetOrientationTarget forKey:@"orientation"];
        NSNumber * orientationTarget = [NSNumber numberWithInt:(int)interfaceOrientation];
        [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
    }
}


@end
