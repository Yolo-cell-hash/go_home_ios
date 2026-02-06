//
//  UIAlertController+JA.m
//  Module360
//
//  Created by Wynton on 2018/8/13.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import "UIAlertController+JA.h"


@implementation UIAlertController(JA)

+ (instancetype)ja_showAlertWithTitle:(NSString *)title
                                 Message:(NSString *)msg
                                 Buttons:(NSArray *)buttons
                           SelectedBlock:(void(^)(NSInteger selectedIndex))selectedBlock
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    for (int i = 0; i < buttons.count; i++) {
        NSString *btnStr = [buttons objectAtIndex:i];
        [alert addAction:[UIAlertAction actionWithTitle:btnStr style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (selectedBlock) {
                selectedBlock(i);
            }
        }]];
    }
    return alert;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
