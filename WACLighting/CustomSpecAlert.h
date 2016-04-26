//
//  CustomSpecAlert.h
//  WACLighting
//
//  Created by apple on 2/9/12.
//  Copyright 2012 fgbfg. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "OverlayView.h"


@protocol SpecDelegate <NSObject>
@optional

-(void)select_view_spec:(NSString*)str:(NSString*)url;
-(void)select_mail_spec:(NSString*)str:(NSString*)url;
-(void)printTapped:(NSString *)urlStr;

@end

@interface CustomSpecAlert : OverlayView {
	
	UILabel *lblAlertTitle;
	UILabel *lblAlertMessage;
	
	UIButton *view_btn;
	UIButton *email_btn;
	
	NSString *cat_str;
	NSString *url_str;
	
	id<SpecDelegate>_specDelegate;
}

@property(nonatomic, retain) IBOutlet UILabel *lblAlertTitle;
@property(nonatomic, retain) IBOutlet UILabel *lblAlertMessage;
@property(nonatomic, retain) IBOutlet UIButton *view_btn;
@property(nonatomic, retain) IBOutlet UIButton *email_btn;
@property(nonatomic, assign)id<SpecDelegate>_specDelegate;

@property(nonatomic, retain)NSString *cat_str;
@property(nonatomic, retain)NSString *url_str;

-(IBAction)view_btn_clicked:(id)sender;
-(IBAction)email_btn_clicked:(id)sender;
-(IBAction)print_btn_clicked:(id)sender;

+(void)showAlert:(NSString*)strHeader message:(NSString*)strMessage Cat:(NSString*)cat Url:(NSString*)url delegate:(id)sender;


@end
