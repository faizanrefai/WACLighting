//
//  RootViewController.h
//  WACLighting
//
//  Created by apple on 12/22/11.
//  Copyright 2011 fgbfg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
//#import "videoview.h"
#import "UITableViewCell+NIB.h"
#import "specdatacustomcell.h"
#import <MessageUI/MFMailComposeViewController.h>
#import "JSON.h"
#import "JSONParser.h"
#import "MBProgressHUD.h"
#import "exploreourproductscustomcell.h"
#import "beinspireCustomcell.h"
#import "EGOCache.h"
#import "EGOImageView.h";
#import "customealert.h"
#import "beinspireDetailCustomcell.h"
#import "finalProductImg.h"
#import "ZoomViewController.h"
#import "searchCustomCell.h"

#import "ASIHttpParser.h";

#import "WACLightingAppDelegate.h"

#import "CustomSpecAlert.h"

#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

#import "ImageScrollView_inspire.h"

@class ImageScrollView_inspire;

@interface RootViewController : UIViewController <ABNewPersonViewControllerDelegate,SpecDelegate,UIGestureRecognizerDelegate,UIWebViewDelegate, MFMailComposeViewControllerDelegate,UIScrollViewDelegate,UITextFieldDelegate,UITextViewDelegate,UITableViewDelegate,UITableViewDataSource> {
	
	WACLightingAppDelegate *appObj_iphone;
	BOOL InternetAccessibility;
	
    
    UIInterfaceOrientation savedOrientation;
    
	UIScrollView *myscroll;
	
	NSURLConnection *conn;
    NSMutableData *webData;
	NSString *zipName;
	
	IBOutlet UIPageControl *pageCntrl;
	
	BOOL menu_flag;
	BOOL search_flag;
	
	MBProgressHUD *HUD;
	
	IBOutlet UITableView *BeInspire_Tbl;
	NSMutableArray *BeInspire_Array;
	
	IBOutlet UIView *scroll_back_view;
	
	NSMutableArray *back_btn_tag_Arr;
	
	IBOutlet UIButton *btn1_view1;
	IBOutlet UIButton *btn2_view2;
	IBOutlet UIButton *btn3_view3;
	IBOutlet UIButton *btn4_view4;
	
	
	NSMutableArray *mainCat_Array;
	NSMutableArray *subCat_Array;
	NSMutableArray *subCat_lise_Array;
	NSMutableArray *Product_Detail_Array;
	NSMutableArray *spec_data_Array;
	NSMutableArray *spec_data_detail_Array;
	NSMutableArray *spec_data_final_Array;
	NSMutableArray *product_final_Array;
	NSMutableArray *search_Array;
	NSMutableArray *product_lvl3_Array;
	NSMutableArray *search_array_second;
	
	
	IBOutlet UIButton *product_btn_big;
	IBOutlet UIButton *inspired_btn_big;
	IBOutlet UIButton *specdata_btn_big;
	IBOutlet UIButton *connect_btn_big;
	
	IBOutlet UIImageView *headerImage;
	
	IBOutlet UIView *my1View;
	IBOutlet UIView *my2View;
	IBOutlet UIView *my3View;
	IBOutlet UIView *my4View;
	
	
	IBOutlet UIView *logoView;
	
	IBOutlet UIView *footer_view;
	
	IBOutlet UIView *productView_my1View;
	IBOutlet UIView *inspiredView_my2View;
	IBOutlet UIView *connectView_my3View;
	IBOutlet UIView *specdataView_my4View;
	
	NSTimer *timer;
	
	IBOutlet UITableView *product_tbl;
	
	
	IBOutlet UIScrollView *inspired_scroll;
	
	IBOutlet UIButton *back_btn;
	
	NSMutableArray *table_array;
	
	NSMutableArray *val_array;
	
	CGFloat animatedDistance;
	
	IBOutlet UIScrollView *add_scroll;
	IBOutlet UIView *add_scroll_view;
	
	IBOutlet UIScrollView *zoomScroll;
	
	IBOutlet UIView *inspired_zoom_view;
	
	UIScrollView *pagingScrollView;
	
	int cxs;
	
	int count;
	
	BOOL secroll_flag;
	
	NSMutableArray *img_arr;
	
	IBOutlet UIWebView *myWebView;
	IBOutlet UIView *web_view;
	UIButton *bk_web_btn;
	
	IBOutlet UIView *menu_view;
	UIButton *bk_menu_btn;
	
	IBOutlet UIView *header_view;
	
	IBOutlet UITableView *specdata_tbl;
	
	IBOutlet UIView *specdata_sub_view;
	IBOutlet UITableView *specdata_sub_tbl;
	UIButton *bk_speddata_btn;
	
	IBOutlet UIView *product_detail;
	IBOutlet UIButton *bk_product_btn;
	
	IBOutlet UIView *productdetail_sub_view;
	
	IBOutlet UIView *beinspired_detail_view;
	
	
	IBOutlet UIView *image_detail;
	IBOutlet UIImageView *detail_img_view;
	
	
	IBOutlet UIView *search_view;
	UIButton *bk_search_btn;
	IBOutlet UITextField *searchtxt;
	IBOutlet UITableView *first_search_list_tbl;
	
	
	IBOutlet UITableView *sub_detail_view;
	
	IBOutlet UIView *product_sub_detail;
	
	
	IBOutlet UITableView *exploreourproduct_tbl;
	
	UIImageView *img_cell_bk;
	
	
	IBOutlet UIImageView *BeInspire_detail_img;
	IBOutlet UITableView *BeInspire_useproduct_tbl;
	IBOutlet UILabel *BeInspire_detail_lbl;
	NSMutableArray *BeInspire_detail_lbl_array;
	BOOL isMail;
	
	UIWebView *myWebView1;
	
	IBOutlet UITableView *spec_sub_detail_tbl;
	IBOutlet UIView *spec_sub_detail_view;
	
	
	IBOutlet UITableView *final_detail_tbl;
	
	IBOutlet UILabel *final_product_lbl;
	
	IBOutlet UITableView *final_detail_row_tbl;
	NSMutableArray *linesArray;
	
	IBOutlet UILabel *clickTozoomLbl;
	
	IBOutlet UIButton *pdf1_btn;
	IBOutlet UIButton *pdf2_btn;
	IBOutlet UIButton *word_btn;
	
	IBOutlet UITextField *email_contactus_txt;
	
	NSMutableArray *pathArray;
	
	IBOutlet UILabel *pathLbl;
	IBOutlet UILabel *pathLbl_gallary;
	
	IBOutlet UIView *start_search_view;
	IBOutlet UITableView *start_search_tbl;
	
	NSString *productlvl1Id;
	NSString *productlvl2Id;
	
	NSString *speclvl1Id;
	
	ASIHttpParser *Web_req;
    BOOL isLoded;
	
	IBOutlet UIActivityIndicatorView *myPgressIndicator;
	
	
	IBOutlet UIView *product_Lvl3_view;
	IBOutlet UITableView *product_Lvl3_tbl;
	
	IBOutlet UIButton *home_btn;
	
	IBOutlet UIScrollView *productZoomScroll;
	
	NSMutableArray *arrayRes;
	
	NSMutableArray *search_parh_arr;
	
	
	IBOutlet UITableView *menu_tbl;
	
	NSMutableArray *menu_arr;
	
	NSMutableSet *recycledPages;
    NSMutableSet *visiblePages;
	
	int           firstVisiblePageIndexBeforeRotation;
    CGFloat       percentScrolledIntoFirstVisiblePage;
	
	NSString *web_home_str;
	
	IBOutlet UIBarButtonItem *mail_Web_btn;
	
	UIPrintInteractionController *printController;
	
	BOOL spec_pdf_flag;
	
	NSString *mailIDstr;
}

@property ( nonatomic  )BOOL isLoded;

@property ( nonatomic , retain )NSString *mailIDstr;
@property ( nonatomic , retain ) NSMutableArray *mainCat_Array;
@property ( nonatomic , retain ) NSMutableArray *subCat_Array;
@property ( nonatomic , retain ) NSMutableArray *subCat_lise_Array;
@property ( nonatomic , retain ) NSMutableArray *BeInspire_Array;
@property ( nonatomic , retain ) NSMutableArray *Product_Detail_Array;
@property ( nonatomic , retain ) NSMutableArray *BeInspire_detail_lbl_array;
@property ( nonatomic , retain ) NSMutableArray *spec_data_Array;
@property ( nonatomic , retain ) NSMutableArray *spec_data_detail_Array;
@property ( nonatomic , retain ) NSMutableArray *spec_data_final_Array;
@property ( nonatomic , retain ) NSMutableArray *product_final_Array;
@property ( nonatomic , retain ) NSMutableArray *linesArray;
@property ( nonatomic , retain ) NSMutableArray *search_Array;
@property ( nonatomic , retain ) NSMutableArray *product_lvl3_Array;
@property ( nonatomic , retain ) NSMutableArray *search_array_second;



@property ( nonatomic , retain ) NSMutableArray *table_array;


-(void)spec_mail_clicked:(NSString*)url Dict:(NSMutableDictionary*)dict;

-(IBAction)Do_mail_InWeb_Clicked;

-(IBAction)home_btn_clicked;

-(void)beinspired_detail:(id)sender;
-(IBAction)show_video;
-(IBAction)menu_btn_clicked;
-(void)setAddressView;

-(IBAction)search_btn_clicked;

-(IBAction)SelectView_clicked:(id)sender;

-(void)show_spec_data:(int)product;
-(void)show_productdetail_data:(int)product;

-(IBAction)close_beinspired_detail;

-(void)show_detail_img:(id)val;

-(IBAction)close_image_detail;

-(IBAction)show_search_view;

-(IBAction)back_btn_clicked:(id)sender;

-(void)show_sub_Lvl3detail_data:(int)product;

-(void)close_webview;
-(void)close_menu_view;
-(void)close_search_view;

-(IBAction)email:(id)sender;
-(IBAction)call:(id)sender;

-(void)show_productdetail_sub_data:(id)product;

-(IBAction)menuBtn_productClicked:(id)sender;
-(IBAction)menuBtn_inspiredClicked:(id)sender;
-(IBAction)menuBtn_connectClicked:(id)sender;
-(IBAction)menuBtn_specdataClicked:(id)sender;
-(IBAction)menuBtn_loginClicked:(id)sender;
-(IBAction)menuBtn_websiteClicked:(id)sender;
-(IBAction)menuBtn_quitClicked:(id)sender;
-(IBAction)menuBtn_BuyClicked:(id)sender;

-(void)scrollView_img_clicked:(id)sender;
//-(void)selectView_afterMenuClicked:(id)sender;

-(IBAction)Show_where_to_buy_clicked:(id)sender;

-(void)show_sub_productdetail_data:(int)product;


-(void)showHUD;
-(void)hideHUD;


-(void)fatch_productCat:(id)sender;
-(void)fatch_Sub_productCat:(NSString*)senderId;
-(void)fatch_Sub_productCat_listTbl:(NSString*)senderId;
-(void)fatch_BeInspireData:(NSString*)senderId;
//-(void)fatch_product_detail:(int)senderId;
-(void)fatch_Spec_Data:(NSString*)senderId;
-(void)fatch_Spec_Data_detail:(NSString*)senderId;
-(void)fatch_Spec_Data_final:(NSString*)senderId;
-(void)fatch_product_final:(NSString*)senderId;
-(void)fatch_search_data:(NSString*)senderId;



-(IBAction)show_pdf1_clicked:(id)sender;
-(IBAction)show_pdf2_clicked:(id)sender;
-(IBAction)show_word_clicked:(id)sender;

-(IBAction)OnEmail_beinspiered:(id)sender;
-(IBAction)OnEmail_Contactus:(id)sender;

-(void)show_web_view:(NSString *)urlStr;

-(void)final_image_zoom:(id)sender;

-(IBAction)Btn_facebook_press;
-(IBAction)Btn_twitter_press;
-(IBAction)Btn_blogger_press;
-(IBAction)Btn_youtube_press;
-(IBAction)Btn_linkedin_press;

- (NSString *)decodeHTMLEntities:(NSString *)string;

- (NSString *) getPath :(NSString *)fstr;
-(void)getYourBook:(NSString*)zipString;

-(void)show_productdetail_continue:(NSString*)strId;

-(void)loadScrollView:(NSMutableArray *)array;

-(void)final_product_fatch_data:(NSString *)strId;

- (void)addGestureRecognizersToPiece:(UIView *)piece;
- (void)showResetMenu:(UISwipeGestureRecognizer *)gestureRecognizer;

-(void)fatch_second_search_data:(NSString*)senderId;
-(void)show_search_tbl_view;


- (void)configurePage:(ImageScrollView_inspire *)page forIndex:(NSUInteger)index;
- (BOOL)isDisplayingPageForIndex:(NSUInteger)index;
- (CGRect)frameForPageAtIndex:(NSUInteger)index;
- (CGSize)contentSizeForPagingScrollView;
- (void)tilePages;
- (ImageScrollView_inspire *)dequeueRecycledPage;
- (NSUInteger)imageCount;
- (NSString *)imageAtIndex:(NSUInteger)index;



-(IBAction)onHome:(id)sender;
-(IBAction)onRefresh:(id)sender;
-(IBAction)onforward:(id)sender;
-(IBAction)onBackward:(id)sender;


@end
