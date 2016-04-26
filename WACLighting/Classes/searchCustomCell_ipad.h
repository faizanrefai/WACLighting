//
//  searchCustomCell_ipad.h
//  WACLighting
//
//  Created by apple on 2/9/12.
//  Copyright 2012 fgbfg. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface searchCustomCell_ipad : UITableViewCell {

	IBOutlet UILabel *search_title_lbl;
	
	IBOutlet UILabel *search_desc_lbl;
	
	
	
}


@property ( nonatomic , retain )IBOutlet UILabel *search_title_lbl;
@property ( nonatomic , retain )IBOutlet UILabel *search_desc_lbl;

@end
