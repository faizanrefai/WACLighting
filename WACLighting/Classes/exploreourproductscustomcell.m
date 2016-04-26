//
//  exploreourproductscustomcell.m
//  WACLighting
//
//  Created by apple on 1/19/12.
//  Copyright 2012 fgbfg. All rights reserved.
//

#import "exploreourproductscustomcell.h"


@implementation exploreourproductscustomcell

@synthesize btn1;
@synthesize btn2;
@synthesize btn3;

@synthesize imageView1;
@synthesize imageView2;
@synthesize imageView3;

@synthesize lbl1;
@synthesize lbl2;
@synthesize lbl3;

//@synthesize token;


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


- (void)setThumbnailImage1:(NSString *)logoURLString {
	
	self.backgroundView = nil;
	
	myimageView1.image = nil;
	
	if(!myimageView1)
	{
		myimageView1 = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"place_product2_img.png"]];
		myimageView1.frame = CGRectMake(0.0f, 0.0f, 80.0f, 80.0f);
		imageView1.alpha = 1.0;
		imageView1.layer.cornerRadius = 0;
		imageView1.layer.borderColor = [UIColor colorWithRed:78.0f/255.0 green:78.0f/255.0 blue:78.0f/255.0 alpha:1.0].CGColor;
		imageView1.layer.borderWidth = 1;
		imageView1.layer.shadowOffset = CGSizeMake(0, 0);
		imageView1.layer.shouldRasterize = YES;
		[imageView1 addSubview:myimageView1];
	}

	myimageView1.imageURL = [NSURL URLWithString:[logoURLString stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
		
	
}

- (void)setThumbnailImage2:(NSString *)logoURLString
{
	self.backgroundView = nil;
	
	myimageView2.image = nil;
	if(!myimageView2)
	{
		myimageView2 = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"place_product2_img.png"]];
		myimageView2.frame = CGRectMake(0.0f, 0.0f, 80.0f, 80.0f);
		imageView2.alpha = 1.0;
		imageView2.layer.cornerRadius = 0;
		imageView2.layer.borderColor = [UIColor colorWithRed:78.0f/255.0 green:78.0f/255.0 blue:78.0f/255.0 alpha:1.0].CGColor;
		imageView2.layer.borderWidth = 1;
		imageView2.layer.shadowOffset = CGSizeMake(0,0);
		imageView2.layer.shouldRasterize = YES;
		[imageView2 addSubview:myimageView2];
	}
	
	myimageView2.imageURL = [NSURL URLWithString:[logoURLString stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
}

- (void)setThumbnailImage3:(NSString *)logoURLString
{
	self.backgroundView = nil;
	
	if (!myimageView3) {
		myimageView3 = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"place_product2_img.png"]];
		myimageView3.frame = CGRectMake(0.0f, 0.0f, 80.0f, 80.0f);
		imageView3.alpha = 1.0;
		imageView3.layer.cornerRadius = 0;
		imageView3.layer.borderColor = [UIColor colorWithRed:78.0f/255.0 green:78.0f/255.0 blue:78.0f/255.0 alpha:1.0].CGColor;
		imageView3.layer.borderWidth = 1.0;
		imageView3.layer.shadowOffset = CGSizeMake(0, 0);
		imageView3.layer.shouldRasterize = YES;
		[imageView3 addSubview:myimageView3];
	}
	
	myimageView3.imageURL = [NSURL URLWithString:[logoURLString stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
	
}


- (void)willMoveToSuperview:(UIView *)newSuperview {
	[super willMoveToSuperview:newSuperview];
	
	if(!newSuperview) {
		[myimageView1 cancelImageLoad];
		[myimageView2 cancelImageLoad];
		[myimageView3 cancelImageLoad];
	}
}



- (void)dealloc {
    [super dealloc];
	
	lbl1 = nil;
	[lbl1 release];
	
	lbl2 = nil;
	[lbl2 release];
	
	lbl3 = nil;
	[lbl3 release];
	
	myimageView1 = nil;
	[myimageView1 release];
	
	myimageView2 = nil;
	[myimageView2 release];
	
	myimageView3 = nil;
	[myimageView3 release];
	
	btn1 = nil;
	[btn1 release];
	
	btn2 = nil;
	[btn2 release];
	
	btn3 = nil;
	[btn3 release];
	
	//[token cancel];
	//self.token = nil;
	
}


@end
