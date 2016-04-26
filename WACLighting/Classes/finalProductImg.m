//
//  finalProductImg.m
//  WACLighting
//
//  Created by apple on 1/24/12.
//  Copyright 2012 fgbfg. All rights reserved.
//

#import "finalProductImg.h"


@implementation finalProductImg


@synthesize final_img,final_btn;



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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/
- (void)setThumbnailImage:(NSString *)logoURLString
{
	myimageView.image = nil;
	if(!myimageView)
	{
		myimageView = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"place_product2_img.png"]];
		myimageView.frame = [final_img bounds];
		myimageView.alpha = 1.0;
		myimageView.layer.cornerRadius = 0;
		myimageView.layer.borderColor = [UIColor blackColor].CGColor;
		myimageView.layer.borderWidth = 1;
		myimageView.layer.shouldRasterize = YES;
		[final_img addSubview:myimageView];
	}
	myimageView.imageURL = [NSURL URLWithString:[logoURLString stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
	
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
	[super willMoveToSuperview:newSuperview];
	
	if(!newSuperview) {
		[myimageView cancelImageLoad];
	}
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (void)dealloc {
    [super dealloc];
	myimageView = nil;
	[myimageView release];
}


@end
