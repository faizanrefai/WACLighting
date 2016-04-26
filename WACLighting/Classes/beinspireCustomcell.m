//
//  beinspireCustomcell.m
//  WACLighting
//
//  Created by apple on 1/19/12.
//  Copyright 2012 fgbfg. All rights reserved.
//

#import "beinspireCustomcell.h"
#import <QuartzCore/QuartzCore.h>

@implementation beinspireCustomcell

@synthesize btn1;
@synthesize btn2;
@synthesize btn3;

@synthesize imageView1;
@synthesize imageView2;
@synthesize imageView3;



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
	myimageView1.image = nil;
	if(!myimageView1)
	{
		myimageView1 = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"place_beinspire1_img.png"]];
		myimageView1.delegate = self;
		myimageView1.frame = CGRectMake(0.0f, 0.0f, 60.0f, 60.0f);
		imageView1.layer.cornerRadius = 10.0;
		imageView1.layer.borderColor = [UIColor whiteColor].CGColor;
		imageView1.layer.borderWidth = 1;
		[imageView1.layer setMasksToBounds:YES];
		[imageView1 addSubview:myimageView1];
	}
	myimageView1.imageURL = [NSURL URLWithString:[logoURLString stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
	
	
	
}

- (void)setThumbnailImage2:(NSString *)logoURLString
{
	myimageView2.image = nil;
	if(!myimageView2)
	{
		myimageView2 = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"place_beinspire1_img.png"]];
		myimageView2.frame = CGRectMake(0.0f, 0.0f, 60.0f, 60.0f);
		myimageView2.delegate = self;
		imageView2.layer.cornerRadius = 10.0;
		imageView2.layer.borderColor = [UIColor whiteColor].CGColor;
		imageView2.layer.borderWidth = 1;
		[imageView2.layer setMasksToBounds:YES];
		[imageView2 addSubview:myimageView2];
	}
	myimageView2.imageURL = [NSURL URLWithString:[logoURLString stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
	
}

- (void)setThumbnailImage3:(NSString *)logoURLString
{
	myimageView3.image = nil;
	if(!myimageView3)
	{
		myimageView3 = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"place_beinspire1_img.png"]];
		myimageView3.frame = CGRectMake(0.0f, 0.0f, 60.0f, 60.0f);
		imageView3.layer.cornerRadius = 10.0;
		imageView3.layer.borderColor = [UIColor whiteColor].CGColor;
		imageView3.layer.borderWidth = 1;
		[imageView3.layer setMasksToBounds:YES];
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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/




- (void)dealloc {
    [super dealloc];
	btn1 = nil;
	btn2 = nil;
	btn3 = nil;
	imageView1 = nil;
	imageView2 = nil;
	imageView3 = nil;
	
	[myimageView1 release];
	[myimageView2 release];
	[myimageView3 release];
	
	[btn1 release];
	[btn2 release];
	[btn3 release];
}


@end
