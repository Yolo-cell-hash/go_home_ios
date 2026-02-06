//
//  NSMutableDictionary+JADeviceSetting.h
//  JAKitDemo
//
//  Created by Wynton on 2017/12/26.
//  Copyright © 2017年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary(JADeviceSetting)

- (id)ja_dictObj:(NSString *)key;
- (id)ja_arrObj:(NSString *)key;
- (id)ja_numberObj:(NSString *)key value:(NSNumber*)value;

@end
