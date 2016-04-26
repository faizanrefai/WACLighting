//
//  WACLightingAppDelegate.h
//  WACLighting
//
//  Created by apple on 12/22/11.
//  Copyright 2011 fgbfg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"




@interface WACLightingAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
	UINavigationController *navigationController_ipad;
	
	
}

-(BOOL)checkInternet;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController_ipad;

@end



@interface UINavigationController (MyApp)
@end