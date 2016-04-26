//
//  RootViewController_ipad.h
//  WACLighting
//
//  Created by apple on 1/13/12.
//  Copyright 2012 fgbfg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "specdatacustomcell_ipad.h"
#import "UITableViewCell+NIB.h"
#import <MessageUI/MFMailComposeViewController.h>

#import "JSON.h"
#import "JSONParser.h"
#import "MBProgressHUD.h"

#import "EGOCache.h"
#import "EGOImageView.h"

#import "beinspireCustomcell_ipad.h"
#import "exploreourproductscustomcell_ipad.h"

#import "beinspireDetailCustomcell_ipad.h"

#import "customealert.h"
#import "finalProductImg_ipad.h"

#import "ZoomViewController.h"

#import "ASIHttpParser.h"

#import "WACLightingAppDelegate.h"

#import "searchCustomCell_ipad.h"
#import "CustomSpecAlert.h"

#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

#import "ImageScrollView_inspire.h"
@class ImageScrollView_inspire;

@interface RootViewController_ipad : UIViewController <ABNewPersonViewControllerDelegate,UIGestureRecognizerDelegate,UIWebViewDelegate,MFMailComposeViewControllerDelegate,UIScrollViewDelegate,UITextViewDelegate,UITableViewDelegate,UITableViewDataSource>{

	WACLightingAppDelegate *appObj;
	BOOL InternetAccessibility;
	
	BOOL isMail;
	
	BOOL secroll_flag;
	
	UIWebView *myWebView;
	
	UIScrollView *myscroll;
	
	IBOutlet UIScrollView *zoomScroll;
	IBOutlet UIScrollView *productZoomScroll;
	
	IBOutlet UIPageControl *pageCntrl;
	
	MBProgressHUD *HUD;
	
	NSMutableArray *temp_arr;
	
	NSMutableArray *pathArray;
	
	IBOutlet UILabel *pathLbl;
	IBOutlet UILabel *pathLbl_gallary;
	
	BOOL isZoom;
	
	IBOutlet UIImageView *headerImage;
	
	//logo
	IBOutlet UIView *logo_view;
	
	//4main view
	IBOutlet UIView *product_view;
	IBOutlet UIView *inspired_view;
	IBOutlet UIView *specdata_view;
	IBOutlet UIView *connect_view;
	
	IBOutlet UIButton *product_btn;
	IBOutlet UIButton *inspired_btn;
	IBOutlet UIButton *specdata_btn;
	IBOutlet UIButton *connect_btn;
	
	IBOutlet UIButton *product_btn_big;
	IBOutlet UIButton *inspired_btn_big;
	IBOutlet UIButton *specdata_btn_big;
	IBOutlet UIButton *connect_btn_big;
	
	//4main sub view
	IBOutlet UIView *product_sub_view;
	IBOutlet UIView *inspired_sub_view;
	IBOutlet UIView *specdata_sub_view;
	IBOutlet UIView *connect_sub_view;
	
	
	NSMutableArray *mainCat_Array;
	NSMutableArray *subCat_Array;
	NSMutableArray *BeInspire_Array;
	NSMutableArray *subCat_lise_Array;
	NSMutableArray *spec_data_Array;
	NSMutableArray *spec_data_detail_Array;
	NSMutableArray *spec_data_final_Array;
	NSMutableArray *linesArray;
	NSMutableArray *product_final_Array;
	NSMutableArray *product_lvl3_Array;
	NSMutableArray *search_Array;
	
	IBOutlet UITableView *specdata_sub_tbl;
	
	IBOutlet UIView *inspired_subDetail_view;
	
	IBOutlet UIScrollView *inspired_scroll;
	
	//scroll
	IBOutlet UIScrollView *add_scroll;
	NSMutableArray *img_arr;
	int cxs;
	
	
	IBOutlet UIButton *back_btn;
	NSMutableArray *back_btn_tag_Arr;
	
	
	IBOutlet UITableView *product_tbl;
	NSMutableArray *val_array;
	IBOutlet UIView *show_product_view;
	
	
	IBOutlet UITableView *specdata_tbl;
	IBOutlet UIView *show_specdata_view;
	
	
	IBOutlet UIView *menu_view;
	BOOL menu_flag;
	
	IBOutlet UIView *search_view;
	IBOutlet UITextField *search_txt;
	BOOL search_flag;
	
	
	IBOutlet UIView *video_view;
	
	IBOutlet UITextField *connect_txt;
	
	IBOutlet UIView *image_detail;
	IBOutlet UIImageView *detail_img_view;
	
	UIImageView *img_cell_bk;
	
	IBOutlet UIView *productdetail_sub_view;
	
	IBOutlet UITableView *sub_detail_view;
	
	IBOutlet UIView *product_sub_detail;
	
	
	IBOutlet UITableView *BeInspire_Tbl_ipad;
	
	IBOutlet UITableView *exploreourproduct_tbl_ipad;
	
	IBOutlet UIImageView *BeInspire_detail_img;
	IBOutlet UITableView *BeInspire_useproduct_tbl_ipad;
	IBOutlet UILabel *BeInspire_detail_lbl;
	NSMutableArray *BeInspire_detail_lbl_array;
	
	IBOutlet UIView *scroll_view;
	IBOutlet UIView *scroll_view2;
	
	IBOutlet UITableView *spec_sub_detail_tbl;
	IBOutlet UIView *spec_sub_detail_view;
	
	IBOutlet UITableView *final_detail_tbl;
	IBOutlet UITableView *final_detail_row_tbl;
	
	
	
	IBOutlet UIButton *pdf1_btn;
	IBOutlet UIButton *pdf2_btn;
	IBOutlet UIButton *word_btn;
	
	IBOutlet UILabel *clickTozoomLbl;
	
	IBOutlet UITextField *email_contactus_txt;
	
	IBOutlet UIView *start_search_view;
	IBOutlet UITableView *start_search_tbl;
	
	NSURLConnection *conn;
    NSMutableData *webData;
	NSString *zipName;
	
	NSString *productlvl1Id;
	NSString *productlvl2Id;
	
	NSString *speclvl1Id;
	
	ASIHttpParser *Web_req;
    BOOL isLoded;
	IBOutlet UIActivityIndicatorView *myPgressIndicator;
	
	IBOutlet UIView *product_Lvl3_view;
	IBOutlet UITableView *product_Lvl3_tbl;
	
	IBOutlet UIButton *home_btn;
	
	NSMutableArray *arrayRes;
	
	NSMutableArray *search_array_second;
	IBOutlet UITableView *first_search_list_tbl;
	NSMutableArray *search_parh_arr;
	
	IBOutlet UITableView *menu_tbl;
	
	NSMutableArray *menu_arr;
	
	NSMutableSet *recycledPages;
    NSMutableSet *visiblePages;
	
	int           firstVisiblePageIndexBeforeRotation;
    CGFloat       percentScrolledIntoFirstVisiblePage;
	
	IBOutlet UIView *inspired_zoom_view;
	
	UIScrollView *pagingScrollView;
	
	NSString *web_home_str;
	
	IBOutlet UIBarButtonItem *mail_Web_btn;
	
	UIPrintInteractionController *printController;
	
	NSString *mailIDstr;
	
	BOOL spec_pdf_flag;
}

@property ( nonatomic  )BOOL isLoded;
@property ( nonatomic , retain )NSString *mailIDstr;
@property(nonatomic,retain)NSMutableArray *back_btn_tag_Arr;
@property(nonatomic,retain)NSMutableArray *mainCat_Array;
@property(nonatomic,retain)NSMutableArray *subCat_Array;
@property(nonatomic,retain)NSMutableArray *BeInspire_Array;
@property(nonatomic,retain)NSMutableArray *subCat_lise_Array;
@property(nonatomic,retain)NSMutableArray *BeInspire_detail_lbl_array;
@property(nonatomic,retain)NSMutableArray *spec_data_Array;
@property(nonatomic,retain)NSMutableArray *spec_data_detail_Array;
@property(nonatomic,retain)NSMutableArray *spec_data_final_Array;
@property(nonatomic,retain)NSMutableArray *linesArray;
@property(nonatomic,retain)NSMutableArray *product_final_Array;
@property(nonatomic,retain)NSMutableArray *product_lvl3_Array;
@property(nonatomic,retain)NSMutableArray *search_array_second;
@property(nonatomic,retain)NSMutableArray *search_Array;


//start
-(IBAction)start_application:(id)sender;

-(void)showHUD;
-(void)hideHUD;

//scroll
-(void)setScrollView;
-(void)dynamicScroll;
- (void)startTheBackgroundJob;

-(IBAction)back_btn_clicked:(id)sender;

-(void)show_productdetail_data:(int)product;

-(void)show_spec_data:(int)product;

-(IBAction)show_menu_view:(id)sender;
-(void)hide_menu_view:(id)sender;

-(void)show_sub_Lvl3detail_data:(int)product;

-(IBAction)show_search_view:(id)sender;
-(void)hide_search_view:(id)sender;

-(void)show_inspireDetail_view:(id)sender;
-(IBAction)hide_inspireDetail_view:(id)sender;

-(IBAction)show_videos:(id)sender;

-(IBAction)hide_detail_img:(id)val;

-(IBAction)email:(id)sender;
-(IBAction)call:(id)sender;

-(IBAction)show_productdetail_sub_data:(id)product;

-(IBAction)menuBtn_productClicked:(id)sender;
-(IBAction)menuBtn_inspiredClicked:(id)sender;
-(IBAction)menuBtn_connectClicked:(id)sender;
-(IBAction)menuBtn_specdataClicked:(id)sender;
-(IBAction)menuBtn_loginClicked:(id)sender;
-(IBAction)menuBtn_websiteClicked:(id)sender;
-(IBAction)menuBtn_quitClicked:(id)sender;
-(IBAction)menuBtn_BuyClicked:(id)sender;

-(void)scrollView_img_clicked:(id)sender;

-(void)show_sub_productdetail_data:(int)product;

-(void)viewsubspecshow:(id)sender;

-(void)fatch_Spec_Data:(NSString*)senderId;
-(void)fatch_productCat:(id)sender;
-(void)fatch_Sub_productCat:(NSString*)senderId;
-(void)fatch_BeInspireData:(NSString*)senderId;
-(void)fatch_Sub_productCat_listTbl:(NSString*)senderId;
-(void)fatch_Spec_Data_detail:(NSString*)senderId;
-(void)fatch_Spec_Data_final:(NSString*)senderId;
-(void)fatch_product_final:(NSString*)senderId;

-(IBAction)show_pdf1_clicked:(id)sender;
-(IBAction)show_pdf2_clicked:(id)sender;
-(IBAction)show_word_clicked:(id)sender;


-(IBAction)OnEmail_beinspiered:(id)sender;
-(IBAction)OnEmail_Contactus:(id)sender;

-(void)show_web_view:(NSString *)urlStr;

- (NSString *) getPath :(NSString *)fstr;
-(void)getYourBook:(NSString*)zipString;


-(IBAction)Btn_facebook_press;
-(IBAction)Btn_twitter_press;
-(IBAction)Btn_blogger_press;
-(IBAction)Btn_youtube_press;
-(IBAction)Btn_linkedin_press;

-(IBAction)Show_where_to_buy_clicked:(id)sender;

- (NSString *)decodeHTMLEntities:(NSString *)string;

-(void)show_productdetail_continue:(NSString*)strId;

-(void)loadScrollView:(NSMutableArray *)array;

-(void)final_product_fatch_data:(NSString *)strId;

-(IBAction)home_btn_clicked;

- (void)addGestureRecognizersToPiece:(UIView *)piece;
- (void)showResetMenu:(UISwipeGestureRecognizer *)gestureRecognizer;

-(void)fatch_search_data:(NSString*)senderId;
-(IBAction)search_btn_clicked;

-(void)show_search_tbl_view;
-(void)fatch_second_search_data:(NSString*)senderId;

-(void)select_view_spec:(NSString*)str:(NSString*)url;
-(void)select_mail_spec:(NSString*)str:(NSString*)url;

- (void)configurePage:(ImageScrollView_inspire *)page forIndex:(NSUInteger)index;
- (BOOL)isDisplayingPageForIndex:(NSUInteger)index;
- (CGRect)frameForPageAtIndex:(NSUInteger)index;
- (CGSize)contentSizeForPagingScrollView;
- (void)tilePages;
- (ImageScrollView_inspire *)dequeueRecycledPage;
- (NSUInteger)imageCount;
- (NSString *)imageAtIndex:(NSUInteger)index;

-(IBAction)Do_mail_InWeb_Clicked;
-(void)spec_mail_clicked:(NSString*)url Dict:(NSMutableDictionary*)dict;

-(IBAction)onHome:(id)sender;
-(IBAction)onRefresh:(id)sender;
-(IBAction)onforward:(id)sender;
-(IBAction)onBackward:(id)sender;

@end
