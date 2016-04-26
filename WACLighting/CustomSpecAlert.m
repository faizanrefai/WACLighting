//
//  CustomSpecAlert.m
//  WACLighting
//
//  Created by apple on 2/9/12.
//  Copyright 2012 fgbfg. All rights reserved.
//

#import "CustomSpecAlert.h"


@implementation CustomSpecAlert


@synthesize lblAlertTitle;
@synthesize lblAlertMessage;
@synthesize view_btn;
@synthesize email_btn;
@synthesize _specDelegate;
@synthesize cat_str,url_str;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

+(void)showAlert:(NSString*)strHeader message:(NSString*)strMessage Cat:(NSString*)cat Url:(NSString*)url delegate:(id)sender{
	
	UIViewController *controller = [[UIViewController alloc] initWithNibName:@"CustomSpecAlert" bundle:[NSBundle mainBundle]];
	CustomSpecAlert *customeAlertView = (CustomSpecAlert *)controller.view;
	customeAlertView.lblAlertTitle.text = strHeader;
	customeAlertView.lblAlertMessage.text = strMessage;
	customeAlertView._specDelegate = sender;
	customeAlertView.cat_str = cat;
	customeAlertView.url_str = url;
	[customeAlertView show];
	[controller release];
}

-(IBAction)view_btn_clicked:(id)sender{
	
	if([_specDelegate respondsToSelector:@selector(select_view_spec::)])
		[_specDelegate select_view_spec:cat_str :url_str];
	[self dismiss:YES];
}


-(IBAction)email_btn_clicked:(id)sender{
		
	if([_specDelegate respondsToSelector:@selector(select_mail_spec::)])
		[_specDelegate select_mail_spec:cat_str :url_str];
	[self dismiss:YES];
}

-(IBAction)print_btn_clicked:(id)sender{
	
	if([_specDelegate respondsToSelector:@selector(printTapped:)])
		[_specDelegate printTapped:url_str];
	[self dismiss:YES];
}


- (void)dialogWillAppear {
	[super dialogWillAppear];
}


- (void)dialogWillDisappear {
	[super dialogWillDisappear];
}


- (void)dealloc {
	[lblAlertTitle release];
	[lblAlertMessage release];
	[view_btn release];
	[email_btn release];
    [super dealloc];
}


@end
