//
//  searchCustomCell.h
//  WACLighting
//
//  Created by apple on 1/27/12.
//  Copyright 2012 fgbfg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface searchCustomCell : UITableViewCell {

	
	IBOutlet UILabel *search_title_lbl;
	
	IBOutlet UILabel *search_desc_lbl;
	
	
	
}


@property ( nonatomic , retain )IBOutlet UILabel *search_title_lbl;
@property ( nonatomic , retain )IBOutlet UILabel *search_desc_lbl;

@end
