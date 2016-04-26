//
//  searchCustomCell.m
//  WACLighting
//
//  Created by apple on 1/27/12.
//  Copyright 2012 fgbfg. All rights reserved.
//

#import "searchCustomCell.h"


@implementation searchCustomCell

@synthesize search_title_lbl,search_desc_lbl;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.






- (void)dealloc {
    [super dealloc];
	[search_title_lbl release];
	[search_desc_lbl release];
}


@end
