//
//  beinspireDetailCustomcell.h
//  WACLighting
//
//  Created by apple on 1/23/12.
//  Copyright 2012 fgbfg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOImageView.h"
#import <QuartzCore/QuartzCore.h>


@interface beinspireDetailCustomcell : UITableViewCell {
	
	IBOutlet UIImageView *img;
	IBOutlet UILabel *lbl;
	
	EGOImageView *myimageView;

}

- (void)setThumbnailImage:(NSString *)logoURLString;

@property ( nonatomic , retain )IBOutlet UIImageView *img;
@property ( nonatomic , retain )IBOutlet UILabel *lbl;

@end
