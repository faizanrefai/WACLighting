//
//  searchCustomCell_ipad.m
//  WACLighting
//
//  Created by apple on 2/9/12.
//  Copyright 2012 fgbfg. All rights reserved.
//

#import "searchCustomCell_ipad.h"


@implementation searchCustomCell_ipad

@synthesize search_title_lbl,search_desc_lbl;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.






- (void)dealloc {
    [super dealloc];
	[search_title_lbl release];
	[search_desc_lbl release];
}


@end
