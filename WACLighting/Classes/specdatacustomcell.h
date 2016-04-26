//
//  specdatacustomcell.h
//  WACLighting
//
//  Created by apple on 1/13/12.
//  Copyright 2012 fgbfg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"



@interface specdatacustomcell : UITableViewCell {

	UILabel *name_lbl;
	
	UIButton *product_btn;
	
	UIButton *spec_btn;
	
	UIButton *inst_btn;
	
	UIButton *ies_btn;
}


@property(nonatomic,retain)IBOutlet UIButton *product_btn;
@property(nonatomic,retain)IBOutlet UIButton *spec_btn;
@property(nonatomic,retain)IBOutlet UIButton *inst_btn;
@property(nonatomic,retain)IBOutlet UIButton *ies_btn;
@property(nonatomic,retain)IBOutlet UILabel *name_lbl;

@end
