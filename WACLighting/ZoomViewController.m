//
//  ZoomViewController.m
//  Zoom
//
//  Created by Fernando Bunn on 10/3/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "ZoomViewController.h"


@implementation ZoomViewController
@synthesize image,myImage,logoURLString;

- (void)loadView {
	
	UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	scroll.backgroundColor = [UIColor blackColor];
	scroll.delegate = self;
	
	
	image = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"placeholder.png"]];
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
	{
		image.frame = CGRectMake(0, 0, 768, 1024);
	}
	else {
		image.frame = CGRectMake(0, 0, 320, 460);
	}

	
	
	image.imageURL = [NSURL URLWithString:self.logoURLString];
	scroll.contentSize = image.frame.size;
	[scroll addSubview:image];
	
	scroll.minimumZoomScale = scroll.frame.size.width / image.frame.size.width;
	scroll.maximumZoomScale = 2.0;
	[scroll setZoomScale:scroll.minimumZoomScale];

	self.view = scroll;
	[scroll release];

}
- (void)viewDidLoad {
    [super viewDidLoad];
	//self.view.backgroundColor = [UIColor redColor];
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
	{
		self.view.frame=CGRectMake(0, 0, 768, 1024);
	}
	else {
		self.view.frame=CGRectMake(0, 0, 320, 460);
	}
	
	
}

- (void)viewDidUnload {
	[image release], image = nil;
	
}


- (CGRect)centeredFrameForScrollView:(UIScrollView *)scroll andUIView:(UIView *)rView {
	CGSize boundsSize = scroll.bounds.size;
    CGRect frameToCenter = rView.frame;
    
    // center horizontally
    if (frameToCenter.size.width < boundsSize.width) {
        frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width) / 2;
    }
    else {
        frameToCenter.origin.x = 0;
		//[self.view removeFromSuperview];

    }
    
    // center vertically
    if (frameToCenter.size.height < boundsSize.height) {
        frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height) / 2;
    }
    else {
        frameToCenter.origin.y = 0;
    }
	//if(frameToCenter.origin.y == 0 &&  frameToCenter.origin.x == 0)
//		[self.view removeFromSuperview];
	return frameToCenter;
}

#pragma mark -
#pragma mark UIScrollViewDelegate

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
   image.frame = [self centeredFrameForScrollView:scrollView andUIView:image];;
	
	
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
	{
		if(image.frame.size.width<=576 && image.frame.size.height<=900)
		{
			
			[self.view removeFromSuperview];
		}
	}
	else {
		if(image.frame.size.width<=200 && image.frame.size.height<=350)
		{
			
			[self.view removeFromSuperview];
		}
	}

		
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
	return image;
}


- (void)dealloc {
    [super dealloc];
}

@end
