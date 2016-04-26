//
//  ZoomViewController.m
//  Zoom
//
//  Created by Fernando Bunn on 10/3/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "ZoomViewController.h"


@implementation ZoomViewController
@synthesize pageNo,close_view,main_view;



-(IBAction)close_clicked
{
	
	[self.navigationController popViewControllerAnimated:NO];
	
}


#pragma mark -
#pragma mark View loading and unloading

- (void)loadView 
{    
    // Step 1: make the outer paging scroll view
    
    CGRect pagingScrollViewFrame = [self frameForPagingScrollView];
	main_view = [[UIView alloc]initWithFrame:pagingScrollViewFrame];
	self.view  = main_view;
	
    pagingScrollView = [[UIScrollView alloc] initWithFrame:main_view.bounds];
    pagingScrollView.pagingEnabled = YES;
    pagingScrollView.backgroundColor = [UIColor blackColor];
    pagingScrollView.showsVerticalScrollIndicator = NO;
    pagingScrollView.showsHorizontalScrollIndicator = NO;
    pagingScrollView.contentSize = [self contentSizeForPagingScrollView];
    pagingScrollView.delegate = self;
	[main_view addSubview:pagingScrollView];
	
    // Step 2: prepare to tile content
    recycledPages = [[NSMutableSet alloc] init];
    visiblePages  = [[NSMutableSet alloc] init];
		
	UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
	{
		[btn setBackgroundImage:[UIImage imageNamed:@"close_zoom_ipadimg.png"] forState:UIControlStateNormal];
		btn.frame = CGRectMake(954, 20, 50, 50);
	}
	else {
		[btn setBackgroundImage:[UIImage imageNamed:@"close_zoom_img.png"] forState:UIControlStateNormal];
		btn.frame = CGRectMake(430, 10, 30, 30);
	}
	
	[btn addTarget:self action:@selector(Close_btn_clicked) forControlEvents:UIControlEventTouchUpInside];
	[main_view addSubview:btn];
	
	
	
}


-(void)setView
{
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
	{
		[pagingScrollView scrollRectToVisible:CGRectMake(1024*pageNo,0,1024,768) animated:NO];
		
	}
	else {
		[pagingScrollView scrollRectToVisible:CGRectMake(480*pageNo,0,480,320) animated:NO];
	}
}

-(void)Close_btn_clicked
{
	[self dismissModalViewControllerAnimated:NO];
}

-(void)viewDidLoad
{
	[self performSelector:@selector(setView) withObject:nil afterDelay:0.1];
	
	
	img_arr = [[NSMutableArray alloc]init];
	[img_arr addObject:@"001"];
    [img_arr addObject:@"002"];
    [img_arr addObject:@"003"];
    [img_arr addObject:@"004"];
    [img_arr addObject:@"005"];
    [img_arr addObject:@"006"];
    [img_arr addObject:@"007"];
    [img_arr addObject:@"008"];
    [img_arr addObject:@"009"];
    [img_arr addObject:@"010"];
    [img_arr addObject:@"011"];
    [img_arr addObject:@"012"];
    [img_arr addObject:@"013"];
    [img_arr addObject:@"014"];
    [img_arr addObject:@"015"];
    [img_arr addObject:@"016"];
    [img_arr addObject:@"017"];
    [img_arr addObject:@"018"];
    [img_arr addObject:@"019"];
    [img_arr addObject:@"020"];
    [img_arr addObject:@"021"];
    [img_arr addObject:@"022"];
    [img_arr addObject:@"023"];
    [img_arr addObject:@"024"];
    [img_arr addObject:@"025"];
	
	[self tilePages];
	//[[UIDevice currentDevice] setOrientation:UIInterfaceOrientationLandscapeRight];
	
		//if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//	{
//		[pagingScrollView setContentOffset:CGPointMake((1024*pageNo), 0) animated:NO];
//		
//	}
//	else {
//		[pagingScrollView scrollRectToVisible:CGRectMake((480*pageNo),0,480,320) animated:NO];
//		[pagingScrollView setContentOffset:CGPointMake((480*pageNo), 0) animated:NO];
//	}
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [pagingScrollView release];
    pagingScrollView = nil;
    [recycledPages release];
    recycledPages = nil;
    [visiblePages release];
    visiblePages = nil;
	img_arr = nil;
	[img_arr release];
}

- (void)dealloc
{
    [pagingScrollView release];
    [super dealloc];
}


#pragma mark -
#pragma mark Tiling and page configuration

- (void)tilePages 
{
    CGRect visibleBounds = pagingScrollView.bounds;	
    int firstNeededPageIndex = floorf(CGRectGetMinX(visibleBounds) / CGRectGetWidth(visibleBounds));
    int lastNeededPageIndex  = floorf((CGRectGetMaxX(visibleBounds)-1) / CGRectGetWidth(visibleBounds));
    firstNeededPageIndex = MAX(firstNeededPageIndex, 0);
    lastNeededPageIndex  = MIN(lastNeededPageIndex, [self imageCount] - 1);
    
    for (ImageScrollView *page in visiblePages) {
        if (page.index < firstNeededPageIndex || page.index > lastNeededPageIndex) {
            [recycledPages addObject:page];
            [page removeFromSuperview];
        }
    }
    [visiblePages minusSet:recycledPages];
    
    for (int index = firstNeededPageIndex; index <= lastNeededPageIndex; index++) {
        if (![self isDisplayingPageForIndex:index]) {
            ImageScrollView *page = [self dequeueRecycledPage];
            if (page == nil) {
                page = [[[ImageScrollView alloc] init] autorelease];
            }
            [self configurePage:page forIndex:index];
            [pagingScrollView addSubview:page];
            [visiblePages addObject:page];
        }
    }    
}

- (ImageScrollView *)dequeueRecycledPage
{
    ImageScrollView *page = [recycledPages anyObject];
    if (page) {
        [[page retain] autorelease];
        [recycledPages removeObject:page];
    }
    return page;
}

- (BOOL)isDisplayingPageForIndex:(NSUInteger)index
{
    BOOL foundPage = NO;
    for (ImageScrollView *page in visiblePages) {
        if (page.index == index) {
            foundPage = YES;
            break;
        }
    }
    return foundPage;
}

- (void)configurePage:(ImageScrollView *)page forIndex:(NSUInteger)index
{
    page.index = index;
    page.frame = [self frameForPageAtIndex:index];
	[page displayImage:[self imageAtIndex:index]];
}


#pragma mark -
#pragma mark ScrollView delegate methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self tilePages];
	
}



#pragma mark -
#pragma mark View controller rotation methods

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	//return (interfaceOrientation==UIInterfaceOrientationLandscapeLeft || 
//            interfaceOrientation==UIInterfaceOrientationLandscapeRight) ? YES : NO;
	
	return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
    
    
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
   // CGFloat offset = pagingScrollView.contentOffset.x;
//    CGFloat pageWidth = pagingScrollView.bounds.size.width;
//    
//    if (offset >= 0) {
//        firstVisiblePageIndexBeforeRotation = floorf(offset / pageWidth);
//        percentScrolledIntoFirstVisiblePage = (offset - (firstVisiblePageIndexBeforeRotation * pageWidth)) / pageWidth;
//    } else {
//        firstVisiblePageIndexBeforeRotation = 0;
//        percentScrolledIntoFirstVisiblePage = offset / pageWidth;
//    }    
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    pagingScrollView.contentSize = [self contentSizeForPagingScrollView];
    for (ImageScrollView *page in visiblePages) {
        CGPoint restorePoint = [page pointToCenterAfterRotation];
        CGFloat restoreScale = [page scaleToRestoreAfterRotation];
        page.frame = [self frameForPageAtIndex:page.index];
        [page setMaxMinZoomScalesForCurrentBounds];
        [page restoreCenterPoint:restorePoint scale:restoreScale];
        
    }
    CGFloat pageWidth = pagingScrollView.bounds.size.width;
    CGFloat newOffset = (firstVisiblePageIndexBeforeRotation * pageWidth) + (percentScrolledIntoFirstVisiblePage * pageWidth);
    pagingScrollView.contentOffset = CGPointMake(newOffset, 0);
}

#pragma mark -
#pragma mark  Frame calculations
#define PADDING  10

- (CGRect)frameForPagingScrollView {
	CGRect frame; 
	
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
	{
		frame = CGRectMake(0, 0, 1024, 768);
	}
	else {
		frame = CGRectMake(0, 0, 480, 320);
	}
    return frame;
}

- (CGRect)frameForPageAtIndex:(NSUInteger)index {
    CGRect bounds = pagingScrollView.bounds;
    CGRect pageFrame = bounds;
    pageFrame.size.width -= (2 * PADDING);
    pageFrame.origin.x = (bounds.size.width * index) + PADDING;
    return pageFrame;
}

- (CGSize)contentSizeForPagingScrollView {
    CGRect bounds = pagingScrollView.bounds;
    return CGSizeMake(bounds.size.width * [self imageCount], bounds.size.height);
}

- (UIImage *)imageAtIndex:(NSUInteger)index {
    NSString *imageName = [self imageNameAtIndex:index];
    return [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",imageName]];    
}

- (NSString *)imageNameAtIndex:(NSUInteger)index {
    NSString *name = nil;
	name = [img_arr objectAtIndex:index];
    return name;
}

- (CGSize)imageSizeAtIndex:(NSUInteger)index {
	CGSize size;
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
	{
		size = CGSizeMake(1024, 768);
	}
	else {
		size = CGSizeMake(460, 320);
	}
    return size;
}

- (NSUInteger)imageCount {
    return [img_arr count];
}




@end
