//
//  ZoomViewController.h
//  Zoom
//
//  Created by Fernando Bunn on 10/3/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageScrollView.h"
#import "EGOImageView.h"


@class ImageScrollView;



@interface ZoomViewController : UIViewController <UIScrollViewDelegate> {
	
	int pageNo;
	
	IBOutlet UIView *main_view;
	
	IBOutlet UIView *close_view;
	NSMutableArray *img_arr;
	
	UIScrollView *pagingScrollView;
    
    NSMutableSet *recycledPages;
    NSMutableSet *visiblePages;
	
    // these values are stored off before we start rotation so we adjust our content offset appropriately during rotation
    int           firstVisiblePageIndexBeforeRotation;
    CGFloat       percentScrolledIntoFirstVisiblePage;
	
}
@property (nonatomic , retain)IBOutlet UIView *main_view;
@property (nonatomic , retain)IBOutlet UIView *close_view;
@property(nonatomic)int pageNo;

- (void)configurePage:(ImageScrollView *)page forIndex:(NSUInteger)index;
- (BOOL)isDisplayingPageForIndex:(NSUInteger)index;

- (CGRect)frameForPagingScrollView;
- (CGRect)frameForPageAtIndex:(NSUInteger)index;
- (CGSize)contentSizeForPagingScrollView;

- (void)tilePages;
- (ImageScrollView *)dequeueRecycledPage;

- (NSUInteger)imageCount;
- (NSString *)imageNameAtIndex:(NSUInteger)index;
- (CGSize)imageSizeAtIndex:(NSUInteger)index;
- (UIImage *)imageAtIndex:(NSUInteger)index;

-(IBAction)close_clicked;


@end

