//
//  Macro.h
//  EApp
//  常用变量宏
//  Created by Duoling on 13-09-05.
//  Copyright (c) 2012年 yunange. All rights reserved.
//


#define UserInfo @"UserInfo"
#define UserInfo_id @"UserInfo_id"
#define UserInfo_companyId @"UserInfo_companyId"
#define UserInfo_mobile @"UserInfo_mobile"
#define UserInfo_password @"UserInfo_password"
#define UserInfo_salt @"UserInfo_salt"
#define UserInfo_status @"UserInfo_status"
#define UserInfo_realname @"UserInfo_realname"
#define UserInfo_isLogin @"UserInfo_isLogin"
#define UserInfo_avatar @"UserInfo_avatar"
#define UserInfo_sex @"UserInfo_sex"
#define UserInfo_addTime @"UserInfo_addTime"
#define UserInfo_updateTime @"UserInfo_updateTime"
#define UserInfo_del @"UserInfo_del"



#define StaffInfo @"StaffInfo"
#define StaffInfo_id @"StaffInfo_id"
#define StaffInfo_companyId @"StaffInfo_companyId"
#define StaffInfo_userId @"StaffInfo_userId"
#define StaffInfo_mobile @"StaffInfo_mobile"
#define StaffInfo_realname @"StaffInfo_realname"
#define StaffInfo_telToken @"StaffInfo_telToken"
#define StaffInfo_telPlatform @"StaffInfo_telPlatform"
#define StaffInfo_depId @"StaffInfo_depId"
#define StaffInfo_isDismission @"StaffInfo_isDismission"
#define StaffInfo_sex @"StaffInfo_sex"
#define StaffInfo_email @"StaffInfo_email"
#define StaffInfo_avatar @"StaffInfo_avatar"
#define StaffInfo_roleIds @"StaffInfo_roleIds"
#define StaffInfo_position @"StaffInfo_position"
#define StaffInfo_hasSub @"StaffInfo_hasSub"
#define StaffInfo_hasParent @"StaffInfo_hasParent"
#define StaffInfo_isAdmin @"StaffInfo_isAdmin"
#define StaffInfo_isBoss @"StaffInfo_isBoss"
#define StaffInfo_isLogin @"StaffInfo_isLogin"
#define StaffInfo_addTime @"StaffInfo_addTime"
#define StaffInfo_updateTime @"StaffInfo_updateTime"
#define StaffInfo_del @"StaffInfo_del"
#define StaffInfo_depName @"StaffInfo_depName"




#define StaffSessionInfo @"StaffSessionInfo"
#define StaffSessionInfo_staffId @"StaffSessionInfo_staffId"
#define StaffSessionInfo_userId @"StaffSessionInfo_userId"
#define StaffSessionInfo_sessionCode @"StaffSessionInfo_sessionCode"
#define StaffSessionInfo_endTime @"endTime"

#define SalesStageListInfo @"SalesStageListInfo"
#define DepartmentListInfo @"DepartmentListInfo"

//#define UserInfo_company  @"UserInfo_company"
//#define UserInfo_phone  @"UserInfo_phone"
//#define UserInfo_sex  @"UserInfo_sex"
//#define UserInfo_address  @"UserInfo_address"
//#define UserInfo_twoDimensionImageId @"UserInfo_twoDimensionImageId"
//#define UserInfo_realname  @"UserInfo_realname"
//#define UserInfo_id  @"UserInfo_id"
//#define UserInfo_sessionCode  @"UserInfo_sessionCode"
//#define UserInfo_menu  @"UserInfo_menu"
//
//#define UserInfo_Rolse  @"UserInfo_Rolse"
//
//#define  UserInfo_Url  @"UserInfo_Url"
//#define UserInfo_Logo @"UserInfo_Logo"
//#define UserInfo_contact @"UserInfo_contact"
//#define UserInfo_curInstructionType @"UserInfo_curInstructionType"
//
//#define UserInfo_companyId @"UserInfo_companyId"
//#define UserInfo_Staff  @"UserInfo_Staff"
//#define company_configure @"company_configure"
//#define UMENG_APPKEY  @"548f9c8cfd98c55192000d40"
//#define SharedAppDelegate ((CrmAppDelegate*)[[UIApplication sharedApplication] delegate])
#define ShowLog
#define StatsHeight  20
#define  TabberHeight 44
#define TimeOutSeconds    0.2*60

//#define ProductTypeViewTag  10086
//#define ProductTypeViewTextFieldTag  100


//#define  menuList  @[@{@"alias":@"instruction",@"image":@"1_1",@"highlightedImage":@"1_1_over",@"name":@"销售轨迹",@"viewClassName":@"LBS_LocusViewController"},  @{@"alias":@"workReport",@"image":@"1_2",@"highlightedImage":@"1_2_over",@"name":@"我的日报",@"viewClassName":@"LBSWorkReport_historyViewController"},    @{@"alias":@"myCustomer",@"image":@"1_3",@"highlightedImage":@"1_3_over",@"name":@"我的客户",@"viewClassName":@"LBSCustomerViewController"}, @{@"alias":@"addressList",@"image":@"2_1",@"highlightedImage":@"2_1_over",@"name":@"通讯录",@"viewClassName":@"LBSAddressController"},  @{@"alias":@"shareResource",@"image":@"2_2",@"highlightedImage":@"2_2_over",@"name":@"资料",@"viewClassName":@"LBSShareResourceViewController"}, @{@"alias":@"task",@"image":@"2_3",@"highlightedImage":@"2_3_over",@"name":@"任务",@"viewClassName":@"LBSTaskViewController"},   @{@"alias":@"myStaff",@"image":@"2_4",@"highlightedImage":@"2_4_over",@"name":@"我的员工",@"viewClassName":@"LBSStaffViewController"}, @{@"alias":@"staffReport",@"image":@"4_1",@"highlightedImage":@"4_1_over",@"name":@"员工日报",@"viewClassName":@"LBSWorkReportViewController"}, @{@"alias":@"setting",@"image":@"1_4",@"highlightedImage":@"1_4_over",@"name":@"个人设置",@"viewClassName":@"LBSUser_Setting2ViewController"}, @{@"alias":@"report",@"image":@"4_2",@"highlightedImage":@"4_2_over",@"name":@"报表",@"viewClassName":@"LBSRepert_WebInfoViewController"},      @{@"alias":@"attendance",@"image":@"4_3",@"highlightedImage":@"4_3_over",@"name":@"考勤",@"viewClassName":@"LBSAttendanceController"},   @{@"alias":@"notice",@"image":@"4_4",@"highlightedImage":@"4_4_over",@"name":@"公告",@"viewClassName":@"noticeDetail"},@{@"alias":@"taskAudit",@"image":@"audit_task",@"highlightedImage":@"audit_task_over",@"name":@"任务审批",@"viewClassName":@"LBSTaskAuditViewController"}  ,@{@"alias":@"attAudit",@"image":@"attAudit",@"highlightedImage":@"attAudit_over",@"name":@"考勤审批",@"viewClassName":@"LBSAttendance_SpControllerViewController"} ];





//#define customerstatus  @[@{@"name":@"初步跟进",@"value":@"0",@"color":@"7ecdf4"}, @{@"name":@"确定意向",@"value":@"1",@"color":@"87acd9"}, @{@"name":@"正式报价",@"value":@"2",@"color":@"8c98cc"}, @{@"name":@"签约成功",@"value":@"3",@"color":@"aa8abc"}, @{@"name":@"售后服务",@"value":@"4",@"color":@"c490c0"}, @{@"name":@"流失客户",@"value":@"5",@"color":@"eb6876"}]



#define FONTSIZE_NavigationTitle 20.0	//导航字,标题,板块文字

#define FONTSIZE_18 18.0	// 关键字

#define FONTSIZE_16 16.0	// 关键字
#define FONTSIZE_15 15.0	// 关键字
#define FONTSIZE_12 12.0	// 关键字
#define FONTSIZE_14 14.0	// 关键字
#define FONTSIZE_10 10.0	// 关键字


//颜色
#define COLOR_DARKBLACK @"333333"
#define COLOR_GRAY @"666666"
#define COLOR_LIGHTGRAY @"999999"
#define COLOR_ORGANGE @"ff7f00"

#define COLOR_SEPARATOR @"d0d0d0"
#define COLOR_BACKGROUND @"f9f9f9"

//#define  HotCoreDataNum 3
//#define  TopicsCoreDataNum 5
//#define  NewListCoreDataNum 10
//
//#define NewListShowNum  20
//#define TopListShowNum  20
//
//#define tabImageViewTag 10086
//#define bgImageViewTag 10087
//
//#define tabImageViewTag 10086
//#define bgImageViewTag 10087

#define GetCoverStaffUrl(A)   A;
#define GetCoverImageUrl(A)   A;
#define GetImageUrl(A)   A;
#define GetAMRUrl(A) A;

#define BARBUTTON(TITLE, SELECTOR)		[[UIBarButtonItem alloc] initWithTitle:TITLE style:UIBarButtonItemStylePlain target:self action:SELECTOR]//UIBarButtonItem
#define NUMBER(X) [NSNumber numberWithInt:X]

//#define KPHONELABELDICDEFINE		@"KPhoneLabelDicDefine"
//#define KPHONENUMBERDICDEFINE	@"KPhoneNumberDicDefine"
//#define KPHONENAMEDICDEFINE	@"KPhoneNameDicDefine"


#define SafeRelease(A) if ( A != nil ){[A release]; A = nil;};

#define filterString(A) [A isKindOfClass:[NSString class]]?A:@"";

#define SafeReleaseDelegate(A) [A setDelegate:nil];A=nil;
#define StrFromMoney(F)     [NSString stringWithFormat: @"%.2f", F]
#define StrFromFloat(F)     [NSString stringWithFormat: @"%f", F]
#define StrFromInteger(I)       [NSString stringWithFormat: @"%ld", I]

//#define StrFromdistance(I)     ((int)I<=0)?@"附近":   ((I/1000.0>10)?[NSString stringWithFormat: @"%.fkm",I/1000.0]:  [NSString stringWithFormat: @"%.2fkm",I/1000.0])


#define AddSuffix(S,suffix)    [NSString stringWithFormat: @"%@%@", S,suffix]
#define AddPrefix(prefix,S)    [NSString stringWithFormat: @"%@%@", prefix,S]

#define NumFromBOOL(B)      [NSNumber numberWithBool: B]
#define NumFromInt(I)       [NSNumber numberWithInt: I]
#define NumFromDouble(D)    [NSNumber numberWithDouble: D]
#define NumFromInteger(I)   [NSNumber numberWithInteger: I]

#define FormatStr(fmt, ...) [NSString stringWithFormat:fmt, ##__VA_ARGS__]


#define DEVICE_SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define DEVICE_SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define IS_IPhone4S ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_IPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_IPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_IPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_IOS7  (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7 )? YES : NO)
#define IS_IOS8  (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8 )? YES : NO)

#ifdef ShowLog

#define DLog(A) NSLog(@"Debug:%@", A)
#define ILog(A) NSLog(@"Info:%@", A)
#define ELog(A) NSLog(@"Error:%@", A)

#define DFLog(fmt, ...) NSLog((@"Debug: " fmt), ##__VA_ARGS__)
#define IFLog(fmt, ...) NSLog((@"Info: " fmt), ##__VA_ARGS__)
#define EFLog(fmt, ...) NSLog((@"Error: " fmt), ##__VA_ARGS__)
#else
#define DLog(A)
#define ILog(A)
#define ELog(A)

#define DFLog(fmt, ...)
#define IFLog(fmt, ...)
#define EFLog(fmt, ...)
#endif

#define FirstObjectOfArray(A) ([A count]>0)?[A objectAtIndex: 0]:nil

#define LastObjectOfArray(A) ([A count]>0)?[A objectAtIndex: ([A count]-1)]:nil


//debug stuff
#define ShowCurrentPosition NSLog(@"\n Function: %s\n Pretty function: %s\n Line: %d\n File: %s\n Object: %@",__func__, __PRETTY_FUNCTION__, __LINE__, __FILE__, button)

#define ShowCurrentLocation NSLog(@"Current selector: %@, Object class: %@, Filename: %@", NSStringFromSelector(_cmd), NSStringFromClass([self class]), [[NSString stringWithUTF8String:__FILE__] lastPathComponent])

#define ShowStackSymbols NSLog(@"Stack trace: %@", [NSThread callStackSymbols])
