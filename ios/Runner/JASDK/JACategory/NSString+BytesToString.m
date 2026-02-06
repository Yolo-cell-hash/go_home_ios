//
//  NSString+BytesToString.m
//  eseecloud
//
//  Created by haidong on 14/03/2018.
//  Copyright © 2018 juanvision. All rights reserved.
//

#import "NSString+BytesToString.h"

@implementation NSString (BytesToString)

+ (NSString *)bytesStrings:(NSUInteger)bytes {
    NSArray *unitArr = @[@"KB",@"MB",@"GB"]; //@[@"B",@"KB",@"MB",@"GB"];
    NSString *outStr;
    for (int i = 0; i < unitArr.count; i++) {
        outStr = [NSString stringWithFormat:@"%.1f %@",bytes*1.0/(1<<i*10),unitArr[i]];
        if (bytes < 1<<(i+1)*10) {
            break;
        }
    }
    return outStr;
}

@end
