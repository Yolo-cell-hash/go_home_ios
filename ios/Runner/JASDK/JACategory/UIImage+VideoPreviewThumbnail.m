//
//  UIImage+VideoPreviewThumbnail.m
//  eseecloud
//
//  Created by haidong on 07/03/2018.
//  Copyright © 2018 juanvision. All rights reserved.
//

#import "UIImage+VideoPreviewThumbnail.h"
#import <AVFoundation/AVFoundation.h>

@implementation UIImage (VideoPreviewThumbnail)

+ (UIImage *)videoThumbnailImageFromFilePathURL:(NSURL *)filePathURL {
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:filePathURL options:nil];
    AVAssetImageGenerator *assetGen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    assetGen.appliesPreferredTrackTransform = YES;
    CMTime time = CMTimeMakeWithSeconds(0.0, 600);
    NSError *error = nil;
    CMTime actualTime;
    CGImageRef image = [assetGen copyCGImageAtTime:time actualTime:&actualTime error:&error];
    UIImage *videoImage = [[UIImage alloc] initWithCGImage:image];
    CGImageRelease(image);
    return videoImage;
}

@end
