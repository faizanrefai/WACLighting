//
//  beinspireCustomcell.h
//  WACLighting
//
//  Created by apple on 1/19/12.
//  Copyright 2012 fgbfg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOImageView.h"

@interface beinspireCustomcell : UITableViewCell <EGOImageViewDelegate>{

	
	
	IBOutlet UIButton *btn1;
	IBOutlet UIButton *btn2;
	IBOutlet UIButton *btn3;
	
	
	
	IBOutlet UIImageView *imageView1;
	IBOutlet UIImageView *imageView2;
	IBOutlet UIImageView *imageView3;
	

	IBOutlet EGOImageView *myimageView1;
	IBOutlet EGOImageView *myimageView2;
	IBOutlet EGOImageView *myimageView3;
	
}
- (void)setThumbnailImage1:(NSString *)logoURLString;
- (void)setThumbnailImage2:(NSString *)logoURLString;
- (void)setThumbnailImage3:(NSString *)logoURLString;


@property ( nonatomic , retain )IBOutlet UIButton *btn1;
@property ( nonatomic , retain )IBOutlet UIButton *btn2;
@property ( nonatomic , retain )IBOutlet UIButton *btn3;

@property ( nonatomic , retain ) IBOutlet UIImageView *imageView1;
@property ( nonatomic , retain ) IBOutlet UIImageView *imageView2;
@property ( nonatomic , retain ) IBOutlet UIImageView *imageView3;

@end
