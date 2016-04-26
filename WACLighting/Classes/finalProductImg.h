//
//  finalProductImg.h
//  WACLighting
//
//  Created by apple on 1/24/12.
//  Copyright 2012 fgbfg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOImageView.h"
#import <QuartzCore/QuartzCore.h>

@interface finalProductImg : UITableViewCell {

	IBOutlet UIImageView *final_img;
	
	IBOutlet UIButton *final_btn;
	
	EGOImageView *myimageView;
	
}

- (void)setThumbnailImage:(NSString *)logoURLString;

@property ( nonatomic , retain )IBOutlet UIImageView *final_img;
@property ( nonatomic , retain )IBOutlet UIButton *final_btn;


@end
