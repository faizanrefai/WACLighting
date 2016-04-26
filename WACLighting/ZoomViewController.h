//
//  ZoomViewController.h
//  Zoom
//
//  Created by Fernando Bunn on 10/3/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOImageView.h"

@interface ZoomViewController : UIViewController <UIScrollViewDelegate> {
	EGOImageView *image;
	int cnt ;
	EGOImageView *myImage;
	NSString *logoURLString ;
	
	
}

@property(nonatomic,retain)EGOImageView *image;
@property(nonatomic,retain)NSString *logoURLString ;
@property(nonatomic,retain) EGOImageView *myImage;
@end

