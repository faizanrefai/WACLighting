    //
//  beinspireDetailCustomcell_ipad.m
//  WACLighting
//
//  Created by apple on 1/23/12.
//  Copyright 2012 fgbfg. All rights reserved.
//

#import "beinspireDetailCustomcell_ipad.h"


@implementation beinspireDetailCustomcell_ipad

@synthesize img,lbl;

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

- (void)setThumbnailImage:(NSString *)logoURLString
{
	myimageView.image = nil;
	if(!myimageView)
	{
		myimageView = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"place_beinspire2_ipadimg.png"]];
		myimageView.frame = [img bounds];
		[img addSubview:myimageView];
	}
	myimageView.imageURL = [NSURL URLWithString:[logoURLString stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
	
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
	[super willMoveToSuperview:newSuperview];
	
	if(!newSuperview) {
		[myimageView cancelImageLoad];
	}
}


- (void)dealloc {
    [super dealloc];
	
	self.img = nil;
	self.lbl = nil;
}


@end
