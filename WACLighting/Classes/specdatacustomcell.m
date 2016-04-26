//
//  specdatacustomcell.m
//  WACLighting
//
//  Created by apple on 1/13/12.
//  Copyright 2012 fgbfg. All rights reserved.
//

#import "specdatacustomcell.h"


@implementation specdatacustomcell

@synthesize product_btn,spec_btn,inst_btn,ies_btn,name_lbl;




- (void)dealloc {
    [super dealloc];
	[product_btn release];
	[spec_btn release];
	[inst_btn release];
	[ies_btn release];
}


@end
