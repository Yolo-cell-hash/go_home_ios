//
//  NSString+JAVideoBackup.h
//  eseecloud
//
//  Created by Mr.Z on 2018/6/13.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JAVideoBackup)
+ (NSString *)ja_videobackup_videoBackup;
+ (NSString *)ja_videobackup_videoBackup_search;
+ (NSString *)ja_videobackup_setTime;
+ (NSString *)ja_videobackup_startTime;
+ (NSString *)ja_videobackup_endTime;
+ (NSString *)ja_videobackup_download;
+ (NSString *)ja_videobackup_startTimeYY;
+ (NSString *)ja_videobackup_startTimeMM;
+ (NSString *)ja_videobackup_startTimeDD;
+ (NSString *)ja_videobackup_startTimeHH;
+ (NSString *)ja_videobackup_startTimemm;
+ (NSString *)ja_videobackup_selectVideo;
+ (NSString *)ja_videobackup_loading;
+ (NSString *)ja_videobackup_continueLoading;
+ (NSString *)ja_videobackup_cancelLoading;
+ (NSString *)ja_videobackup_networkRate;
+ (NSString *)ja_videobackup_loadTips;
+ (NSString *)ja_videobackup_loadNum;
+ (NSString *)ja_videobackup_selectAll;
+ (NSString *)ja_videobackup_selectAllNot;


#pragma mark ---新增录像备份相关多语言 2019-11-29

/**网络不可用*/
+ (NSString *)ja_backup_networkAlert;
/**当前处于非WiFi网络，下载录像将消耗流量*/
+ (NSString *)ja_backup_download_traffic;
/**已下载成功*/
+ (NSString *)ja_backup_download_success;
/**查看*/
+ (NSString *)ja_backup_download_playback_view_download;
/**已下载%@个*/
+ (NSString *)ja_backup_playback_downloaded_ios;
/**已选%ld个*/
+ (NSString *)ja_backup_chosen_number_ios;
/**%ld个录像*/
+ (NSString *)ja_backup_devicesetting_Videobackup_videos_ios;
/**云录像下载*/
+ (NSString *)ja_backup_cloud_video_download;
/**下载中，请勿进行其他操作*/
+ (NSString *)ja_backup_playback_downloading;
/**中断下载会导致下载视频不全*/
+ (NSString *)ja_backup_palyback_interrupt_download;
/**确定中断*/
+ (NSString *)ja_backup_playback_break_download;
/**下载*/
+ (NSString *)ja_backup_deviceSetting_videoBackup_download;
/**下载中*/
+ (NSString *)ja_backup_Playback_downloading;
/**正在下载*/
+ (NSString *)ja_backup_deviceSetting_videoBackup_loading;
/**继续下载*/
+ (NSString *)ja_backup_deviceSetting_videoBackup_continueLoading;
/**取消下载*/
+ (NSString *)ja_backup_deviceSetting_videoBackup_cancelLoading;
/**下载失败*/
+ (NSString *)ja_backup_devicesetting_Videobackup_download_failed;
/**重新下载*/
+ (NSString *)ja_backup_devicesetting_Videobackup_download_again;
/**该录像已下载，确定是否继续下载*/
+ (NSString *)ja_backup_playback_download_again;
/**前往观看*/
+ (NSString *)ja_backup_playback_go_to_watch;
/**下载完成*/
+ (NSString *)ja_backup_download_complete;
/**取消*/
+ (NSString *)ja_cancel;
/**确定*/
+ (NSString *)ja_Sure;
/**TF卡录像下载*/
+ (NSString *)ja_backup_tf_card_download;
/**下载进展*/
+ (NSString *)ja_backup_tf_card_download_progress;
/**下载*/
+ (NSString *)ja_backup_tf_card_download_number;
/**下载进展（%@）*/
+ (NSString *)ja_backup_tf_card_progress_number_ios;
/**下载视频到《截图与录像》*/
+ (NSString *)ja_backup_tf_card_video_to_content;

/**正在下载*/
+ (NSString *)ja_backup_tf_card_downloading;
/**等待下载...*/
+ (NSString *)ja_backup_tf_card_wait_download;
/**下载失败（%@）个，已下载（%@）个*/
+ (NSString *)ja_backup_tf_card_download_fail_ios;
/**继续下载（%@）*/
+ (NSString *)ja_backup_tf_card_continue_download_ios;
/**手机空间已达到上限，请清理手机空间*/
+ (NSString *)ja_backup_tf_card_space_limit;


@end
