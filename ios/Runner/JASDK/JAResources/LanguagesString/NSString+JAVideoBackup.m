//
//  NSString+JAVideoBackup.m
//  eseecloud
//
//  Created by Mr.Z on 2018/6/13.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import "NSString+JAVideoBackup.h"
#import "JASettingLanguagesManager.h"

#define BackupSTRING(_KEY) [[JASettingLanguagesManager shareInstance] localizedStringForKey:_KEY tableName: @"JAVideoBackup"]
@implementation NSString (JAVideoBackup)
//录像备份
+ (NSString *)ja_videobackup_videoBackup {
    return BackupSTRING (@"deviceSetting_videoBackup");
}
+ (NSString *)ja_videobackup_videoBackup_search {
    return BackupSTRING (@"deviceSetting_videoBackup_search");
}
+ (NSString *)ja_videobackup_setTime {
    return BackupSTRING (@"deviceSetting_videoBackup_setTime");
}
+ (NSString *)ja_videobackup_startTime {
    return BackupSTRING (@"deviceSetting_videoBackup_startTime");
}
+ (NSString *)ja_videobackup_endTime {
    return BackupSTRING (@"deviceSetting_videoBackup_endTime");
}
+ (NSString *)ja_videobackup_download {
    return BackupSTRING (@"deviceSetting_videoBackup_download");
}
+ (NSString *)ja_videobackup_startTimeYY {
    return BackupSTRING (@"deviceSetting_videoBackup_startTimeYY");
}
+ (NSString *)ja_videobackup_startTimeMM {
    return BackupSTRING (@"deviceSetting_videoBackup_startTimeMM");
}
+ (NSString *)ja_videobackup_startTimeDD {
    return BackupSTRING (@"deviceSetting_videoBackup_startTimeDD");
}
+ (NSString *)ja_videobackup_startTimeHH {
    return BackupSTRING (@"deviceSetting_videoBackup_startTimeHH");
}
+ (NSString *)ja_videobackup_startTimemm {
    return BackupSTRING (@"deviceSetting_videoBackup_startTimemm");
}
+ (NSString *)ja_videobackup_selectVideo {
    return BackupSTRING (@"deviceSetting_videoBackup_selectVideo");
}
+ (NSString *)ja_videobackup_loading {
    return BackupSTRING (@"deviceSetting_videoBackup_loading");
}
+ (NSString *)ja_videobackup_continueLoading {
    return BackupSTRING (@"deviceSetting_videoBackup_continueLoading");
}
+ (NSString *)ja_videobackup_cancelLoading {
    return BackupSTRING (@"deviceSetting_videoBackup_cancelLoading");
}
+ (NSString *)ja_videobackup_networkRate {
    return BackupSTRING (@"deviceSetting_videoBackup_networkRate");
}
+ (NSString *)ja_videobackup_loadTips {
    return BackupSTRING (@"deviceSetting_videoBackup_loadTips");
}
+ (NSString *)ja_videobackup_loadNum {
    return BackupSTRING (@"deviceSetting_videoBackup_loadNum");
}
+ (NSString *)ja_videobackup_selectAll {
    return BackupSTRING (@"selectAll");
}
+ (NSString *)ja_videobackup_selectAllNot {
    return BackupSTRING (@"selectAll_cancel");
}


#pragma mark ---新增录像备份相关多语言 2019-11-29

/**网络不可用*/
+ (NSString *)ja_backup_networkAlert
{
    return BackupSTRING (@"myDevice_networkAlert");
}

/**当前处于非WiFi网络，下载录像将消耗流量*/
+ (NSString *)ja_backup_download_traffic
{
    return BackupSTRING (@"playback_download_traffic");
}
/**已下载成功*/
+ (NSString *)ja_backup_download_success
{
    return BackupSTRING (@"playback_download_success");
}
/**查看*/
+ (NSString *)ja_backup_download_playback_view_download
{
    return BackupSTRING (@"playback_view_download");
}
/**已下载%@个*/
+ (NSString *)ja_backup_playback_downloaded_ios
{
    return BackupSTRING (@"playback_downloaded_ios");
}
/**已选%ld个*/
+ (NSString *)ja_backup_chosen_number_ios
{
    return BackupSTRING (@"chosen_number_ios");
}
/**%ld个录像*/
+ (NSString *)ja_backup_devicesetting_Videobackup_videos_ios
{
    return BackupSTRING (@"devicesetting_Videobackup_videos_ios");
}
/**云录像下载*/
+ (NSString *)ja_backup_cloud_video_download
{
    return BackupSTRING (@"playback_cloud_video_download");
}
/**下载中，请勿进行其他操作*/
+ (NSString *)ja_backup_playback_downloading
{
    return BackupSTRING (@"playback_downloading");
}
/**中断下载会导致下载视频不全*/
+ (NSString *)ja_backup_palyback_interrupt_download
{
    return BackupSTRING (@"palyback_interrupt_download");
}
/**确定中断*/
+ (NSString *)ja_backup_playback_break_download
{
    return BackupSTRING (@"playback_break_download");
}
/**下载*/
+ (NSString *)ja_backup_deviceSetting_videoBackup_download
{
    return BackupSTRING (@"deviceSetting_videoBackup_download");
}
/**下载中*/
+ (NSString *)ja_backup_Playback_downloading
{
    return BackupSTRING (@"Playback_downloading");
}
/**正在下载*/
+ (NSString *)ja_backup_deviceSetting_videoBackup_loading
{
    return BackupSTRING (@"deviceSetting_videoBackup_loading");
}
/**继续下载*/
+ (NSString *)ja_backup_deviceSetting_videoBackup_continueLoading
{
    return BackupSTRING (@"deviceSetting_videoBackup_continueLoading");
}
/**取消下载*/
+ (NSString *)ja_backup_deviceSetting_videoBackup_cancelLoading
{
    return BackupSTRING (@"deviceSetting_videoBackup_cancelLoading");
}
/**下载失败*/
+ (NSString *)ja_backup_devicesetting_Videobackup_download_failed
{
    return BackupSTRING (@"devicesetting_Videobackup_download_failed");
}
/**重新下载*/
+ (NSString *)ja_backup_devicesetting_Videobackup_download_again
{
    return BackupSTRING (@"devicesetting_Videobackup_download_again");
}
/**该录像已下载，确定是否继续下载*/
+ (NSString *)ja_backup_playback_download_again
{
    return BackupSTRING (@"playback_download_again");
}
/**前往观看*/
+ (NSString *)ja_backup_playback_go_to_watch
{
    return BackupSTRING (@"playback_go_to_watch");
}

/**下载完成*/
+ (NSString *)ja_backup_download_complete
{
    return BackupSTRING (@"download_complete");
}
/**取消*/
+ (NSString *)ja_cancel
{
    return BackupSTRING (@"cancel");
}
/**确定*/
+ (NSString *)ja_Sure
{
    return BackupSTRING (@"confirm");
}
/**TF卡录像下载*/
+ (NSString *)ja_backup_tf_card_download
{
    return BackupSTRING (@"playback_tf_card_download");
}

/**下载进展*/
+ (NSString *)ja_backup_tf_card_download_progress
{
    return BackupSTRING (@"preview_download_progress");
}
/**下载*/
+ (NSString *)ja_backup_tf_card_download_number
{
    return BackupSTRING (@"preview_download_number_ios");
}
/**下载进展（%@）*/
+ (NSString *)ja_backup_tf_card_progress_number_ios
{
    return BackupSTRING (@"preview_download_progress_number_ios");
}
/**下载视频到《截图与录像》*/
+ (NSString *)ja_backup_tf_card_video_to_content
{
    return BackupSTRING (@"preview_download_video_to_content");
}

/**正在下载*/
+ (NSString *)ja_backup_tf_card_downloading
{
    return BackupSTRING (@"preview_downloading");
}
/**等待下载...*/
+ (NSString *)ja_backup_tf_card_wait_download
{
    return BackupSTRING (@"preview_wait_download");
}
/**下载失败（%@）个，已下载（%@）个*/
+ (NSString *)ja_backup_tf_card_download_fail_ios
{
    return BackupSTRING (@"preview_download_fail_ios");
}
/**继续下载（%@）*/
+ (NSString *)ja_backup_tf_card_continue_download_ios
{
    return BackupSTRING (@"preview_continue_download_ios");
}
/**手机空间已达到上限，请清理手机空间*/
+ (NSString *)ja_backup_tf_card_space_limit
{
    return BackupSTRING (@"preview_phone_space_limit");
}

@end
