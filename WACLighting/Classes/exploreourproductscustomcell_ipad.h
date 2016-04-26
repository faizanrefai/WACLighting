//
//  exploreourproductscustomcell_ipad.h
//  WACLighting
//
//  Created by apple on 1/21/12.
//  Copyright 2012 fgbfg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOImageView.h";

@interface exploreourproductscustomcell_ipad : UITableViewCell {
	IBOutlet UIButton *btn1;
	IBOutlet UIButton *btn2;
	IBOutlet UIButton *btn3;
	
	IBOutlet UIImageView *imageView1;
	IBOutlet UIImageView *imageView2;
	IBOutlet UIImageView *imageView3;
	
	IBOutlet UILabel *lbl1;
	IBOutlet UILabel *lbl2;
	IBOutlet UILabel *lbl3;
	
	
	EGOImageView *myimageView1;
	EGOImageView *myimageView2;
	EGOImageView *myimageView3;
	
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

@property ( nonatomic , retain ) IBOutlet IBOutlet UILabel *lbl1;
@property ( nonatomic , retain ) IBOutlet IBOutlet UILabel *lbl2;
@property ( nonatomic , retain ) IBOutlet IBOutlet UILabel *lbl3;

@end
