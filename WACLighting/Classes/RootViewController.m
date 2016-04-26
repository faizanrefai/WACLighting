//
//  RootViewController.m
//  WACLighting
//
//  Created by apple on 12/22/11.
//  Copyright 2011 fgbfg. All rights reserved.
//

#import "RootViewController.h"

static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;

@implementation RootViewController

@synthesize mailIDstr,BeInspire_detail_lbl_array,table_array,mainCat_Array,subCat_Array,subCat_lise_Array,BeInspire_Array,Product_Detail_Array;

@synthesize search_array_second,spec_data_Array,product_lvl3_Array,isLoded,spec_data_detail_Array,spec_data_final_Array,product_final_Array,search_Array,linesArray;


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	[self addGestureRecognizersToPiece:menu_view];
	[self addGestureRecognizersToPiece:search_view];
	
	self.navigationController.navigationBar.hidden = TRUE;
	
	inspired_scroll.contentSize = CGSizeMake(202, 400);
	
	val_array = [[NSMutableArray alloc]init];
	
	menu_arr = [[NSMutableArray alloc]init];
	[menu_arr addObject:@"Explore Our Products"];
	[menu_arr addObject:@"Come Be Inspired"];
	[menu_arr addObject:@"View Spec Data"];
	[menu_arr addObject:@"Connect With Us"];
	[menu_arr addObject:@"Where To Buy"];
	[menu_arr addObject:@"WACLighting.com"];
	[menu_arr addObject:@"Login"];
	[menu_arr addObject:@"Quit"];
	
	
	
	
	appObj_iphone = (WACLightingAppDelegate*)[[UIApplication sharedApplication]delegate];
	
	
	//scroll_back_view.alpha = 1.0;
//	scroll_back_view.layer.masksToBounds = NO;
//    scroll_back_view.layer.cornerRadius = 0;
//    scroll_back_view.layer.borderColor = [UIColor whiteColor].CGColor;
//    scroll_back_view.layer.borderWidth = 0;
//    scroll_back_view.layer.shadowColor = [UIColor whiteColor].CGColor;
//    scroll_back_view.layer.shadowOpacity = 1.0;
//    scroll_back_view.layer.shadowRadius = 7.0;
//    scroll_back_view.layer.shadowOffset = CGSizeMake(0,4);
//    scroll_back_view.layer.shouldRasterize = YES;
//	scroll_back_view.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.view.bounds].CGPath;
//
	
	//add_scroll = [[UIScrollView alloc]init];
	//add_scroll.frame = CGRectMake(3, 3, 314, 68);
	//add_scroll.backgroundColor = [UIColor whiteColor];
	add_scroll.delegate = self;
	[add_scroll setCanCancelContentTouches:NO];
	add_scroll.indicatorStyle = UIScrollViewIndicatorStyleWhite;
	add_scroll.showsHorizontalScrollIndicator=NO;
	add_scroll.clipsToBounds = YES;
	add_scroll.scrollEnabled = YES;
	add_scroll.alwaysBounceHorizontal=NO;
	[add_scroll setDecelerationRate:UIScrollViewDecelerationRateFast];
	add_scroll.pagingEnabled=NO;
	[add_scroll setClipsToBounds:NO];
	[add_scroll setUserInteractionEnabled:YES];
	[add_scroll setContentSize:CGSizeMake(0, 0)];
	

	exploreourproduct_tbl.backgroundView = nil;
	final_detail_row_tbl.backgroundView = nil;
	
	[val_array addObject:@"Pendants"];
	[val_array addObject:@"Wall Sconces"];
	[val_array addObject:@"Beauty Spots"];
	[val_array addObject:@"Quick Connect Fixtures"];
	[val_array addObject:@"Quick Connect Canopies"];
	[val_array addObject:@"120V Track System"];
	[val_array addObject:@"Linear System"];
	[val_array addObject:@"Rail System"];
	
	
	self.table_array = [val_array copy];
	
	
	img_arr = [[NSMutableArray alloc]init];
	[img_arr addObject:@"001"];
    [img_arr addObject:@"002"];
    [img_arr addObject:@"003"];
    [img_arr addObject:@"004"];
    [img_arr addObject:@"005"];
    [img_arr addObject:@"006"];
    [img_arr addObject:@"007"];
    [img_arr addObject:@"008"];
    [img_arr addObject:@"009"];
    [img_arr addObject:@"010"];
    [img_arr addObject:@"011"];
    [img_arr addObject:@"012"];
    [img_arr addObject:@"013"];
    [img_arr addObject:@"014"];
    [img_arr addObject:@"015"];
    [img_arr addObject:@"016"];
    [img_arr addObject:@"017"];
    [img_arr addObject:@"018"];
    [img_arr addObject:@"019"];
    [img_arr addObject:@"020"];
    [img_arr addObject:@"021"];
    [img_arr addObject:@"022"];
    [img_arr addObject:@"023"];
    [img_arr addObject:@"024"];
    [img_arr addObject:@"025"];
	
	
	cxs = 0;
	count = 1;
	[self setAddressView];
	[NSThread detachNewThreadSelector:@selector(startTheBackgroundJob) toTarget:self withObject:nil];
	
	
}

-(void)viewWillAppear:(BOOL)animated
{
	
	if (isMail==TRUE) {
		return;
	}
	
	if (arrayRes) {
		arrayRes = nil;
		[arrayRes release];
	}
	arrayRes = [[NSMutableArray alloc]init];
	
	if (back_btn_tag_Arr) {
		back_btn_tag_Arr = nil;
		[back_btn_tag_Arr release];
	}
	back_btn_tag_Arr = [[NSMutableArray alloc]init];
	
	if (pathArray) {
		pathArray = nil;
		[pathArray release];
	}
	pathArray = [[NSMutableArray alloc]init];
	
	back_btn.hidden = TRUE;
	headerImage.image = [UIImage imageNamed:@"nologoheader.png"];
	home_btn.hidden = TRUE;
	
	[back_btn_tag_Arr removeAllObjects];
	
	btn1_view1.selected = NO;
	btn2_view2.selected = NO;
	btn3_view3.selected = NO;
	btn4_view4.selected = NO;
	
	
	btn1_view1.userInteractionEnabled = FALSE;
	btn2_view2.userInteractionEnabled = FALSE;
	btn3_view3.userInteractionEnabled = FALSE;
	btn4_view4.userInteractionEnabled = FALSE;
	
	product_btn_big.userInteractionEnabled = TRUE;
	inspired_btn_big.userInteractionEnabled = TRUE;
	specdata_btn_big.userInteractionEnabled = TRUE;
	connect_btn_big.userInteractionEnabled = TRUE;
	
	
	productView_my1View.frame = CGRectMake(-309, 63, productView_my1View.frame.size.width, productView_my1View.frame.size.height);
	inspiredView_my2View.frame = CGRectMake(-309, 63, inspiredView_my2View.frame.size.width, inspiredView_my2View.frame.size.height);
	connectView_my3View.frame = CGRectMake(-309, 63, connectView_my3View.frame.size.width, connectView_my3View.frame.size.height);
	specdataView_my4View.frame = CGRectMake(-309, 63, specdataView_my4View.frame.size.width, specdataView_my4View.frame.size.height);
	
	spec_sub_detail_view.frame = CGRectMake(-309, 63, spec_sub_detail_view.frame.size.width, spec_sub_detail_view.frame.size.height);
	
	start_search_view.frame = CGRectMake(320 , 44, search_view.frame.size.width , search_view.frame.size.height);
	
	logoView.frame = CGRectMake(0, 44, logoView.frame.size.width, logoView.frame.size.height);
	
	add_scroll_view.frame = CGRectMake(0, 370, add_scroll_view.frame.size.width, add_scroll_view.frame.size.height);
	
	my1View.frame = CGRectMake(0, 122, my1View.frame.size.width, my1View.frame.size.height);
	my2View.frame = CGRectMake(80, 122, my2View.frame.size.width, my2View.frame.size.height);
	my4View.frame = CGRectMake(160, 122, my4View.frame.size.width, my4View.frame.size.height);
	my3View.frame = CGRectMake(240, 122, my3View.frame.size.width, my3View.frame.size.height);
	
	web_view.frame = CGRectMake(320, 44, 320, 416);
	
	productdetail_sub_view.frame = CGRectMake(320, 44, productdetail_sub_view.frame.size.width, productdetail_sub_view.frame.size.height);
	
	specdata_sub_view.frame = CGRectMake(320, 39, 320, 396+5);
	
	
	//product_detail.frame = CGRectMake(320, 44, 320, 396);
	product_detail.frame = CGRectMake(-309, 63,productView_my1View.frame.size.width, productView_my1View.frame.size.height);
	
	product_Lvl3_view.frame = CGRectMake(-309, 63,product_Lvl3_view.frame.size.width, product_Lvl3_view.frame.size.height);
	
	beinspired_detail_view.frame = CGRectMake(320, 44, 320, 396);
	image_detail.frame = CGRectMake(320,44,image_detail.frame.size.width,image_detail.frame.size.height);
	
	product_sub_detail.frame = CGRectMake(320,44,product_sub_detail.frame.size.width,product_sub_detail.frame.size.height);
	
	search_view.frame = CGRectMake(0, 460, 320, 396);
	
	menu_view.frame = CGRectMake(0, 460, 320, 396);
	
	[self.view setUserInteractionEnabled:TRUE];
	
	//if(!isLoded){
	if(Web_req)
	{
		[Web_req cancelReq];
		Web_req = nil;
		[Web_req release];
	}
		//isLoded = TRUE;
   // }
	[myPgressIndicator stopAnimating];
	
}

//====================================================================

-(void)setAddressView
{
		
		int diff;
		diff=70;
		
		
		for(int j = 0; j < [img_arr count] ;j++)
		{
			CGRect rect;
			rect.origin.x = cxs;
			cxs=cxs+diff;
			rect.origin.y = 0;
			rect.size.height = 60;
			rect.size.width = 70;
			
			UIView *mainView = [[UIView alloc]init];
			mainView.clipsToBounds = NO;
			//mainView.backgroundColor = [UIColor redColor];
			mainView.backgroundColor = [UIColor clearColor];
			mainView.frame = rect;
			[mainView setContentMode:UIViewContentModeScaleAspectFill];
			

			UIImageView *myimageView = [[UIImageView alloc] init];
			myimageView.frame = CGRectMake(3, 0, 62, 60);
			myimageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",[img_arr objectAtIndex:j]]];
			[mainView addSubview:myimageView];
			//myimageView.layer.borderColor = [UIColor blackColor].CGColor;
//			myimageView.layer.borderWidth = 1;
			[myimageView release];
	
			UIButton *btn  = [UIButton buttonWithType:UIButtonTypeCustom];
			btn.frame = CGRectMake(3, 0, 62, 60);
			btn.backgroundColor = [UIColor clearColor];
			//btn.layer.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"img1ipad.png"]];
			btn.tag = j;
			[btn addTarget:self action:@selector(scrollView_img_clicked:) forControlEvents:UIControlEventTouchUpInside];
			[mainView addSubview:btn];
			[add_scroll addSubview:mainView];
			[mainView release];
		}
	
	[add_scroll setContentSize:CGSizeMake(cxs, [add_scroll bounds].size.height)];
}

-(void)scrollView_img_clicked:(id)sender
{
	UIButton *btn = (UIButton*)sender;
    NSLog(@"%d",btn.tag);
	
	ZoomViewController *obj;
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
	{
		obj =[[ZoomViewController alloc]initWithNibName:@"ZoomViewController_ipad" bundle:nil];
	}
	else {
		obj =[[ZoomViewController alloc]initWithNibName:@"ZoomViewController" bundle:nil];
	}
	obj.pageNo = btn.tag;
	//[self.navigationController pushViewController:obj animated:NO];
    [self presentModalViewController:obj animated:NO];
    [obj release];
}


-(void)dynamicScroll
{	
	if (secroll_flag == TRUE) {
		[add_scroll scrollRectToVisible:CGRectMake(add_scroll.contentOffset.x-1,0,320,480) animated:NO];
	}else {
		[add_scroll scrollRectToVisible:CGRectMake(add_scroll.contentOffset.x+1,0,320,480) animated:NO];
	}

	[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(dynamicScroll) userInfo:nil repeats:NO];
	
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
	
	if (scrollView == add_scroll) {
		int a =[scrollView contentOffset].x;
		if (a == add_scroll.contentSize.width - 320) {
			secroll_flag = TRUE;
		}
		if (a == 0)
		{
			secroll_flag = FALSE;
		}

	}else if(scrollView == myscroll){
		CGFloat pageWidth = myscroll.frame.size.width;
		int page = floor((myscroll.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
		pageCntrl.currentPage = page;
	}
	else if(scrollView == pagingScrollView)
	{
		[self tilePages];
	}
}



- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
	if (scrollView == zoomScroll) {
		return BeInspire_detail_img;
	}
	if (scrollView == productZoomScroll) {
		return detail_img_view;
	}
	return nil;
}


- (void)startTheBackgroundJob {
	
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	// wait for 3 seconds before starting the thread, you don't have to do that. This is just an example how to stop the NSThread for some time
	//[NSThread sleepForTimeInterval:3];
    [self performSelectorOnMainThread:@selector(dynamicScroll) withObject:nil waitUntilDone:NO];
    [pool release];
	
}


//====================================================================


-(IBAction)SelectView_clicked:(id)sender
{
		
	
	UIButton *btn1 = (UIButton*)sender;
		
	
	if ([arrayRes count]==0) {
	[arrayRes addObject:btn1];
	}else {
		[arrayRes removeAllObjects];
	}
	
	UIButton *btn;
	if ([arrayRes count]!=0) {
		btn = (UIButton*)[arrayRes objectAtIndex:0];
	}else {
		[arrayRes removeAllObjects];
		return;
	}

	 [self.view setUserInteractionEnabled:FALSE];
		
		
	if (btn.tag == 1) {
		
		[btn setTag:1010];
		
		product_btn_big.userInteractionEnabled = FALSE;
		btn1_view1.selected = YES;
		
		[pathArray addObject:@"Explore Our Products"];
		
		back_btn.tag = 1;
		if ([back_btn_tag_Arr containsObject:[NSString stringWithFormat:@"%d",back_btn.tag]]) {
			[back_btn_tag_Arr removeObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
		}
		[back_btn_tag_Arr addObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
		
		[self fatch_productCat:nil];
		[self performSelector:@selector(view3animation:) withObject:nil afterDelay:0.4];
		[self performSelector:@selector(view4animation:) withObject:nil afterDelay:0.6];
		[self performSelector:@selector(view2animation:) withObject:nil afterDelay:0.8];
		[self performSelector:@selector(view1animation:) withObject:nil afterDelay:1.0];
		[self performSelector:@selector(setScrollAnimation:) withObject:nil afterDelay:1.7];
		[self performSelector:@selector(view1animationSetPosition:) withObject:nil afterDelay:2.5];
		[self performSelector:@selector(view1animationShowProduct:) withObject:nil afterDelay:3.5];
		return;
		
	}
	
	if (btn.tag == 2) {
		
		InternetAccessibility = [appObj_iphone checkInternet];
		if (InternetAccessibility==0) 
		{
			[arrayRes removeAllObjects];
			[self.view setUserInteractionEnabled:TRUE];
			[customealert showAlert:@"Network Connection Error" message:@"Please make sure you are connected to the internet." delegate:self];
		}else
		{
			
			inspired_btn_big.userInteractionEnabled = FALSE;
			btn2_view2.selected = YES;
			
			[btn setTag:2020];
			
			back_btn.tag = 2;
			if ([back_btn_tag_Arr containsObject:[NSString stringWithFormat:@"%d",back_btn.tag]]) {
				[back_btn_tag_Arr removeObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
			}
			[back_btn_tag_Arr addObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
			
			[self fatch_BeInspireData:nil];
			[self performSelector:@selector(view3animation:) withObject:nil afterDelay:0.4];
			[self performSelector:@selector(view4animation:) withObject:nil afterDelay:0.6];
			[self performSelector:@selector(view2animation:) withObject:nil afterDelay:0.8];
			[self performSelector:@selector(view1animation:) withObject:nil afterDelay:1.0];
			[self performSelector:@selector(setScrollAnimation:) withObject:nil afterDelay:1.7];
			[self performSelector:@selector(view2animationSetPosition:) withObject:nil afterDelay:2.5];
			[self performSelector:@selector(view2animationShowInspired:) withObject:nil afterDelay:3.5];
			return;
		}
	}
	
	if (btn.tag == 3) {
		connect_btn_big.userInteractionEnabled = FALSE;
		btn3_view3.selected = YES;
		
		[btn setTag:3030];
		
		back_btn.tag = 3;
		if ([back_btn_tag_Arr containsObject:[NSString stringWithFormat:@"%d",back_btn.tag]]) {
			[back_btn_tag_Arr removeObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
		}
		[back_btn_tag_Arr addObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
		
		
		[self performSelector:@selector(view3animation:) withObject:nil afterDelay:0.4];
		[self performSelector:@selector(view4animation:) withObject:nil afterDelay:0.6];
		[self performSelector:@selector(view2animation:) withObject:nil afterDelay:0.8];
		[self performSelector:@selector(view1animation:) withObject:nil afterDelay:1.0];
		[self performSelector:@selector(setScrollAnimation:) withObject:nil afterDelay:1.7];
		[self performSelector:@selector(view3animationSetPosition:) withObject:nil afterDelay:2.5];
		[self performSelector:@selector(view3animationShowConnect:) withObject:nil afterDelay:3.5];
		return;
	}
	
	if (btn.tag == 4) {
		specdata_btn_big.userInteractionEnabled = FALSE;
		btn4_view4.selected = YES;
		
		[btn setTag:4040];
		
		back_btn.tag = 4;
		if ([back_btn_tag_Arr containsObject:[NSString stringWithFormat:@"%d",back_btn.tag]]) {
			[back_btn_tag_Arr removeObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
		}
		[back_btn_tag_Arr addObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
		
		[self fatch_Spec_Data:nil];
		[self performSelector:@selector(view3animation:) withObject:nil afterDelay:0.4];
		[self performSelector:@selector(view4animation:) withObject:nil afterDelay:0.6];
		[self performSelector:@selector(view2animation:) withObject:nil afterDelay:0.8];
		[self performSelector:@selector(view1animation:) withObject:nil afterDelay:1.0];
		[self performSelector:@selector(setScrollAnimation:) withObject:nil afterDelay:1.7];
		[self performSelector:@selector(view4animationSetPosition:) withObject:nil afterDelay:2.5];
		[self performSelector:@selector(view4animationShowConnect:) withObject:nil afterDelay:3.5];
		return;
		
	}
		
	
	if (btn.tag == 1010) {
		[btn setTag:1];
		//[self back_btn_clicked:nil];
		[self.view setUserInteractionEnabled:FALSE];
		[back_btn_tag_Arr removeAllObjects];
		[pathArray removeAllObjects];
		[self performSelector:@selector(hide_sub_Ll3detail_data) withObject:nil afterDelay:0.0];
		[self performSelector:@selector(close_productdetail_view) withObject:nil afterDelay:0.0];
		[self performSelector:@selector(view1animationHideProduct:) withObject:nil afterDelay:0.0];
		[self performSelector:@selector(view1_back_animated:) withObject:nil afterDelay:0.9];
		[self performSelector:@selector(set_allLayout_animated:) withObject:nil afterDelay:2.0];
		
		return;
	}
	
	if (btn.tag == 2020) {
		[btn setTag:2];
		[self back_btn_clicked:nil];
		return;
	}
	
	if (btn.tag == 3030) {
		[btn setTag:3];
		[self back_btn_clicked:nil];
		return;
	}
	
	if (btn.tag == 4040) {
		[btn setTag:4];
		//[self back_btn_clicked:nil];
		
		[self.view setUserInteractionEnabled:FALSE];
		
		if([back_btn_tag_Arr count]!=0)
		[back_btn_tag_Arr removeLastObject];
		
		[self performSelector:@selector(viewsubspechide:) withObject:nil afterDelay:0.0];
		[self performSelector:@selector(view4animationHideConnect:) withObject:nil afterDelay:0.0];
		[self performSelector:@selector(view4_back_animated:) withObject:nil afterDelay:0.9];
		[self performSelector:@selector(set_allLayout_animated:) withObject:nil afterDelay:2.0];
		
		return;
	}
}


-(IBAction)back_btn_clicked:(id)sender
{
	
		if(Web_req)
		{
			[Web_req cancelReq];
			Web_req = nil;
			[Web_req release];
		}
		//isLoded = TRUE;
   // }
	[myPgressIndicator stopAnimating];
	
	int btn_tag = [[back_btn_tag_Arr lastObject] intValue];
	
	if (btn_tag == 1) {
		[self.view setUserInteractionEnabled:FALSE];
		
		if([back_btn_tag_Arr count]!=0)
		[back_btn_tag_Arr removeLastObject];
		
		if([pathArray count]!=0)
		[pathArray removeLastObject];
		
		[self performSelector:@selector(view1animationHideProduct:) withObject:nil afterDelay:0.0];
		[self performSelector:@selector(view1_back_animated:) withObject:nil afterDelay:0.9];
		[self performSelector:@selector(set_allLayout_animated:) withObject:nil afterDelay:2.0];
		
	}
	if (btn_tag == 2) {
		[self.view setUserInteractionEnabled:FALSE];
		
		if([back_btn_tag_Arr count]!=0)
		[back_btn_tag_Arr removeLastObject];
		
		[self performSelector:@selector(view2animationHideInspired:) withObject:nil afterDelay:0.0];
		[self performSelector:@selector(view2_back_animated:) withObject:nil afterDelay:0.9];
		[self performSelector:@selector(set_allLayout_animated:) withObject:nil afterDelay:2.0];
		
	}
	if (btn_tag == 3) {
		[self.view setUserInteractionEnabled:FALSE];
		
		if([back_btn_tag_Arr count]!=0)
		[back_btn_tag_Arr removeLastObject];
		
		[self performSelector:@selector(view3animationHideConnect:) withObject:nil afterDelay:0.0];
		[self performSelector:@selector(view3_back_animated:) withObject:nil afterDelay:0.9];
		[self performSelector:@selector(set_allLayout_animated:) withObject:nil afterDelay:2.0];
	}
	if (btn_tag == 4) {
		[self.view setUserInteractionEnabled:FALSE];
		
		if([back_btn_tag_Arr count]!=0)
		[back_btn_tag_Arr removeLastObject];
		
		[self performSelector:@selector(view4animationHideConnect:) withObject:nil afterDelay:0.0];
		[self performSelector:@selector(view4_back_animated:) withObject:nil afterDelay:0.9];
		[self performSelector:@selector(set_allLayout_animated:) withObject:nil afterDelay:2.0];
	}
	if (btn_tag == 5) {
		[self.view setUserInteractionEnabled:FALSE];
		
		if([back_btn_tag_Arr count]!=0)
		[back_btn_tag_Arr removeLastObject];
		
		if([pathArray count]!=0)
		[pathArray removeLastObject];
		
		[self performSelector:@selector(close_productdetail_view) withObject:nil afterDelay:0.0];
	}
	if (btn_tag == 6) {
		[self.view setUserInteractionEnabled:FALSE];
		
		if([back_btn_tag_Arr count]!=0)
		[back_btn_tag_Arr removeLastObject];
		
		[self performSelector:@selector(viewsubspechide:) withObject:nil afterDelay:0.0];
	}
	if (btn_tag == 7) {
		[self.view setUserInteractionEnabled:FALSE];
		[self performSelector:@selector(close_menu_view) withObject:nil afterDelay:0.0];
	}
	if (btn_tag == 8) {
		[self.view setUserInteractionEnabled:FALSE];
		[self performSelector:@selector(close_search_view) withObject:nil afterDelay:0.0];
	}
	if (btn_tag == 9) {
		[self.view setUserInteractionEnabled:FALSE];
		
		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
		if([back_btn_tag_Arr count]!=0)
		[back_btn_tag_Arr removeLastObject];
		
		[self performSelector:@selector(close_webview) withObject:nil afterDelay:0.0];
	}
	if (btn_tag == 10) {
		[self.view setUserInteractionEnabled:FALSE];
		
		
			if([search_parh_arr count]!=0)
				[search_parh_arr removeLastObject];
		
		if (productdetail_sub_view.frame.origin.x == 0 && search_flag == FALSE)
		{
			if([pathArray count]!=0)
				[pathArray removeLastObject];
		}
		
		[self performSelector:@selector(close_productdetail_sub_view) withObject:nil afterDelay:0.0];
	}
	if (btn_tag == 11) {
		[self.view setUserInteractionEnabled:FALSE];
		[self performSelector:@selector(close_beinspired_detail) withObject:nil afterDelay:0.0];
	}
	if (btn_tag == 12) {
		[self.view setUserInteractionEnabled:FALSE];
		
		if([pathArray count]!=0)
		[pathArray removeLastObject];
		
		if([back_btn_tag_Arr count]!=0)
		[back_btn_tag_Arr removeLastObject];
		
		[self performSelector:@selector(hide_sub_Ll3detail_data) withObject:nil afterDelay:0.0];
		
	}
	if (btn_tag == 13) {
		[self.view setUserInteractionEnabled:FALSE];
		[self performSelector:@selector(close_specdata_view) withObject:nil afterDelay:0.0];
	}
	if (btn_tag == 14) {
		[self.view setUserInteractionEnabled:FALSE];
		
		if([search_parh_arr count]!=0)
		[search_parh_arr removeLastObject];
		
		[self performSelector:@selector(close_search_tbl_view) withObject:nil afterDelay:0.0];
	}
	if (btn_tag == 15) {
		[self.view setUserInteractionEnabled:FALSE];
		[self performSelector:@selector(hide_sub_productdetail_data) withObject:nil afterDelay:0.0];
	}
	
}


//========================================================

#pragma mark view1 going down
-(void)view1animation:(id)sender
{	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.3];
	my1View.frame=CGRectMake(my1View.frame.origin.x, my1View.frame.origin.y+416, my1View.frame.size.width, my1View.frame.size.height);
	[UIView commitAnimations];
}

#pragma mark view4 going up
-(void)view1animationSetPosition:(id)sender
{
	
	my1View.frame=CGRectMake(0 , 416 , my1View.frame.size.width , my1View.frame.size.height);
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.3];
	my1View.frame=CGRectMake(0, 50, my2View.frame.size.width, my2View.frame.size.height);
	[UIView commitAnimations];
}


//========================================================


#pragma mark view2 going down
-(void)view2animation:(id)sender
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.3];
	my2View.frame=CGRectMake(my2View.frame.origin.x, my2View.frame.origin.y+416, my2View.frame.size.width, my2View.frame.size.height);
	[UIView commitAnimations];
}

#pragma mark view2 going up
-(void)view2animationSetPosition:(id)sender
{
	my2View.frame=CGRectMake(0 , 416 , my2View.frame.size.width , my2View.frame.size.height);
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.3];
	my2View.frame=CGRectMake(0, 50, my2View.frame.size.width, my2View.frame.size.height);
	[UIView commitAnimations];
}


//========================================================


#pragma mark view3 going down
-(void)view3animation:(id)sender
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.3];
	my3View.frame=CGRectMake(my3View.frame.origin.x, my3View.frame.origin.y+416, my3View.frame.size.width, my3View.frame.size.height);
	[UIView commitAnimations];
}

#pragma mark view3 going up
-(void)view3animationSetPosition:(id)sender
{
	
	my3View.frame=CGRectMake(0 , 416 , my3View.frame.size.width , my3View.frame.size.height);
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.3];
	my3View.frame=CGRectMake(0, 50, my3View.frame.size.width, my3View.frame.size.height);
	[UIView commitAnimations];
}

//========================================================


#pragma mark view4 going down
-(void)view4animation:(id)sender
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.3];
	my4View.frame=CGRectMake(my4View.frame.origin.x, my4View.frame.origin.y+416, my4View.frame.size.width, my4View.frame.size.height);
	[UIView commitAnimations];
}

#pragma mark view4 going up
-(void)view4animationSetPosition:(id)sender
{
	
	my4View.frame=CGRectMake(0 , 416 , my4View.frame.size.width , my4View.frame.size.height);
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.3];
	my4View.frame=CGRectMake(0, 50, my4View.frame.size.width, my4View.frame.size.height);
	[UIView commitAnimations];
}


//==========================================================


#pragma mark sub_view1 show
-(void)view1animationShowProduct:(id)sender
{	
	product_btn_big.userInteractionEnabled = TRUE;
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.3];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(animDone:finished:context:)];
	productView_my1View.frame=CGRectMake(72, 63, productView_my1View.frame.size.width, productView_my1View.frame.size.height);
    [UIView commitAnimations];
	//[self.view setUserInteractionEnabled:TRUE];
	
	[arrayRes removeAllObjects];
}

#pragma mark sub_view1 hide
-(void)view1animationHideProduct:(id)sender
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.3];
	productView_my1View.frame = CGRectMake(-309, 63, productView_my1View.frame.size.width, productView_my1View.frame.size.height);
	[UIView commitAnimations];
}

//===========================================================

#pragma mark sub_view2 show
-(void)view2animationShowInspired:(id)sender
{
	inspired_btn_big.userInteractionEnabled = TRUE;
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.3];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(animDone:finished:context:)];
	inspiredView_my2View.frame=CGRectMake(72, 63, inspiredView_my2View.frame.size.width, inspiredView_my2View.frame.size.height);
    [UIView commitAnimations];
	
	//[self.view setUserInteractionEnabled:TRUE];
	[arrayRes removeAllObjects];
}

#pragma mark sub_view2 hide
-(void)view2animationHideInspired:(id)sender
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.3];
	inspiredView_my2View.frame = CGRectMake(-309, 63, inspiredView_my2View.frame.size.width, inspiredView_my2View.frame.size.height);
    [UIView commitAnimations];
	
	//[self.view setUserInteractionEnabled:TRUE];
}


//================================================================


#pragma mark sub_view3 show
-(void)view3animationShowConnect:(id)sender
{
	connect_btn_big.userInteractionEnabled = TRUE;
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.3];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(animDone:finished:context:)];
	connectView_my3View.frame=CGRectMake(72, 63, connectView_my3View.frame.size.width, connectView_my3View.frame.size.height);
    [UIView commitAnimations];
	
	//[self.view setUserInteractionEnabled:TRUE];
	[arrayRes removeAllObjects];
}


#pragma mark sub_view3 hide
-(void)view3animationHideConnect:(id)sender
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.3];
	connectView_my3View.frame = CGRectMake(-309, 63, connectView_my3View.frame.size.width, connectView_my3View.frame.size.height);
    [UIView commitAnimations];
	
	//[self.view setUserInteractionEnabled:TRUE];
	
}

//=================================================================

#pragma mark sub_view4 show
-(void)view4animationShowConnect:(id)sender
{
	specdata_btn_big.userInteractionEnabled = TRUE;
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.3];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(animDone:finished:context:)];
	specdataView_my4View.frame=CGRectMake(72, 63, specdataView_my4View.frame.size.width, specdataView_my4View.frame.size.height);
    [UIView commitAnimations];
	
	//[self.view setUserInteractionEnabled:TRUE];
	[arrayRes removeAllObjects];
}

#pragma mark sub_view4 hide
-(void)view4animationHideConnect:(id)sender
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.3];
	specdataView_my4View.frame = CGRectMake(-309, 63, specdataView_my4View.frame.size.width, specdataView_my4View.frame.size.height);
    [UIView commitAnimations];
	
	//[self.view setUserInteractionEnabled:TRUE];
}

//====================================================================

#pragma mark sub_spec show
-(void)viewsubspecshow:(id)sender
{
	
	back_btn.hidden = FALSE;
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.3];
	spec_sub_detail_view.frame=CGRectMake(72, 63, spec_sub_detail_view.frame.size.width, spec_sub_detail_view.frame.size.height);
    [UIView commitAnimations];
	
	[self.view setUserInteractionEnabled:TRUE];
}


-(void)viewsubspechide:(id)sender
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.3];
	spec_sub_detail_view.frame = CGRectMake(-309, 63, spec_sub_detail_view.frame.size.width, spec_sub_detail_view.frame.size.height);
    [UIView commitAnimations];
	
	[self.view setUserInteractionEnabled:TRUE];
}


//====================================================================

-(void)setScrollAnimation:(id)sender
{
	headerImage.image = [UIImage imageNamed:@"header_logo_s.png"];
	home_btn.hidden = FALSE;
	
	//[self.view bringSubviewToFront:];
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.8];
	logoView.frame = CGRectMake(0, -100, logoView.frame.size.width, logoView.frame.size.height);
	add_scroll_view.frame = CGRectMake(0, 480, add_scroll_view.frame.size.width, add_scroll_view.frame.size.height);
	[UIView commitAnimations];
	
	
}

//====================================================================

#pragma mark show & hide video web view

-(IBAction)show_video
{
	[mail_Web_btn setEnabled:FALSE];
	NSString *video_str = @"http://www.youtube.com/user/WACLighting";
	[self show_web_view:video_str];
	
}

-(void)show_web_view:(NSString *)urlStr
{
	
	
	back_btn.tag = 9;
	if ([back_btn_tag_Arr containsObject:[NSString stringWithFormat:@"%d",back_btn.tag]]) {
		[back_btn_tag_Arr removeObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
	}
	back_btn.hidden = FALSE;
	[back_btn_tag_Arr addObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
	
	web_home_str = urlStr;
	
	if(myWebView1)
	{
		[myWebView1 removeFromSuperview];
		myWebView1 = nil;
		[myWebView1 release];
	}
	
	myWebView1 = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 320, 372)];
	[web_view addSubview:myWebView1];
	NSURL *url = [NSURL URLWithString:[urlStr stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	[myWebView1 loadRequest:request];
	myWebView1.delegate = self;
	myWebView1.scalesPageToFit = TRUE;
	myWebView1.autoresizesSubviews = YES;
	myWebView1.autoresizingMask=(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
	
    
    [[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(movieStopedPlaying:)
												 name:@"UIMoviePlayerControllerDidExitFullscreenNotification"
											   object:nil];
	
	
	
	[self.view bringSubviewToFront:web_view];
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.8];
	web_view.frame = CGRectMake(0, 44, 320, 416);
	[UIView commitAnimations];
	
}

-(void)movieStopedPlaying:(NSNotification *)notification
{
    [[UIDevice currentDevice] setOrientation:UIInterfaceOrientationPortrait];
}




-(void)close_webview
{
	if (back_btn_tag_Arr.count == 0) {
		back_btn.hidden = TRUE;
	}
	
	[self.view setUserInteractionEnabled:TRUE];
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(animDone)];
	web_view.frame = CGRectMake(320, 44, 320, 416);
	[UIView commitAnimations];
	
	
}

-(IBAction)onHome:(id)sender{
	
	[myWebView1 stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"window.location=\"%@\"",[web_home_str stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]]];
}	
-(IBAction)onRefresh:(id)sender{
	[myWebView1 stringByEvaluatingJavaScriptFromString:@"window.location.reload()"];
}
-(IBAction)onforward:(id)sender{
	
	[myWebView1 stringByEvaluatingJavaScriptFromString:@"window.history.forward()"];
}
-(IBAction)onBackward:(id)sender{
	[myWebView1 stringByEvaluatingJavaScriptFromString:@"window.history.back()"];
}


- (void)animDone {
	if(myWebView1)
	{
		NSURL *url = [NSURL URLWithString:[@"about:blank" stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
		NSURLRequest *request = [NSURLRequest requestWithURL:url];
		[myWebView1 loadRequest:request];
		
		[myWebView1 stopLoading];
		[myWebView1 removeFromSuperview];
		myWebView1 = nil;
		[myWebView1 release];
	}
}


//====================================================================



#pragma mark -
#pragma mark textField data source

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	if(textField == searchtxt)
	{
		[self search_btn_clicked];
		
	}else {
		[textField resignFirstResponder];
	}

	
	
	return YES;
}
- (void)textFieldDidBeginEditing:(UITextField*)textField
{
	if (textField == searchtxt) {
		first_search_list_tbl.hidden = TRUE;
	}
	
	if (textField != searchtxt) {
    CGRect textFieldRect =[self.view.window convertRect:textField.bounds fromView:textField];
    CGRect viewRect =[self.view.window convertRect:self.view.bounds fromView:self.view];
    CGFloat midline = textFieldRect.origin.y + 1.0 * textFieldRect.size.height;
    CGFloat numerator =midline - viewRect.origin.y- MINIMUM_SCROLL_FRACTION * viewRect.size.height;
    CGFloat denominator =(MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION)* viewRect.size.height;
    CGFloat heightFraction = numerator / denominator;
    animatedDistance = floor(162.0 * heightFraction);
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y -= animatedDistance;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    [self.view setFrame:viewFrame];
    [UIView commitAnimations];
	}
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
	if (textField == searchtxt) {
		first_search_list_tbl.hidden = TRUE;
		
		return YES;
	}
	return YES;
	
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
	if (textField != searchtxt) {
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += animatedDistance;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    [self.view setFrame:viewFrame];
    [UIView commitAnimations];
	}
}

//====================================================================

/*
 - (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
 }
 */
/*
 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 }
 */
/*
 - (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
 }
 */
/*
 - (void)viewDidDisappear:(BOOL)animated {
 [super viewDidDisappear:animated];
 }
 */

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */


//====================================================================


#pragma mark view1 back
-(void)view1_back_animated:(id)sender
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.3];
	my1View.frame=CGRectMake(0, 538, my1View.frame.size.width, my1View.frame.size.height);
	[UIView commitAnimations];
}

//====================================================================

#pragma mark view2 back
-(void)view2_back_animated:(id)sender
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.3];
	my2View.frame=CGRectMake(0, 538, my2View.frame.size.width, my2View.frame.size.height);
	[UIView commitAnimations];
}

//====================================================================

#pragma mark view3 back
-(void)view3_back_animated:(id)sender
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.3];
	my3View.frame=CGRectMake(0, 538, my3View.frame.size.width, my3View.frame.size.height);
	[UIView commitAnimations];
}

//====================================================================

#pragma mark view4 back
-(void)view4_back_animated:(id)sender
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.3];
	my4View.frame=CGRectMake(0, 538, my4View.frame.size.width, my4View.frame.size.height);
	[UIView commitAnimations];
	
}

//====================================================================

#pragma mark Set All Layouts
-(void)set_allLayout_animated:(id)sender
{
	
	[arrayRes removeAllObjects];
	[back_btn_tag_Arr removeAllObjects];
	
	back_btn.hidden = TRUE;
	
	[pathArray removeAllObjects];
	
	
	headerImage.image = [UIImage imageNamed:@"nologoheader.png"];
	home_btn.hidden = TRUE;
	
	product_btn_big.userInteractionEnabled = TRUE;
	inspired_btn_big.userInteractionEnabled = TRUE;
	specdata_btn_big.userInteractionEnabled = TRUE;
	connect_btn_big.userInteractionEnabled = TRUE;
	
	btn1_view1.selected = FALSE;
	btn2_view2.selected = FALSE;
	btn3_view3.selected = FALSE;
	btn4_view4.selected = FALSE;
	
	product_btn_big.tag = 1;
	inspired_btn_big.tag = 2;
	specdata_btn_big.tag = 4;
	connect_btn_big.tag = 3;
	
	beinspired_detail_view.frame = CGRectMake(320, 44, 320, 396);
	start_search_view.frame = CGRectMake(320 , 44 , search_view.frame.size.width , search_view.frame.size.height);
	
	logoView.frame = CGRectMake(0, 460, logoView.frame.size.width, logoView.frame.size.height);
	my1View.frame = CGRectMake(0, 538, my1View.frame.size.width, my1View.frame.size.height);
	my2View.frame = CGRectMake(80, 538, my2View.frame.size.width, my2View.frame.size.height);
	my4View.frame = CGRectMake(160, 538, my4View.frame.size.width, my4View.frame.size.height);
	my3View.frame = CGRectMake(240, 538, my3View.frame.size.width, my3View.frame.size.height);
	
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.3];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(animDone:finished:context:)];
	logoView.frame = CGRectMake( 0, 44, logoView.frame.size.width, logoView.frame.size.height);
	my1View.frame = CGRectMake( 0, 122, my1View.frame.size.width, my1View.frame.size.height);
	my2View.frame = CGRectMake( 80, 122, my2View.frame.size.width, my2View.frame.size.height);
	my4View.frame = CGRectMake( 160, 122, my4View.frame.size.width, my4View.frame.size.height);
	my3View.frame = CGRectMake( 240, 122, my3View.frame.size.width, my3View.frame.size.height);
	add_scroll_view.frame = CGRectMake(0, 370, add_scroll_view.frame.size.width, add_scroll_view.frame.size.height);
	[UIView commitAnimations];
	
	//[self.view setUserInteractionEnabled:TRUE];
	
	
	
	
	
	btn1_view1.selected = NO;
	btn2_view2.selected = NO;
	btn3_view3.selected = NO;
	btn4_view4.selected = NO;
	product_btn_big.userInteractionEnabled = TRUE;
	inspired_btn_big.userInteractionEnabled = TRUE;
	specdata_btn_big.userInteractionEnabled = TRUE;
	connect_btn_big.userInteractionEnabled = TRUE;
	productView_my1View.frame = CGRectMake(-309, 63, productView_my1View.frame.size.width, productView_my1View.frame.size.height);
	inspiredView_my2View.frame = CGRectMake(-309, 63, inspiredView_my2View.frame.size.width, inspiredView_my2View.frame.size.height);
	connectView_my3View.frame = CGRectMake(-309, 63, connectView_my3View.frame.size.width, connectView_my3View.frame.size.height);
	specdataView_my4View.frame = CGRectMake(-309, 63, specdataView_my4View.frame.size.width, specdataView_my4View.frame.size.height);
	
	spec_sub_detail_view.frame = CGRectMake(-309, 63, spec_sub_detail_view.frame.size.width, spec_sub_detail_view.frame.size.height);
	
	
	web_view.frame = CGRectMake(320, 44, 320, 416);
	
	productdetail_sub_view.frame = CGRectMake(320, 44, productdetail_sub_view.frame.size.width, productdetail_sub_view.frame.size.height);
	
	specdata_sub_view.frame = CGRectMake(320, 39, 320, 396+5);
	
	
	product_detail.frame = CGRectMake(-309, 63,product_detail.frame.size.width, product_detail.frame.size.height);
	
	product_Lvl3_view.frame = CGRectMake(-309, 63,product_Lvl3_view.frame.size.width, product_Lvl3_view.frame.size.height);
	
	beinspired_detail_view.frame = CGRectMake(320, 44, 320, 396);
	image_detail.frame=CGRectMake(320,44,image_detail.frame.size.width,image_detail.frame.size.height);
	
	search_view.frame = CGRectMake(0, 460, 320, 396);
	
	menu_view.frame = CGRectMake(0, 460, 320, 396);
}

//====================================================================


#pragma mark show & hide detail_img_view Zoom
-(void)show_detail_img:(id)val
{
	UIButton *btn = (UIButton*)val;
	NSLog(@"%d",btn.tag);
	NSString *ImgStr = [NSString stringWithFormat:@"%@",btn.titleLabel.text];
	
	back_btn.tag = 9999;
	if ([back_btn_tag_Arr containsObject:[NSString stringWithFormat:@"%d",back_btn.tag]]) {
		[back_btn_tag_Arr removeObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
	}
	[back_btn_tag_Arr addObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
	
	
	detail_img_view = [[UIImageView alloc]init];
	detail_img_view.frame = CGRectMake( 0, 0, 271, 278);
	[productZoomScroll addSubview:detail_img_view];
	productZoomScroll.layer.cornerRadius=10.0;
	[productZoomScroll.layer setMasksToBounds:YES];
	
	productZoomScroll.contentSize = CGSizeMake(271, 278);
	productZoomScroll.contentOffset = CGPointMake(0, 0);
	productZoomScroll.minimumZoomScale = 1.0;
	productZoomScroll.maximumZoomScale = 2.0;
	//[productZoomScroll setZoomScale:productZoomScroll.minimumZoomScale];
	productZoomScroll.backgroundColor = [UIColor whiteColor];
	
	detail_img_view.image = nil;
	EGOImageView *myimageView = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"place_productZoom_img.png"]];
	myimageView.frame = CGRectMake( 0, 0, 271, 278);
	[detail_img_view addSubview:myimageView];
	CATransition *transition = [CATransition animation];
	transition.duration = 0.75;		
	transition.type = kCATransitionFade;
	[myimageView.layer addAnimation:transition forKey:nil];
	myimageView.imageURL = [NSURL URLWithString:[ImgStr stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
	[myimageView release];
	
	[self.view bringSubviewToFront:image_detail];
	
	image_detail.frame=CGRectMake(0,44,image_detail.frame.size.width,image_detail.frame.size.height);
	CATransition *animation = [CATransition animation];
    [animation setDelegate:self];
    [animation setDuration:1];
    [animation setType:kCATransitionFade];
    [animation setSubtype:kCATransitionFade];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [[image_detail layer] addAnimation:animation forKey:@"SetView3bkView"];
}


-(IBAction)close_image_detail
{
	[detail_img_view removeFromSuperview];
	detail_img_view = nil;
	[detail_img_view release];
	
	if([back_btn_tag_Arr count]!=0)
	[back_btn_tag_Arr removeLastObject];
	
	image_detail.frame=CGRectMake(320,44,image_detail.frame.size.width,image_detail.frame.size.height);
	CATransition *animation = [CATransition animation];
    [animation setDelegate:self];
    [animation setDuration:1];
    [animation setType:kCATransitionFade];
    [animation setSubtype:kCATransitionFade];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [[image_detail layer] addAnimation:animation forKey:@"SetView3bkView"];
}

//====================================================================


#pragma mark show & hide search view
-(IBAction)show_search_view
{
	[self.view setUserInteractionEnabled:FALSE];
	self.search_Array = nil;
	[first_search_list_tbl reloadData];
	first_search_list_tbl.hidden = TRUE;
	
	back_btn.tag = 8;
	if ([back_btn_tag_Arr containsObject:[NSString stringWithFormat:@"%d",back_btn.tag]]) {
		[back_btn_tag_Arr removeObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
	}
	[back_btn_tag_Arr addObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
	
	
	
	if (!search_flag) {
		searchtxt.text = @"";
		search_flag = TRUE;
		
		if (productdetail_sub_view.frame.origin.x == 0) {
			
			if([pathArray count]!=0)
					[pathArray removeLastObject];
			
			
		}
		
		if(search_parh_arr)
		{
			search_parh_arr = nil;
			[search_parh_arr release];
		}
		
		search_parh_arr = [[NSMutableArray alloc]init];
		//back_btn.hidden = FALSE;
		[self.view bringSubviewToFront:search_view];
		[self.view bringSubviewToFront:myPgressIndicator];
		
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.8];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDidStopSelector:@selector(animDone:finished:context:)];
		search_view.frame = CGRectMake(0, 44, 320, 396);
		[UIView commitAnimations];
		
		[searchtxt becomeFirstResponder];
		
	}else {
		[self close_search_view];
	}
}

-(void)close_search_view
{
	[self.view setUserInteractionEnabled:FALSE];
	
	search_parh_arr = nil;
	[search_parh_arr release];
	
	if([back_btn_tag_Arr count]!=0)
	[back_btn_tag_Arr removeLastObject];
	
	//if(!isLoded){
		if(Web_req)
		{
			[Web_req cancelReq];
			Web_req = nil;
			[Web_req release];
		}
		//isLoded = TRUE;
    //}
	
	if (back_btn_tag_Arr.count == 0) {
		back_btn.hidden = TRUE;
	}
	
	search_flag = FALSE;
	
	if (productdetail_sub_view.frame.origin.x == 0) {
		productdetail_sub_view.frame = CGRectMake(320, 44, 320, 396);

		if([back_btn_tag_Arr count]!=0)
			[back_btn_tag_Arr removeLastObject];
	}
	
	if(start_search_view.frame.origin.x == 0)
	{
		start_search_view.frame = CGRectMake(320, 44, start_search_view.frame.size.width, start_search_view.frame.size.height);
		if([back_btn_tag_Arr count]!=0)
			[back_btn_tag_Arr removeLastObject];
	}
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.8];
	[searchtxt resignFirstResponder];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(animDone:finished:context:)];
	search_view.frame = CGRectMake(0, 460, 320, 396);
	[UIView commitAnimations];
	
}

//====================================================================

#pragma mark show & hide menu view

-(IBAction)menu_btn_clicked
{
	[self.view setUserInteractionEnabled:FALSE];
	[menu_tbl reloadData];
	
	back_btn.tag = 7;	
	if ([back_btn_tag_Arr containsObject:[NSString stringWithFormat:@"%d",back_btn.tag]]) {
		[back_btn_tag_Arr removeObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
	}
	[back_btn_tag_Arr addObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
	
	if (!menu_flag) {
		menu_flag = TRUE;
		back_btn.hidden = FALSE;
		[self.view bringSubviewToFront:menu_view];
		[searchtxt resignFirstResponder];
		
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.8];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDidStopSelector:@selector(animDone:finished:context:)];
		menu_view.frame = CGRectMake(0, 44, 320, 396);
		[UIView commitAnimations];
	}else {
		[self close_menu_view];
	}
	
	
}

-(void)close_menu_view
{
	[self.view setUserInteractionEnabled:FALSE];
	if([back_btn_tag_Arr count]!=0)
	[back_btn_tag_Arr removeLastObject];
	
	if (back_btn_tag_Arr.count == 0) {
		back_btn.hidden = TRUE;
	}
	
	menu_flag = FALSE;
	
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.8];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(animDone:finished:context:)];
	menu_view.frame = CGRectMake(0, 460, 320, 396);
	[UIView commitAnimations];
	
}

//====================================================================

#pragma mark Show & hide beinspired detail
-(void)beinspired_detail:(id)sender
{
	UIButton *btn = (UIButton*)sender;
	NSLog(@"%d",btn.tag);
	NSLog(@"%@",btn.titleLabel.text);
	
	int seePhoto = [[NSString stringWithFormat:@"%@",btn.titleLabel.text] intValue];
	
	self.BeInspire_detail_lbl_array = nil;
	[BeInspire_useproduct_tbl reloadData];
	
	NSMutableArray *BeInspire_detail_lbl_array_temp = [[NSMutableArray alloc]init];
	for (int i = 0; i < [self.BeInspire_Array count]; i++) {
		int btnId = [[[self.BeInspire_Array objectAtIndex:i] valueForKey:@"nid"] intValue];
			if (btnId == btn.tag) {
				[BeInspire_detail_lbl_array_temp addObject:[self.BeInspire_Array objectAtIndex:i]];
			}
	}
	
	self.BeInspire_detail_lbl_array = BeInspire_detail_lbl_array_temp;
    BeInspire_detail_lbl_array_temp = nil;
	[BeInspire_detail_lbl_array_temp release];
	[BeInspire_useproduct_tbl reloadData];
	
	if ([[[BeInspire_detail_lbl_array objectAtIndex:0]valueForKey:@"products_used"] count]==0) {
		BeInspire_useproduct_tbl.hidden = TRUE;
	}else {
		BeInspire_useproduct_tbl.hidden = FALSE;
	}
	
	if (pagingScrollView) {
		[pagingScrollView removeFromSuperview];
		pagingScrollView = nil;
		[pagingScrollView release];
	}
	
	pagingScrollView = [[UIScrollView alloc] initWithFrame:inspired_zoom_view.bounds];
    pagingScrollView.pagingEnabled = YES;
    pagingScrollView.backgroundColor = [UIColor blackColor];
    pagingScrollView.showsVerticalScrollIndicator = NO;
    pagingScrollView.showsHorizontalScrollIndicator = NO;
    pagingScrollView.contentSize = [self contentSizeForPagingScrollView];
    pagingScrollView.delegate = self;
	[inspired_zoom_view addSubview:pagingScrollView];
	pagingScrollView.backgroundColor = [UIColor clearColor];
	
    // Step 2: prepare to tile content
	
	if (recycledPages) {
		recycledPages = nil;
		[recycledPages release];
	}
	
	if (visiblePages) {
		visiblePages = nil;
		[visiblePages release];
	}
	
    recycledPages = [[NSMutableSet alloc] init];
    visiblePages  = [[NSMutableSet alloc] init];
	[self tilePages];
	
	
	
	
	id value1 = [[self.BeInspire_detail_lbl_array objectAtIndex:0] valueForKey:@"title"];
	NSString *product = @"No name";
	if(value1 != [NSNull null])
		product = (NSString *)value1;
	[BeInspire_detail_lbl setText:[NSString stringWithFormat:@"%@",product]];
	
	back_btn.tag = 11;
	if ([back_btn_tag_Arr containsObject:[NSString stringWithFormat:@"%d",back_btn.tag]]) {
		[back_btn_tag_Arr removeObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
	}
	[back_btn_tag_Arr addObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
	
	beinspired_detail_view.frame=CGRectMake(0,44,320,396);
	CATransition *animation = [CATransition animation];
    [animation setDelegate:self];
    [animation setDuration:1];
    [animation setType:kCATransitionFade];
    [animation setSubtype:kCATransitionFade];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [[beinspired_detail_view layer] addAnimation:animation forKey:@"SetView3bkView"];
	
	[pagingScrollView setContentOffset:CGPointMake((310*seePhoto), 0) animated:NO];
}

- (CGSize)contentSizeForPagingScrollView {
    CGRect bounds = pagingScrollView.bounds;
    return CGSizeMake(bounds.size.width * [self imageCount], bounds.size.height);
}

- (NSUInteger)imageCount {
	NSLog(@"%d",[[[self.BeInspire_detail_lbl_array objectAtIndex:0]valueForKey:@"imagepath"] count]);
    return [[[self.BeInspire_detail_lbl_array objectAtIndex:0]valueForKey:@"imagepath"] count];
}
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    pagingScrollView.contentSize = [self contentSizeForPagingScrollView];
    for (ImageScrollView_inspire *page in visiblePages) {
        CGPoint restorePoint = [page pointToCenterAfterRotation];
        CGFloat restoreScale = [page scaleToRestoreAfterRotation];
        page.frame = [self frameForPageAtIndex:page.index];
        [page setMaxMinZoomScalesForCurrentBounds];
        [page restoreCenterPoint:restorePoint scale:restoreScale];
        
    }
    CGFloat pageWidth = pagingScrollView.bounds.size.width;
    CGFloat newOffset = (firstVisiblePageIndexBeforeRotation * pageWidth) + (percentScrolledIntoFirstVisiblePage * pageWidth);
    pagingScrollView.contentOffset = CGPointMake(newOffset, 0);
}
#pragma mark -
#pragma mark Tiling and page configuration

- (void)tilePages 
{
    CGRect visibleBounds = pagingScrollView.bounds;	
    int firstNeededPageIndex = floorf(CGRectGetMinX(visibleBounds) / CGRectGetWidth(visibleBounds));
    int lastNeededPageIndex  = floorf((CGRectGetMaxX(visibleBounds)-1) / CGRectGetWidth(visibleBounds));
    firstNeededPageIndex = MAX(firstNeededPageIndex, 0);
    lastNeededPageIndex  = MIN(lastNeededPageIndex, [self imageCount] - 1);
    
    for (ImageScrollView_inspire *page in visiblePages) {
        if (page.index < firstNeededPageIndex || page.index > lastNeededPageIndex) {
            [recycledPages addObject:page];
            [page removeFromSuperview];
        }
    }
    [visiblePages minusSet:recycledPages];
    
    for (int index = firstNeededPageIndex; index <= lastNeededPageIndex; index++) {
        if (![self isDisplayingPageForIndex:index]) {
            ImageScrollView_inspire *page = [self dequeueRecycledPage];
            if (page == nil) {
                page = [[[ImageScrollView_inspire alloc] init] autorelease];
            }
            [self configurePage:page forIndex:index];
            [pagingScrollView addSubview:page];
            [visiblePages addObject:page];
        }
    }    
}

- (ImageScrollView_inspire *)dequeueRecycledPage
{
    ImageScrollView_inspire *page = [recycledPages anyObject];
    if (page) {
        [[page retain] autorelease];
        [recycledPages removeObject:page];
    }
    return page;
}

- (BOOL)isDisplayingPageForIndex:(NSUInteger)index
{
    BOOL foundPage = NO;
    for (ImageScrollView_inspire *page in visiblePages) {
        if (page.index == index) {
            foundPage = YES;
            break;
        }
    }
    return foundPage;
}

- (void)configurePage:(ImageScrollView_inspire *)page forIndex:(NSUInteger)index
{
    page.index = index;
    page.frame = [self frameForPageAtIndex:index];
	//[page displayImage:[self imageAtIndex:index]];
	[page displayImageEgo:[self imageAtIndex:index]];

}

#pragma mark -
#pragma mark  Frame calculations
#define PADDING  10



- (CGRect)frameForPageAtIndex:(NSUInteger)index {
    CGRect bounds = pagingScrollView.bounds;
    CGRect pageFrame = bounds;
    pageFrame.size.width -= (2 * PADDING);
    pageFrame.origin.x = (bounds.size.width * index) + PADDING;
    return pageFrame;
}

- (NSString *)imageAtIndex:(NSUInteger)index {
    //NSString *imageName = [[NSString alloc] init];
	NSString *imageName = [[[[self.BeInspire_detail_lbl_array objectAtIndex:0]valueForKey:@"imagepath"]objectAtIndex:index] valueForKey:@"images"];
    return imageName;    
}



-(IBAction)close_beinspired_detail
{
	if([back_btn_tag_Arr count]!=0)
	[back_btn_tag_Arr removeLastObject];
	[self.view setUserInteractionEnabled:TRUE];
	
	[BeInspire_detail_img removeFromSuperview];
	BeInspire_detail_img = nil;
	[BeInspire_detail_img release];
	
	beinspired_detail_view.frame=CGRectMake(320,44,320,396);
	CATransition *animation = [CATransition animation];
    [animation setDelegate:self];
    [animation setDuration:1];
    [animation setType:kCATransitionFade];
    [animation setSubtype:kCATransitionFade];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [[beinspired_detail_view layer] addAnimation:animation forKey:@"SetView3bkView"];
	
}

//====================================================================

#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	
	if (tableView == BeInspire_Tbl) {
		return [[self.BeInspire_Array valueForKey:@"title"] count];
	} else if (tableView == exploreourproduct_tbl) {
		return [self.subCat_lise_Array count];
	}else {
		return 1;
	}
	return 0;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	if (tableView == product_tbl) {
		return [self.mainCat_Array count];
	}
	
	if (tableView == specdata_tbl) {
		return [self.spec_data_Array count];
	}
	
	//if (tableView == specdata_sub_tbl) {
//		return [self.spec_data_final_Array count];
//	}
	
	if (tableView == sub_detail_view) {
		return [self.subCat_Array count];
	}
	
	if (tableView == exploreourproduct_tbl) {
		int n_r = [[[self.subCat_lise_Array objectAtIndex:section]valueForKey:@"product"] count]/3;
		if([[[self.subCat_lise_Array objectAtIndex:section] valueForKey:@"product"]count]%3 == 0){
			return n_r;
		}
		else
		{
			return n_r+1;
		}
		
		
		return 0;
	}
	
	if (tableView == BeInspire_Tbl) {
		int n_r =[[[self.BeInspire_Array objectAtIndex:section]valueForKey:@"imagepath"] count]/3;
		if([[[self.BeInspire_Array objectAtIndex:section]valueForKey:@"imagepath"] count]%3 == 0){
			return n_r;
		}
		else
		{
			return n_r+1;
		}
	}
	
	if (tableView == BeInspire_useproduct_tbl) 
	{
		//NSLog(@"row %@",BeInspire_detail_lbl_array);
		return [[[BeInspire_detail_lbl_array objectAtIndex:0]valueForKey:@"products_used"] count];
	}
	
	if (tableView == spec_sub_detail_tbl) {
		return [self.spec_data_detail_Array count];
	}
	
	if (tableView == final_detail_tbl) {
		return [[self.product_final_Array valueForKey:@"imagepath"] count];
	}
	
	if (tableView == final_detail_row_tbl) {
		return [self.linesArray count]-1;
	}
	if (tableView == start_search_tbl){
		return [self.search_array_second count];
	}
	if (tableView == product_Lvl3_tbl){
		return [self.product_lvl3_Array count];
	}
	
	if (tableView == first_search_list_tbl){
		return [self.search_Array count];
	}
	
	if (tableView == menu_tbl) {
		return 8;
	}
	
    return 0;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
	tableView.separatorColor = [UIColor whiteColor];
	tableView.backgroundView = nil;
	
	//if (tableView == specdata_sub_tbl) {
//		specdatacustomcell *cell = [specdatacustomcell dequeOrCreateInTable:tableView];
//		//[cell setParentObj:self];
//		//cell.product_btn.tag = indexPath.row;
//		[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//		[cell.product_btn setTag:indexPath.row];
//		[cell.spec_btn setTag:indexPath.row];
//		[cell.inst_btn setTag:indexPath.row];
//		[cell.ies_btn setTag:indexPath.row];
//		
//		
//		id value1 = [[self.spec_data_final_Array objectAtIndex:indexPath.row]valueForKey:@"spec_pdfpath"];
//		NSString *str1 = @"";
//		if(value1 != [NSNull null])
//			str1 = (NSString *)value1;
//		
//		
//		id value2 = [[self.spec_data_final_Array objectAtIndex:indexPath.row]valueForKey:@"inst_pdfpath"];
//		NSString *str2 = @"";
//		if(value2 != [NSNull null])
//			str2 = (NSString *)value2;
//		
//		id value3 = [[self.spec_data_final_Array objectAtIndex:indexPath.row]valueForKey:@"ies"];
//		NSString *str3 = @"";
//		if(value3 != [NSNull null])
//			str3 = (NSString *)value3;
//		
//		id value4 = [[self.spec_data_final_Array objectAtIndex:indexPath.row]valueForKey:@"images"];
//		NSString *str4 = @"";
//		if(value4 != [NSNull null])
//			str4 = (NSString *)value4;
//		
//		id value5 = [[self.spec_data_final_Array objectAtIndex:indexPath.row]valueForKey:@"images_actual"];
//		NSString *str5 = @"";
//		if(value5 != [NSNull null])
//			str5 = (NSString *)value5;
//		
//		
//		if(![str1 isEqualToString:@""])
//		{
//			cell.spec_btn.hidden = FALSE;
//			[cell.spec_btn addTarget:self action:@selector(aMethod1:) forControlEvents:UIControlEventTouchUpInside];
//		}else {
//			cell.spec_btn.hidden = TRUE;
//		}
//
//		
//		if(![str2 isEqualToString:@""])
//		{
//			cell.inst_btn.hidden = FALSE;
//			[cell.inst_btn addTarget:self action:@selector(aMethod2:) forControlEvents:UIControlEventTouchUpInside];
//			
//		}else {
//			cell.inst_btn.hidden = TRUE;
//		}
//		
//		if(![str3 isEqualToString:@""])
//		{
//			cell.ies_btn.hidden = FALSE;
//			[cell.ies_btn addTarget:self action:@selector(aMethod3:) forControlEvents:UIControlEventTouchUpInside];
//		}else {
//			cell.ies_btn.hidden = TRUE;
//		}
//		
//		if(![str4 isEqualToString:@""])
//		{
//			[cell.product_btn setTitle:[NSString stringWithFormat:@"%@",str5] forState:UIControlStateNormal];
//			[cell.product_btn addTarget:self action:@selector(show_detail_img:) forControlEvents:UIControlEventTouchUpInside];
//
//			
//			EGOImageView *myimageView = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"placeholder.png"]];
//			myimageView.frame = [cell.product_btn bounds];
//			[cell.product_btn addSubview:myimageView];
//			CATransition *transition = [CATransition animation];
//			transition.duration = 0.75;		
//			transition.type = kCATransitionFade;
//			[myimageView.layer addAnimation:transition forKey:nil];
//			myimageView.imageURL = [NSURL URLWithString:str4];
//			[myimageView release];
//			
//		}
//		
//		id val = [[self.spec_data_final_Array objectAtIndex:indexPath.row]valueForKey:@"title"];
//		NSString *str = @"";
//		if(val != [NSNull null])
//			str = (NSString *)val;
//		
//		
//		[cell.name_lbl setBackgroundColor:[UIColor clearColor]];
//		[cell.name_lbl setFont:[UIFont fontWithName:@"helvetica" size:9]];
//		[cell.name_lbl setText:[NSString stringWithFormat:@"%@",str]];
//		[cell.name_lbl setNumberOfLines:2];
//		[cell.name_lbl setLineBreakMode:UILineBreakModeClip];
//		
//		
//		return cell;
//	}
//	else 
	
	if(tableView == product_tbl){
		
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		img_cell_bk = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"row_bk_iphone.png"]];
		[cell.contentView addSubview:img_cell_bk];
	}
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	// Configure the cell.
	[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
		
		id value = [[self.mainCat_Array objectAtIndex:indexPath.row]valueForKey:@"link_title"];
		NSString *main_str = @"";
		if(value != [NSNull null])
			main_str = (NSString *)value;
		
		cell.textLabel.text = [NSString stringWithFormat:@"%@",main_str];
		cell.textLabel.textColor = [UIColor whiteColor];
		cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
	
		return cell;
	}
	else if(tableView == specdata_tbl){
		
		
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		if (cell == nil) {
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
			img_cell_bk = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"row_bk_iphone.png"]];
			[cell.contentView addSubview:img_cell_bk];
		}
		
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		// Configure the cell.
		[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
		
		id value = [[self.spec_data_Array objectAtIndex:indexPath.row] valueForKey:@"name"];
		NSString *spec_str = @"";
		if(value != [NSNull null])
			spec_str = (NSString *)value;
		
		cell.textLabel.text = [NSString stringWithFormat:@"%@",spec_str];
		cell.textLabel.textColor = [UIColor whiteColor];
		cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
		
		return cell;
	}
	
	
	else if(tableView == sub_detail_view){
		
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		if (cell == nil) {
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
			img_cell_bk = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"row_bk_iphone.png"]];
			[cell.contentView addSubview:img_cell_bk];
		}
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		// Configure the cell.
		[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
		
		id value = [[self.subCat_Array objectAtIndex:indexPath.row]valueForKey:@"sub_name"];
		NSString *cat_str = @"";
		if(value != [NSNull null])
			cat_str = (NSString *)value;
		
		cell.textLabel.text = [NSString stringWithFormat:@"%@",cat_str];
		cell.textLabel.textColor = [UIColor whiteColor];
		cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
		return cell;
	}else
	if (tableView == exploreourproduct_tbl) {
		exploreourproductscustomcell *cell = nil;
		cell = [exploreourproductscustomcell dequeOrCreateInTable:tableView];
		[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
		exploreourproduct_tbl.backgroundView = nil;
		cell.backgroundView = nil;
		tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
		tableView.separatorColor = [UIColor whiteColor];
		
		if([[[self.subCat_lise_Array objectAtIndex:indexPath.section]valueForKey:@"product"] count] > ((2 * indexPath.row) + (1 * indexPath.row))+1 - 1)
		{
			id value = [[[[self.subCat_lise_Array objectAtIndex:indexPath.section]valueForKey:@"product"] objectAtIndex:((2 * indexPath.row) + (1 * indexPath.row))+1 - 1] valueForKey:@"title"];
			NSString *product_str = @"";
			if(value != [NSNull null])
			product_str = (NSString *)value;
			
			[cell.lbl1 setHidden:FALSE];
			cell.imageView1.hidden = FALSE;
			cell.btn1.hidden = FALSE;
			
			cell.lbl1.text = [NSString stringWithFormat:@"%@",product_str];
			
			id value1 = [[self.subCat_lise_Array objectAtIndex:indexPath.section]valueForKey:@"title"];
			NSString *str1 = @"";
			if(value1 != [NSNull null])
				str1 = (NSString *)value1;
			
			[cell.btn1 setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
			cell.btn1.titleLabel.text = [NSString stringWithFormat:@"%@",str1];
			cell.btn1.tag = [[[[[self.subCat_lise_Array objectAtIndex:indexPath.section]valueForKey:@"product"] objectAtIndex:((2 * indexPath.row) + (1 * indexPath.row))+1 - 1] valueForKey:@"pid"]intValue];
			[cell.btn1 addTarget:self action:@selector(show_productdetail_sub_data:) forControlEvents:UIControlEventTouchUpInside];
			
			
			[cell setThumbnailImage1:[NSString stringWithFormat:@"%@",[[[[self.subCat_lise_Array objectAtIndex:indexPath.section]valueForKey:@"product"] objectAtIndex:((2 * indexPath.row) + (1 * indexPath.row))+1 - 1] valueForKey:@"image"]]];
			
		}
		else {
			cell.imageView1.hidden = TRUE;
			cell.lbl1.hidden = TRUE;
			cell.btn1.hidden = TRUE;
		}
		
		
		
		if([[[self.subCat_lise_Array objectAtIndex:indexPath.section]valueForKey:@"product"] count] > ((2 * indexPath.row) + (1 * indexPath.row))+2 - 1)
		{
			id value = [[[[self.subCat_lise_Array objectAtIndex:indexPath.section]valueForKey:@"product"] objectAtIndex:((2 * indexPath.row) + (1 * indexPath.row))+2 - 1] valueForKey:@"title"];
			NSString *product_str = @"";
			if(value != [NSNull null])
				product_str = (NSString *)value;
			
			[cell.lbl2 setHidden:FALSE];
			cell.lbl2.text = [NSString stringWithFormat:@"%@",product_str];
			
			id value2 = [[self.subCat_lise_Array objectAtIndex:indexPath.section]valueForKey:@"title"];
			NSString *str2 = @"";
			if(value2 != [NSNull null])
				str2 = (NSString *)value2;
			
			cell.btn2.hidden = FALSE;
			[cell.btn2 setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
			cell.btn2.titleLabel.text = [NSString stringWithFormat:@"%@",str2];
			[cell.btn2 addTarget:self action:@selector(show_productdetail_sub_data:) forControlEvents:UIControlEventTouchUpInside];
			cell.btn2.tag = [[[[[self.subCat_lise_Array objectAtIndex:indexPath.section]valueForKey:@"product"] objectAtIndex:((2 * indexPath.row) + (1 * indexPath.row))+2 - 1]  valueForKey:@"pid"]intValue];
			
			cell.imageView2.hidden = FALSE;
			[cell setThumbnailImage2:[NSString stringWithFormat:@"%@",[[[[self.subCat_lise_Array objectAtIndex:indexPath.section]valueForKey:@"product"] objectAtIndex:((2 * indexPath.row) + (1 * indexPath.row))+2 - 1] valueForKey:@"image"]]];
		}
		else {
			cell.imageView2.hidden = TRUE;
			cell.lbl2.hidden = TRUE;
			cell.btn2.hidden = TRUE;
		}
		
		
		if([[[self.subCat_lise_Array objectAtIndex:indexPath.section]valueForKey:@"product"] count] > ((2 * indexPath.row) + (1 * indexPath.row))+3 - 1)
		{
			id value = [[[[self.subCat_lise_Array objectAtIndex:indexPath.section]valueForKey:@"product"] objectAtIndex:((2 * indexPath.row) + (1 * indexPath.row))+3 - 1] valueForKey:@"title"];
			NSString *product_str = @"";
			if(value != [NSNull null])
				product_str = (NSString *)value;
			
			[cell.lbl3 setHidden:FALSE];
			cell.lbl3.text = [NSString stringWithFormat:@"%@",product_str];
			
			id value3 = [[self.subCat_lise_Array objectAtIndex:indexPath.section]valueForKey:@"title"];
			NSString *str3 = @"";
			if(value3 != [NSNull null])
				str3 = (NSString *)value3;
			
			cell.btn3.hidden = FALSE;
			[cell.btn3 setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
			cell.btn3.titleLabel.text =  [NSString stringWithFormat:@"%@",str3];
			cell.btn3.tag = [[[[[self.subCat_lise_Array objectAtIndex:indexPath.section]valueForKey:@"product"] objectAtIndex:((2 * indexPath.row) + (1 * indexPath.row))+3 - 1]  valueForKey:@"pid"]intValue];
			[cell.btn3 addTarget:self action:@selector(show_productdetail_sub_data:) forControlEvents:UIControlEventTouchUpInside];
			
			cell.imageView3.hidden = FALSE;
			[cell setThumbnailImage3:[NSString stringWithFormat:@"%@",[[[[self.subCat_lise_Array objectAtIndex:indexPath.section]valueForKey:@"product"] objectAtIndex:((2 * indexPath.row) + (1 * indexPath.row))+3 - 1] valueForKey:@"image"]]];
			
		}
		else {
			cell.imageView3.hidden = TRUE;
			cell.lbl3.hidden = TRUE;
			cell.btn3.hidden = TRUE;
		}
		
		return cell;
	}
	else 
	if (tableView == BeInspire_Tbl) {
		
		
		beinspireCustomcell *cell = nil;
		cell = [beinspireCustomcell dequeOrCreateInTable:tableView];
		[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
		[cell setBackgroundColor:[UIColor clearColor]];
		cell.backgroundView = nil;
		tableView.separatorColor = [UIColor clearColor];
		
		if([[[self.BeInspire_Array objectAtIndex:indexPath.section]valueForKey:@"imagepath"] count] > ((2 * indexPath.row) + (1 * indexPath.row))+1 - 1)
		{
			
			cell.imageView1.hidden = FALSE;
			cell.btn1.hidden = FALSE;
			
			[cell.btn1 setTitle:[NSString stringWithFormat:@"%d",((2 * indexPath.row) + (1 * indexPath.row))+1 - 1] forState:UIControlStateNormal];
			[cell.btn1 setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
			//[cell.btn1 setTitle:[NSString stringWithFormat:@"%@",[[[[self.BeInspire_Array objectAtIndex:indexPath.section]valueForKey:@"imagepath"] objectAtIndex:((2 * indexPath.row) + (1 * indexPath.row))+1 - 1] valueForKey:@"images"]] forState:UIControlStateNormal];
			cell.btn1.tag = [[[self.BeInspire_Array objectAtIndex:indexPath.section]valueForKey:@"nid"] intValue];
			[cell.btn1 addTarget:self action:@selector(beinspired_detail:) forControlEvents:UIControlEventTouchUpInside];
			
			[cell setThumbnailImage1:[NSString stringWithFormat:@"%@",[[[[self.BeInspire_Array objectAtIndex:indexPath.section]valueForKey:@"imagepath"] objectAtIndex:((2 * indexPath.row) + (1 * indexPath.row))+1 - 1] valueForKey:@"images"]]];
		
		}
		else {
			cell.imageView1.hidden = TRUE;
			cell.btn1.hidden = TRUE;
		}

		
		
		if([[[self.BeInspire_Array objectAtIndex:indexPath.section]valueForKey:@"imagepath"] count] > ((2 * indexPath.row) + (1 * indexPath.row))+2 - 1)
		{
			cell.imageView2.hidden = FALSE;
			cell.btn2.hidden = FALSE;
			
			[cell.btn2 setTitle:[NSString stringWithFormat:@"%d",((2 * indexPath.row) + (1 * indexPath.row))+2 - 1] forState:UIControlStateNormal];
			[cell.btn2 setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
			//[cell.btn2 setTitle:[NSString stringWithFormat:@"%@",[[[[self.BeInspire_Array objectAtIndex:indexPath.section]valueForKey:@"imagepath"] objectAtIndex:((2 * indexPath.row) + (1 * indexPath.row))+2 - 1] valueForKey:@"images"]] forState:UIControlStateNormal];
			cell.btn2.tag = [[[self.BeInspire_Array objectAtIndex:indexPath.section]valueForKey:@"nid"] intValue];
			[cell.btn2 addTarget:self action:@selector(beinspired_detail:) forControlEvents:UIControlEventTouchUpInside];
			
			[cell setThumbnailImage2:[NSString stringWithFormat:@"%@",[[[[self.BeInspire_Array objectAtIndex:indexPath.section]valueForKey:@"imagepath"] objectAtIndex:((2 * indexPath.row) + (1 * indexPath.row))+2 - 1] valueForKey:@"images"]]];
		}
		else {
			cell.imageView2.hidden = TRUE;
			cell.btn2.hidden = TRUE;
		}
		
		
		if([[[self.BeInspire_Array objectAtIndex:indexPath.section]valueForKey:@"imagepath"] count] > ((2 * indexPath.row) + (1 * indexPath.row))+3 - 1)
		{
			cell.imageView3.hidden = FALSE;
			cell.btn3.hidden = FALSE;
			
			[cell.btn3 setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
			
			[cell.btn3 setTitle:[NSString stringWithFormat:@"%d",((2 * indexPath.row) + (1 * indexPath.row))+3 - 1] forState:UIControlStateNormal];
			
			//[cell.btn3 setTitle:[NSString stringWithFormat:@"%@",[[[[self.BeInspire_Array objectAtIndex:indexPath.section]valueForKey:@"imagepath"] objectAtIndex:((2 * indexPath.row) + (1 * indexPath.row))+3 - 1] valueForKey:@"images"]] forState:UIControlStateNormal];
			cell.btn3.tag = [[[self.BeInspire_Array objectAtIndex:indexPath.section]valueForKey:@"nid"] intValue];
			[cell.btn3 addTarget:self action:@selector(beinspired_detail:) forControlEvents:UIControlEventTouchUpInside];
			
			[cell setThumbnailImage3:[NSString stringWithFormat:@"%@",[[[[self.BeInspire_Array objectAtIndex:indexPath.section]valueForKey:@"imagepath"] objectAtIndex:((2 * indexPath.row) + (1 * indexPath.row))+3 - 1] valueForKey:@"images"]]];
		}
		else {
			cell.imageView3.hidden = TRUE;
			cell.btn3.hidden = TRUE;
		}
			
		return cell;
	} else
	if (tableView == BeInspire_useproduct_tbl) {
		
		
		beinspireDetailCustomcell *cell = nil;
		cell = [beinspireDetailCustomcell dequeOrCreateInTable:tableView];
		[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
		
		[cell setThumbnailImage:[NSString stringWithFormat:@"%@",[[[[self.BeInspire_detail_lbl_array objectAtIndex:0] valueForKey:@"products_used"]objectAtIndex:indexPath.row]valueForKey:@"images"]]];
		
		id value2 = [[[[self.BeInspire_detail_lbl_array objectAtIndex:0] valueForKey:@"products_used"]objectAtIndex:indexPath.row]valueForKey:@"title"];
		NSString *product_name = @"No name";
		if(value2 != [NSNull null])
			product_name = (NSString *)value2;
		
		cell.lbl.text = [NSString stringWithFormat:@"%@",product_name];
		
		return cell;
	}else 
		if (tableView == spec_sub_detail_tbl) {
			
			UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
			if (cell == nil) {
				cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
				img_cell_bk = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"row_bk_iphone.png"]];
				[cell.contentView addSubview:img_cell_bk];
			}
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
			[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
			
			id value = [[self.spec_data_detail_Array objectAtIndex:indexPath.row]valueForKey:@"title"];
			NSString *spec_str = @"No name";
			if(value != [NSNull null])
				spec_str = (NSString *)value;
			
			cell.textLabel.numberOfLines = 2;
			cell.textLabel.text = [NSString stringWithFormat:@"%@",spec_str];
			cell.textLabel.textColor = [UIColor whiteColor];
			cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
			
			return cell;
		}else 
			if (tableView == final_detail_tbl) {
				finalProductImg *cell = nil;
				cell = [finalProductImg dequeOrCreateInTable:tableView];
				[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
								
				 
			    cell.final_btn.titleLabel.text = [NSString stringWithFormat:@"%@",[[[self.product_final_Array valueForKey:@"imagepath"]objectAtIndex:indexPath.row]valueForKey:@"images_actual"]];
				[cell.final_btn addTarget:self action:@selector(final_image_zoom:) forControlEvents:UIControlEventTouchUpInside];
				
				[cell setThumbnailImage:[NSString stringWithFormat:@"%@",[[[self.product_final_Array valueForKey:@"imagepath"]objectAtIndex:indexPath.row]valueForKey:@"images"]]];
				return cell;
			}
		else 
			if (tableView == final_detail_row_tbl) {
				UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
				if (cell == nil) {
					cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
					final_detail_row_tbl.backgroundView = nil;
					cell.backgroundView = nil;
				}
				
				[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
				[cell setBackgroundColor:[UIColor clearColor]];
				
				id value = [self.linesArray objectAtIndex:indexPath.row+1];
				NSString *str = @"No name";
				if(value != [NSNull null])
					str = (NSString *)value;
				
				NSString *lbl_str = [self decodeHTMLEntities:[NSString stringWithFormat:@"%@",str]];
				
				cell.textLabel.text = [NSString stringWithFormat:@"%@",lbl_str];
				cell.textLabel.font = [UIFont fontWithName:@"helvetica" size:12];
				cell.textLabel.numberOfLines = 0;
				[cell.textLabel setLineBreakMode:UILineBreakModeWordWrap];				
				return cell;
			}
		else 
			if (tableView == start_search_tbl){
				searchCustomCell *cell = nil;
				cell = [searchCustomCell dequeOrCreateInTable:tableView];
				[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
				tableView.separatorColor = [UIColor blackColor];
				
				id value = [[self.search_array_second objectAtIndex:indexPath.row] valueForKey:@"title"];
				NSString *str = @"No name";
				if(value != [NSNull null])
					str = (NSString *)value;
					str = [self decodeHTMLEntities:str];
				
				id value1 = [[self.search_array_second objectAtIndex:indexPath.row] valueForKey:@"body"];
				NSString *str1 = @"No name";
				if(value1 != [NSNull null])
					str1 = (NSString *)value1;
					str1 = [self decodeHTMLEntities:str1];
				
			    //cell.final_btn.titleLabel.text = [NSString stringWithFormat:@"%@",[[[self.product_final_Array valueForKey:@"imagepath"]objectAtIndex:indexPath.row]valueForKey:@"images_actual"]];
				//[cell.final_btn addTarget:self action:@selector(final_image_zoom:) forControlEvents:UIControlEventTouchUpInside];
				
				cell.search_title_lbl.text = [NSString stringWithFormat:@"%@",str];
				[cell.search_title_lbl setTextColor:[UIColor colorWithRed:132.0f/255.0 green:9.0f/255.0 blue:9.0f/255.0 alpha:1.0]];
				
				cell.search_desc_lbl.text = [NSString stringWithFormat:@"%@",str1];
				[cell.search_desc_lbl setFont:[UIFont fontWithName:@"helvetica" size:14]];
				
				return cell;
			}
		else 
			if (tableView == product_Lvl3_tbl){
				
				UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
				if (cell == nil) {
					cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
					product_Lvl3_tbl.backgroundView = nil;
					cell.backgroundView = nil;
					img_cell_bk = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"row_bk_iphone.png"]];
					[cell.contentView addSubview:img_cell_bk];
					
				}
				cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
				[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
				[cell setBackgroundColor:[UIColor clearColor]];
				
				id value = [[self.product_lvl3_Array objectAtIndex:indexPath.row] valueForKey:@"name"];
				NSString *str = @"No name";
				if(value != [NSNull null])
					str = (NSString *)value;
				
				cell.textLabel.textColor = [UIColor whiteColor];
				cell.textLabel.text = [NSString stringWithFormat:@"%@",str];
				cell.textLabel.font = [UIFont fontWithName:@"helvetica" size:14];
				cell.textLabel.numberOfLines = 0;
				[cell.textLabel setLineBreakMode:UILineBreakModeWordWrap];
				
				//return [self.product_lvl3_Array count];
				
				return cell;
			}
	
		else 
			if (tableView == first_search_list_tbl){
				
				UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
				if (cell == nil) {
					cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
					[tableView.layer setBorderWidth:1];
				}
				
				tableView.separatorColor = [UIColor blackColor];
				[cell setSelectionStyle:UITableViewCellSelectionStyleGray];
				[cell setBackgroundColor:[UIColor clearColor]];
				
				
				id value = [[self.search_Array objectAtIndex:indexPath.row] valueForKey:@"title"];
				NSString *str = @"No name";
				if(value != [NSNull null])
					str = (NSString *)value;
					str = [self decodeHTMLEntities:str];
				
				cell.textLabel.textColor = [UIColor blackColor];
				cell.textLabel.text = [NSString stringWithFormat:@"%@",str];
				cell.textLabel.font = [UIFont fontWithName:@"helvetica" size:14];
				cell.textLabel.numberOfLines = 0;
				[cell.textLabel setLineBreakMode:UILineBreakModeWordWrap];
				//return [self.search_Array count];
				
				return cell;
			}
		else
			if (tableView == menu_tbl) {
				
				UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
				if (cell == nil) {
					cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
					
				}
				tableView.separatorColor = [UIColor grayColor];
				// Configure the cell.
				[cell setSelectionStyle:UITableViewCellSelectionStyleGray];
				
				cell.textLabel.text = [NSString stringWithFormat:@"%@",[menu_arr objectAtIndex:indexPath.row]];
				cell.textLabel.textColor = [UIColor blackColor];
				cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17];
				
				return cell;
			}

    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	if (tableView == BeInspire_Tbl) 
	{
		id value = [[self.BeInspire_Array objectAtIndex:section]valueForKey:@"title"];
		NSString *product_str = @"No name";
		if(value != [NSNull null])
			product_str = (NSString *)value;
		
		return  product_str;
	}
	
	if (tableView == exploreourproduct_tbl) {
		
		id value = [[self.subCat_lise_Array objectAtIndex:section]valueForKey:@"title"] ;
		NSString *product_str = @"No name";
		if(value != [NSNull null])
			product_str = (NSString *)value;
		
		return  product_str;
	}
	
	if (tableView == final_detail_row_tbl) {
		if([self.linesArray count]!=0)
		{
			id value = [self.linesArray objectAtIndex:0] ;
			NSString *str = @"No name";
			if(value != [NSNull null])
				str = (NSString *)value;
			
			return  str;
		}
		
	}
	return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (tableView == final_detail_row_tbl) {
		NSString *str = [self decodeHTMLEntities:[self.linesArray objectAtIndex:indexPath.row+1]];
		CGSize textSize = [str sizeWithFont:[UIFont systemFontOfSize:12] constrainedToSize:CGSizeMake(175, 5000)];
		return textSize.height>30?textSize.height:30;
	}
	
	if (tableView == first_search_list_tbl){
		return 30;	
	}
	
	return tableView.rowHeight;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section 
{
	if (tableView == BeInspire_Tbl) 
	{
		UIView *headerView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 40)] autorelease];
		[headerView setBackgroundColor:[UIColor clearColor]];
		
		UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(15, 5, headerView.frame.size.width-15, 30)];
		[lbl setBackgroundColor:[UIColor clearColor]];
		lbl.numberOfLines = 2;
		[lbl setFont:[UIFont fontWithName:@"Helvetica-Bold" size:12]];
		[lbl setTextColor:[UIColor whiteColor]];
		[headerView addSubview:lbl];
       
		
		UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(10, 35, headerView.frame.size.width-15, 1.5)];
		img.image = [UIImage imageNamed:@"beinspired_border.png"];
		[headerView addSubview:img];
		[img release];
		
		id value = [[self.BeInspire_Array objectAtIndex:section]valueForKey:@"title"];
		NSString *product_str = @"No name";
		if(value != [NSNull null])
			product_str = (NSString *)value;
		lbl.text = [NSString stringWithFormat:@"%@",product_str];
		[lbl release];
				
		return headerView;
	}
	
	if (tableView == exploreourproduct_tbl) 
	{
		UIView *headerView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 40)] autorelease];
		[headerView setBackgroundColor:[UIColor clearColor]];
		
		UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(15, 5, headerView.frame.size.width-15, 30)];
		[lbl setBackgroundColor:[UIColor clearColor]];
		lbl.numberOfLines = 2;
		[lbl setFont:[UIFont fontWithName:@"Helvetica-Bold" size:12]];
		[lbl setTextColor:[UIColor colorWithRed:132.0f/255.0 green:9.0f/255.0 blue:9.0f/255.0 alpha:1.0]];
		[headerView addSubview:lbl];
		
		UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(5, 32, headerView.frame.size.width-15, 2)];
		img.image = [UIImage imageNamed:@"tblLblSeperator.png"];
		[headerView addSubview:img];
		[img release];
	
		id value = [[self.subCat_lise_Array objectAtIndex:section]valueForKey:@"title"] ;
		NSString *product_str = @"No name";
		if(value != [NSNull null])
			product_str = (NSString *)value;
		lbl.text = [NSString stringWithFormat:@"%@",product_str];
		[lbl release];
		
		return headerView;
	}
	
	if (tableView == final_detail_row_tbl) {
		
		UIView *headerView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 40)] autorelease];
		[headerView setBackgroundColor:[UIColor clearColor]];
		
		UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(9, 0, headerView.frame.size.width-9, 30)];
		[lbl setBackgroundColor:[UIColor whiteColor]];
		lbl.numberOfLines = 2;
		[lbl setFont:[UIFont fontWithName:@"Helvetica-Bold" size:12]];
		[lbl setTextColor:[UIColor colorWithRed:132.0f/255.0 green:9.0f/255.0 blue:9.0f/255.0 alpha:1.0]];
		[headerView addSubview:lbl];
		
		if ([self.linesArray count]>0) {
		id value = [self.linesArray objectAtIndex:0];
		NSString *str = @"No name";
		if(value != [NSNull null] || value != nil)
			str = (NSString *)value;
			
			NSString *lbl_str = [self decodeHTMLEntities:[NSString stringWithFormat:@"%@",str]];
			
		lbl.text = [NSString stringWithFormat:@"%@",lbl_str];
		}else {
			lbl.text = @"";
		}
        [lbl release];
		return headerView;
	}
	
		return nil;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source.
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
 }   
 }
 */
//-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
//}

//- (void)tableView:(UITableView *)tableView 
//moveRowAtIndexPath:(NSIndexPath *)fromIndexPath 
//      toIndexPath:(NSIndexPath *)toIndexPath 
//{
//	
//}

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */


/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	
	//ProductDetail *obj_productdetail = [[ProductDetail alloc]init];
//	[self.navigationController pushViewController:obj_productdetail animated:YES];
	
	if (tableView == product_tbl) {
		back_btn.tag = 5;
		if ([back_btn_tag_Arr containsObject:[NSString stringWithFormat:@"%d",back_btn.tag]]) {
			[back_btn_tag_Arr removeObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
		}
		[back_btn_tag_Arr addObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
		
		[pathArray addObject:[[self.mainCat_Array objectAtIndex:indexPath.row]valueForKey:@"link_title"]];
		
		[self fatch_Sub_productCat:[[self.mainCat_Array objectAtIndex:indexPath.row]valueForKey:@"mlid"]];
		[self show_productdetail_data:0];
	}
	
	
	if (tableView == specdata_tbl) {
		back_btn.tag = 6;
		if ([back_btn_tag_Arr containsObject:[NSString stringWithFormat:@"%d",back_btn.tag]]) {
			[back_btn_tag_Arr removeObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
		}
		[back_btn_tag_Arr addObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
		
		NSString *temp_str = [[self.spec_data_Array objectAtIndex:indexPath.row] valueForKey:@"tid"];
		
		[self fatch_Spec_Data_detail:temp_str];
		//[self show_spec_data:indexPath.row];
		[self viewsubspecshow:0];
	}
	
	if (tableView == sub_detail_view) {
		back_btn.tag = 12;
		if ([back_btn_tag_Arr containsObject:[NSString stringWithFormat:@"%d",back_btn.tag]]) {
			[back_btn_tag_Arr removeObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
		}
		[back_btn_tag_Arr addObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
		
		[pathArray addObject:[[self.subCat_Array objectAtIndex:indexPath.row]valueForKey:@"sub_name"]];
		
		[self show_sub_Lvl3detail_data:0];
		[self fatch_Sub_productCat_listTbl:[[self.subCat_Array objectAtIndex:indexPath.row]valueForKey:@"sub_catid"]];
	
	}
	
	if (tableView == exploreourproduct_tbl) {
		
		//NSLog(@"%@",[[[[self.subCat_lise_Array objectAtIndex:indexPath.section]valueForKey:@"product"] objectAtIndex:cell.imageView1.tag] valueForKey:@"image"]);
		
		//[self show_productdetail_sub_data:0];
	}
	if (tableView == spec_sub_detail_tbl) {
		
		InternetAccessibility = [appObj_iphone checkInternet];
		if (InternetAccessibility == 0) 
		{
			[customealert showAlert:@"Network Connection Error" message:@"Please make sure you are connected to the internet." delegate:self];
		}else
		{
			back_btn.tag = 13;
			if ([back_btn_tag_Arr containsObject:[NSString stringWithFormat:@"%d",back_btn.tag]]) {
				[back_btn_tag_Arr removeObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
			}
			[back_btn_tag_Arr addObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
			
			NSString *tmp_str = [[self.spec_data_detail_Array objectAtIndex:indexPath.row] valueForKey:@"pid"];
			
			[self fatch_Spec_Data_final:tmp_str];
			[self show_spec_data:0];
		}
	}
	
	if (tableView == BeInspire_useproduct_tbl){
		InternetAccessibility = [appObj_iphone checkInternet];
		if (InternetAccessibility == 0) 
		{
			[customealert showAlert:@"Network Connection Error" message:@"Please make sure you are connected to the internet." delegate:self];
		}else
		{
			[pathArray addObject:[NSString stringWithFormat:@"%@",[[[[self.BeInspire_detail_lbl_array objectAtIndex:0] valueForKey:@"products_used"]objectAtIndex:indexPath.row]valueForKey:@"title"]]];
			NSString *strId = [[[[self.BeInspire_detail_lbl_array objectAtIndex:0] valueForKey:@"products_used"]objectAtIndex:indexPath.row]valueForKey:@"nid"];
			[self show_productdetail_continue:strId];
		}
		
	}
	
	
	if (tableView == product_Lvl3_tbl){
		
		InternetAccessibility = [appObj_iphone checkInternet];
		if (InternetAccessibility == 0) 
		{
			[customealert showAlert:@"Network Connection Error" message:@"Please make sure you are connected to the internet." delegate:self];
		}else
		{
		
			back_btn.tag = 15;
			if ([back_btn_tag_Arr containsObject:[NSString stringWithFormat:@"%d",back_btn.tag]]) {
				[back_btn_tag_Arr removeObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
			}
			[back_btn_tag_Arr addObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
			
			[self final_product_fatch_data:[[self.product_lvl3_Array objectAtIndex:indexPath.row]valueForKey:@"pid"]];
			[self show_sub_productdetail_data:0];
		
		}
	}
	
	
	if (tableView == first_search_list_tbl){
		InternetAccessibility = [appObj_iphone checkInternet];
		if (InternetAccessibility == 0) 
		{
			[customealert showAlert:@"Network Connection Error" message:@"Please make sure you are connected to the internet." delegate:self];
		}else
		{
			
			back_btn.tag = 14;
			if ([back_btn_tag_Arr containsObject:[NSString stringWithFormat:@"%d",back_btn.tag]]) {
				[back_btn_tag_Arr removeObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
			}
			[back_btn_tag_Arr addObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
			
			[search_parh_arr removeAllObjects];
			[searchtxt resignFirstResponder];
			
			[search_parh_arr addObject:[NSString stringWithFormat:@"%@",[[self.search_Array objectAtIndex:indexPath.row] valueForKey:@"title"]]];
			
			NSString *tmp_str = [[self.search_Array objectAtIndex:indexPath.row] valueForKey:@"title"];
			
			[self fatch_second_search_data:tmp_str];
			[self.view bringSubviewToFront:myPgressIndicator];
			[self show_search_tbl_view];
			
		}
	}
	
	if (tableView == start_search_tbl){
		
		[search_parh_arr addObject:[NSString stringWithFormat:@"%@",[[self.search_array_second objectAtIndex:indexPath.row] valueForKey:@"title"]]];
		
		NSString *tmp_str = [[self.search_array_second objectAtIndex:indexPath.row] valueForKey:@"pid"];
		
		[self show_productdetail_continue:tmp_str];
		
	}
	
	if (tableView == menu_tbl) {
		
		if (indexPath.row == 0) {
			[self menuBtn_productClicked:nil];
		}
		
		if (indexPath.row == 1) {
			[self menuBtn_inspiredClicked:nil];
		}
		
		if (indexPath.row == 2) {
			[self menuBtn_specdataClicked:nil];
		}
		
		if (indexPath.row == 3) {
			[self menuBtn_connectClicked:nil];
		}
		
		if (indexPath.row == 4) {
			[self menuBtn_BuyClicked:nil];
		}
		
		if (indexPath.row == 5) {
			[self menuBtn_websiteClicked:nil];
		}
		
		if (indexPath.row == 6) {
			[self menuBtn_loginClicked:nil];
		}
		
		if (indexPath.row == 7) {
			[self menuBtn_quitClicked:nil];
		}
	}
}

//====================================================================

#pragma mark show & hide specdata_tbl
-(void)show_spec_data:(int)product
{
	//[self loadScrollForViewSpecData:15];
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.0];
	specdata_sub_view.frame = CGRectMake(0, 39, 320, 396+5);
	[UIView commitAnimations];
}

-(void)close_specdata_view
{
	if([back_btn_tag_Arr count]!=0)
	[back_btn_tag_Arr removeLastObject];
	[self.view setUserInteractionEnabled:TRUE];
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.0];
	specdata_sub_view.frame = CGRectMake(320, 39, 320, 396+5);
	[UIView commitAnimations];
}

//====================================================================

#pragma mark show & hide ProductDetail
-(void)show_productdetail_data:(int)product
{
	//back_btn.tag = 12;
//	if ([back_btn_tag_Arr containsObject:[NSString stringWithFormat:@"%d",back_btn.tag]]) {
//		[back_btn_tag_Arr removeObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
//	}
//	[back_btn_tag_Arr addObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
	
	
	
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.0];
	product_detail.frame = CGRectMake(72, 63, product_detail.frame.size.width, product_detail.frame.size.height);
	[UIView commitAnimations];
}

-(void)close_productdetail_view
{
	[self.view setUserInteractionEnabled:TRUE];
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.0];
	product_detail.frame = CGRectMake(-309, 63,product_detail.frame.size.width, product_detail.frame.size.height);
	//product_detail.frame = CGRectMake(320, 44, 320, 396);
	[UIView commitAnimations];
	
}

//====================================================================


-(void)show_sub_productdetail_data:(int)product
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.0];
	product_sub_detail.frame = CGRectMake(0, 44, 320, 396);
	[UIView commitAnimations];
}


-(void)hide_sub_productdetail_data
{
	if([back_btn_tag_Arr count]!=0)
	[back_btn_tag_Arr removeLastObject];
	[self.view setUserInteractionEnabled:TRUE];
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.0];
	product_sub_detail.frame = CGRectMake(320, 44, 320, 396);
	[UIView commitAnimations];
	
}



//====================================================================


-(void)show_sub_Lvl3detail_data:(int)product
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.0];
	product_Lvl3_view.frame = CGRectMake(72, 63, product_Lvl3_view.frame.size.width, product_Lvl3_view.frame.size.height);
	[UIView commitAnimations];
}


-(void)hide_sub_Ll3detail_data
{
	
	[self.view setUserInteractionEnabled:TRUE];
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.0];
	product_Lvl3_view.frame = CGRectMake(-309, 63,product_Lvl3_view.frame.size.width, product_Lvl3_view.frame.size.height);
	[UIView commitAnimations];
	
}

//====================================================================

#pragma mark show & hide Sub ProductDetail
-(void)show_productdetail_sub_data:(id)product
{	
	
	UIButton *btn = (UIButton*)product;
	NSLog(@"%d",btn.tag);
	NSString *str = [NSString stringWithFormat:@"%d",btn.tag];
	
	InternetAccessibility = [appObj_iphone checkInternet];
	if (InternetAccessibility == 0) 
	{
		[customealert showAlert:@"Network Connection Error" message:@"Please make sure you are connected to the internet." delegate:self];
	}else
	{
		
		[pathArray addObject:[NSString stringWithFormat:@"%@",btn.titleLabel.text]];
		
		NSString* myString = @"";
		for(NSString *str in pathArray)
		{
			myString = [myString stringByAppendingFormat:@"%@ > ",str];
		}
		
		pathLbl.text = [NSString stringWithFormat:@"%@",[myString substringToIndex:[myString length]-2]];
		
		[self show_productdetail_continue:str];
	
	}
}

-(void)show_productdetail_continue:(NSString*)strId
{
	
	InternetAccessibility = [appObj_iphone checkInternet];
	if (InternetAccessibility == 0) 
	{
		[customealert showAlert:@"Network Connection Error" message:@"Please make sure you are connected to the internet." delegate:self];
	}else
	{
		
		NSString* myString = @"";
		
		if(search_flag == TRUE)
		{
			for(NSString *str in search_parh_arr)
			{
				myString = [myString stringByAppendingFormat:@"%@ > ",str];
			}
		}
		else {
			for(NSString *str in pathArray)
			{
				myString = [myString stringByAppendingFormat:@"%@ > ",str];
			}
		}
		pathLbl.text = [NSString stringWithFormat:@"%@",[myString substringToIndex:[myString length]-2]];
		
		pdf1_btn.hidden = TRUE;
		pdf2_btn.hidden = TRUE;
		word_btn.hidden = TRUE;
		
		back_btn.tag = 10;
		if ([back_btn_tag_Arr containsObject:[NSString stringWithFormat:@"%d",back_btn.tag]]) {
			[back_btn_tag_Arr removeObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
		}
		[back_btn_tag_Arr addObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
		
		[self fatch_product_final:strId];
		
		[self.view bringSubviewToFront:productdetail_sub_view];
		
		[self.view bringSubviewToFront:myPgressIndicator];

		productdetail_sub_view.frame = CGRectMake(320, 44, 320, 396);
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:1.0];
		productdetail_sub_view.frame = CGRectMake(0, 44, 320, 396);
		[UIView commitAnimations];
		
	}
	
}


-(void)close_productdetail_sub_view
{
	if([back_btn_tag_Arr count]!=0)
	[back_btn_tag_Arr removeLastObject];
	[self.view setUserInteractionEnabled:TRUE];
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.0];
	productdetail_sub_view.frame = CGRectMake(320, 44, 320, 396);
	[UIView commitAnimations];
	
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
	
//	if(interfaceOrientation==UIInterfaceOrientationLandscapeLeft || interfaceOrientation==UIInterfaceOrientationLandscapeRight)
//    {
//		return NO;
//	}else {
//		return YES;
//	}
//	return NO;
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark Send Mail
-(IBAction)email:(id)sender
{
	
	if ([MFMailComposeViewController canSendMail]) {
		isMail = FALSE;
		MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
		NSArray *toRecipients = [NSArray arrayWithObject:@"sales@waclighting.com"];
		[mail setToRecipients:toRecipients];
		[mail setMailComposeDelegate:self];
		[self presentModalViewController:mail animated:YES];
	}
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
	isMail = TRUE;
	[self dismissModalViewControllerAnimated:YES];
	
}


#pragma mark Make CALL

-(IBAction)call:(id)sender
{
	isMail = FALSE;
	
	ABRecordRef newPerson = ABPersonCreate();
	CFErrorRef error = NULL;
	ABRecordSetValue(newPerson, kABPersonFirstNameProperty, CFSTR("WAC Lighting"), &error);
	ABRecordSetValue(newPerson, kABPersonOrganizationProperty, CFSTR("WAC Lighting"), &error);
	
	NSAssert( !error, @"Something bad happened here." );
	
	ABMutableMultiValueRef multiPhone = ABMultiValueCreateMutable(kABMultiStringPropertyType);
	ABMultiValueAddValueAndLabel(multiPhone, @"8005262588", kABHomeLabel, NULL);
	ABRecordSetValue(newPerson, kABPersonPhoneProperty, multiPhone,nil);
    CFRelease(multiPhone);
	
	ABMutableMultiValueRef multiEmail = ABMultiValueCreateMutable(kABMultiStringPropertyType);
	ABMultiValueAddValueAndLabel(multiEmail, @"sales@waclighting.com", kABHomeLabel, NULL);
    ABRecordSetValue(newPerson, kABPersonEmailProperty, multiEmail, &error);
    CFRelease(multiEmail);
	
	ABMutableMultiValueRef multiHomePage = ABMultiValueCreateMutable(kABMultiStringPropertyType);
	ABMultiValueAddValueAndLabel(multiHomePage, @"www.waclighting.com", kABPersonHomePageLabel, NULL);
    ABRecordSetValue(newPerson, kABPersonURLProperty, multiHomePage, &error);
    CFRelease(multiHomePage);
	
	ABMutableMultiValueRef mutableStreetAddressProperty = ABMultiValueCreateMutable(kABMultiStringPropertyType);
	NSMutableDictionary *theAddress = [[NSMutableDictionary alloc] init];
	[theAddress setValue:@"615 South Street" forKey:(NSString*)kABPersonAddressStreetKey];
	[theAddress setValue:@"Garden City" forKey:(NSString*)kABPersonAddressCityKey];
	[theAddress setValue:@"" forKey:(NSString*)kABPersonAddressStateKey];
	[theAddress setValue:@"NY 11530" forKey:(NSString*)kABPersonAddressZIPKey];
	[theAddress setValue:@"New York" forKey:(NSString*)kABPersonAddressCountryKey];
	ABMultiValueAddValueAndLabel(mutableStreetAddressProperty, theAddress, kABHomeLabel, NULL);
	ABRecordSetValue(newPerson, kABPersonAddressProperty,mutableStreetAddressProperty,NULL);
	CFRelease(mutableStreetAddressProperty);
	
	ABNewPersonViewController *picker = [[ABNewPersonViewController alloc] init];
    picker.newPersonViewDelegate = self;
	
	[picker setDisplayedPerson:newPerson];
    
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:picker];
    [self presentModalViewController:navigation animated:YES];
    
    [picker release];
    [navigation release];
}

#pragma mark ABNewPersonViewControllerDelegate methods
// Dismisses the new-person view controller. 
- (void)newPersonViewController:(ABNewPersonViewController *)newPersonViewController didCompleteWithNewPerson:(ABRecordRef)person
{
	isMail = TRUE;
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark Menu screen

-(IBAction)menuBtn_productClicked:(id)sender
{
	//[self.view sendSubviewToBack:menu_view];
	UIButton *btn = [[UIButton alloc]init];
	btn.tag = 1;
	
	product_btn_big.tag = 1010;
	
	[self performSelector:@selector(close_menu_view) withObject:nil afterDelay:0.0];
	[self performSelector:@selector(setLayout_aftermenuClicked) withObject:nil afterDelay:0.0];
	//[self performSelector:@selector(selectView_afterMenuClicked:) withObject:btn afterDelay:0.0];
	[self performSelector:@selector(SelectView_clicked:) withObject:btn afterDelay:0.0];
	
	[btn release];
}

-(IBAction)menuBtn_inspiredClicked:(id)sender
{
	UIButton *btn = [[UIButton alloc]init];
	btn.tag = 2;
	
	inspired_btn_big.tag = 2020;
	
	InternetAccessibility = [appObj_iphone checkInternet];
	if (InternetAccessibility == 0) 
	{
		[customealert showAlert:@"Network Connection Error" message:@"Please make sure you are connected to the internet." delegate:self];
	}else
	{
		[self performSelector:@selector(close_menu_view) withObject:nil afterDelay:0.0];
		[self performSelector:@selector(setLayout_aftermenuClicked) withObject:nil afterDelay:0.0];
		//[self performSelector:@selector(selectView_afterMenuClicked:) withObject:btn afterDelay:0.0];
		[self performSelector:@selector(SelectView_clicked:) withObject:btn afterDelay:0.0];
	}
	
	[btn release];
}

-(IBAction)menuBtn_connectClicked:(id)sender
{
	UIButton *btn = [[UIButton alloc]init];
	btn.tag = 3;
	
	connect_btn_big.tag = 3030;
	
	[self performSelector:@selector(close_menu_view) withObject:nil afterDelay:0.0];
	[self performSelector:@selector(setLayout_aftermenuClicked) withObject:nil afterDelay:0.0];
	//[self performSelector:@selector(selectView_afterMenuClicked:) withObject:btn afterDelay:0.0];
	[self performSelector:@selector(SelectView_clicked:) withObject:btn afterDelay:0.0];
	
	[btn release];
}

-(IBAction)menuBtn_specdataClicked:(id)sender
{
	UIButton *btn = [[UIButton alloc]init];
	btn.tag = 4;
	
	specdata_btn_big.tag = 4040;
	
	[self performSelector:@selector(close_menu_view) withObject:nil afterDelay:0.0];
	[self performSelector:@selector(setLayout_aftermenuClicked) withObject:nil afterDelay:0.0];
	//[self performSelector:@selector(selectView_afterMenuClicked:) withObject:btn afterDelay:0.0];
	[self performSelector:@selector(SelectView_clicked:) withObject:btn afterDelay:0.0];
	
	[btn release];
}

-(IBAction)menuBtn_loginClicked:(id)sender
{
	InternetAccessibility = [appObj_iphone checkInternet];
	if (InternetAccessibility == 0) 
	{
		[customealert showAlert:@"Network Connection Error" message:@"Please make sure you are connected to the internet." delegate:self];
	}else
	{
		
		//[self close_menu_view];
		[mail_Web_btn setEnabled:FALSE];
		NSString *video_str = @"https://reportsystem.waclighting.com/";
		[self show_web_view:video_str];
	}
}

-(IBAction)menuBtn_BuyClicked:(id)sender
{
	InternetAccessibility = [appObj_iphone checkInternet];
	if (InternetAccessibility == 0) 
	{
		[customealert showAlert:@"Network Connection Error" message:@"Please make sure you are connected to the internet." delegate:self];
	}else
	{
		//[self close_menu_view];
		[mail_Web_btn setEnabled:FALSE];
		NSString *video_str = @"http://launch.waclighting.com/locator";
		[self show_web_view:video_str];
	}
}

-(IBAction)menuBtn_websiteClicked:(id)sender
{
	InternetAccessibility = [appObj_iphone checkInternet];
	if (InternetAccessibility == 0) 
	{
		[customealert showAlert:@"Network Connection Error" message:@"Please make sure you are connected to the internet." delegate:self];
	}else
	{
		[mail_Web_btn setEnabled:FALSE];
		NSString *video_str = @"http://www.waclighting.com";
		[self show_web_view:video_str];
	}
	//[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.waclighting.com"]];
	
}

-(IBAction)menuBtn_quitClicked:(id)sender
{
	
	exit(0);
}


-(void)setLayout_aftermenuClicked
{
	//[back_btn_tag_Arr removeAllObjects];
//	
//	back_btn.hidden = TRUE;
//	
//	
//	headerImage.image = [UIImage imageNamed:@"header_logo.png"];
//	
//	product_btn_big.userInteractionEnabled = TRUE;
//	inspired_btn_big.userInteractionEnabled = TRUE;
//	specdata_btn_big.userInteractionEnabled = TRUE;
//	connect_btn_big.userInteractionEnabled = TRUE;
//	
//	btn1_view1.selected = FALSE;
//	btn2_view2.selected = FALSE;
//	btn3_view3.selected = FALSE;
//	btn4_view4.selected = FALSE;
//	
//	beinspired_detail_view.frame = CGRectMake(320, 44, 320, 396);
	
	[self viewWillAppear:NO];
	logoView.frame = CGRectMake(0, -100, logoView.frame.size.width, logoView.frame.size.height);
	add_scroll_view.frame = CGRectMake(0, 480, add_scroll_view.frame.size.width, add_scroll_view.frame.size.height);
	
	my1View.frame = CGRectMake(0, 538, my1View.frame.size.width, my1View.frame.size.height);
	my2View.frame = CGRectMake(80, 538, my2View.frame.size.width, my2View.frame.size.height);
	my4View.frame = CGRectMake(160, 538, my4View.frame.size.width, my4View.frame.size.height);
	my3View.frame = CGRectMake(240, 538, my3View.frame.size.width, my3View.frame.size.height);
	
	//logoView.frame = CGRectMake( 0, 460, logoView.frame.size.width, logoView.frame.size.height);
//	my1View.frame = CGRectMake( 0, 460, my1View.frame.size.width, my1View.frame.size.height);
//	my2View.frame = CGRectMake( 80, 460, my2View.frame.size.width, my2View.frame.size.height);
//	my4View.frame = CGRectMake( 160, 460, my4View.frame.size.width, my4View.frame.size.height);
//	my3View.frame = CGRectMake( 240, 460, my3View.frame.size.width, my3View.frame.size.height);
//	//add_scroll.frame = CGRectMake(0, 460, add_scroll.frame.size.width, add_scroll.frame.size.height);
//	[self.view setUserInteractionEnabled:TRUE];
//	btn1_view1.selected = NO;
//	btn2_view2.selected = NO;
//	btn3_view3.selected = NO;
//	btn4_view4.selected = NO;
//	product_btn_big.userInteractionEnabled = TRUE;
//	inspired_btn_big.userInteractionEnabled = TRUE;
//	specdata_btn_big.userInteractionEnabled = TRUE;
//	connect_btn_big.userInteractionEnabled = TRUE;
//	productView_my1View.frame = CGRectMake(-309, 63, productView_my1View.frame.size.width, productView_my1View.frame.size.height);
//	inspiredView_my2View.frame = CGRectMake(-309, 63, inspiredView_my2View.frame.size.width, inspiredView_my2View.frame.size.height);
//	connectView_my3View.frame = CGRectMake(-309, 63, connectView_my3View.frame.size.width, connectView_my3View.frame.size.height);
//	specdataView_my4View.frame = CGRectMake(-309, 63, specdataView_my4View.frame.size.width, specdataView_my4View.frame.size.height);
//	
//	web_view.frame = CGRectMake(320, 44, 320, 416);
//	
//	productdetail_sub_view.frame = CGRectMake(320, 44, productdetail_sub_view.frame.size.width, productdetail_sub_view.frame.size.height);
//	
//	specdata_sub_view.frame = CGRectMake(320, 44, 320, 396);
//	product_detail.frame = CGRectMake(320, 44, 320, 396);
//	beinspired_detail_view.frame = CGRectMake(320, 44, 320, 396);
//	image_detail.frame=CGRectMake(320,44,image_detail.frame.size.width,image_detail.frame.size.height);
//	
//	search_view.frame = CGRectMake(0, 460, 320, 416);
//	
//	menu_view.frame = CGRectMake(0, 460, 320, 416);
	
}

//-(void)selectView_afterMenuClicked:(id)sender
//{
//	[self.view setUserInteractionEnabled:FALSE];
//	UIButton *btn = (UIButton*)sender;
//	//[timer invalidate];
//	back_btn.hidden = FALSE;
//	
//	
//	
//	if (btn.tag == 1) {
//		product_btn_big.userInteractionEnabled = FALSE;
//		btn1_view1.selected = YES;
//		
//		back_btn.tag = 1;
//		if ([back_btn_tag_Arr containsObject:[NSString stringWithFormat:@"%d",back_btn.tag]]) {
//			[back_btn_tag_Arr removeObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
//		}
//		[back_btn_tag_Arr addObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
//		
//		
//		[self performSelector:@selector(view1animationSetPosition:) withObject:nil afterDelay:0.8];
//		[self performSelector:@selector(view1animationShowProduct:) withObject:nil afterDelay:1.8];
//	}
//	
//	if (btn.tag == 2) {
//		inspired_btn_big.userInteractionEnabled = FALSE;
//		btn2_view2.selected = YES;
//		
//		back_btn.tag = 2;
//		if ([back_btn_tag_Arr containsObject:[NSString stringWithFormat:@"%d",back_btn.tag]]) {
//			[back_btn_tag_Arr removeObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
//		}
//		[back_btn_tag_Arr addObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
//		
//		
//		[self performSelector:@selector(view2animationSetPosition:) withObject:nil afterDelay:0.8];
//		[self performSelector:@selector(view2animationShowInspired:) withObject:nil afterDelay:1.8];
//	}
//	
//	if (btn.tag == 3) {
//		connect_btn_big.userInteractionEnabled = FALSE;
//		btn3_view3.selected = YES;
//		
//		back_btn.tag = 3;
//		if ([back_btn_tag_Arr containsObject:[NSString stringWithFormat:@"%d",back_btn.tag]]) {
//			[back_btn_tag_Arr removeObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
//		}
//		[back_btn_tag_Arr addObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
//		
//		
//		[self performSelector:@selector(view3animationSetPosition:) withObject:nil afterDelay:0.8];
//		[self performSelector:@selector(view3animationShowConnect:) withObject:nil afterDelay:1.8];
//	}
//	
//	if (btn.tag == 4) {
//		specdata_btn_big.userInteractionEnabled = FALSE;
//		btn4_view4.selected = YES;
//		
//		back_btn.tag = 4;
//		if ([back_btn_tag_Arr containsObject:[NSString stringWithFormat:@"%d",back_btn.tag]]) {
//			[back_btn_tag_Arr removeObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
//		}
//		[back_btn_tag_Arr addObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
//		
//		
//		[self performSelector:@selector(view4animationSetPosition:) withObject:nil afterDelay:0.8];
//		[self performSelector:@selector(view4animationShowConnect:) withObject:nil afterDelay:1.8];
//	}
//	
//	
//	
//}





#pragma mark -
#pragma mark WebServices
//=====================================================================
//WebServices


//get main product category
-(void)fatch_productCat:(id)sender
{
	
	self.mainCat_Array = nil;
	[product_tbl reloadData];
	
	//NSString *urlString = @"http://openxcellaus.info/waclighting/category_list.php";
//    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
//	JSONParser *parser;
//    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(productCat:) andHandler:self];
    
	
	NSString *path = [[NSBundle mainBundle]pathForResource:@"productlevel1" ofType:@"xml"];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL fileURLWithPath:path]];
	JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(productCat:) andHandler:self];
}

-(void)productCat:(NSDictionary*)dictionary{
	
    NSLog(@"%@",dictionary);
	
	
	NSMutableArray *temp_mainCat_Array = [[NSMutableArray alloc]init];
    
    temp_mainCat_Array = [[dictionary valueForKey:@"main_category"]copy];
	
	self.mainCat_Array = [temp_mainCat_Array copy];
	
	temp_mainCat_Array = nil;
	[temp_mainCat_Array release];
	
	if (self.mainCat_Array.count == 0){
		[customealert showAlert:@"Alert" message:@"No data found." delegate:self];
	}
	
    [product_tbl reloadData];
}

//=======================================================================
//get sub product gallary

-(void)fatch_Sub_productCat:(NSString*)senderId
{
	
	self.subCat_Array = nil;
	[sub_detail_view reloadData];
	
	productlvl1Id = senderId;
	
	
	//NSString *urlString = [NSString stringWithFormat:@"http://openxcellaus.info/waclighting/sub_category_list.php?catid=%@",senderId];
//    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
//	JSONParser *parser;
//    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(SubproductCat:) andHandler:self];
    
	NSString *path = [[NSBundle mainBundle]pathForResource:@"productlevel2" ofType:@"xml"];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL fileURLWithPath:path]];
	JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(SubproductCat:) andHandler:self];

	
}

-(void)SubproductCat:(NSDictionary*)dictionary{
	
    NSLog(@"%@",dictionary);
	
	
	NSMutableArray *temp_subCat_Array = [[NSMutableArray alloc]init];
    temp_subCat_Array = [[dictionary valueForKey:@"main_category"] copy];
	
	NSMutableArray *subCat_Array_temp = [[NSMutableArray alloc]init];
	subCat_Array_temp = [temp_subCat_Array copy];
	[temp_subCat_Array release];
	
	for (int i = 0 ; i < [subCat_Array_temp count]; i++) {
		NSString *idStr = [[subCat_Array_temp objectAtIndex:i] valueForKey:@"mlid"];
		if ([idStr isEqualToString:productlvl1Id]) {
			self.subCat_Array  = [[subCat_Array_temp objectAtIndex:i]valueForKey:@"sub_category"];
		}
	}
	[subCat_Array_temp release];
	
	NSLog(@"%@",self.subCat_Array);
	
	if (self.subCat_Array.count == 0){
		[customealert showAlert:@"Alert" message:@"No data found." delegate:self];
	}
	
    [sub_detail_view reloadData];
}


//=======================================================================
//get sub product gallery detail tbl



-(void)fatch_Sub_productCat_listTbl:(NSString*)senderId
{
	
	productlvl2Id = senderId;
	
	self.product_lvl3_Array = nil;
	[product_Lvl3_tbl reloadData];
	
	NSString* myString = @"";
	for(NSString *str in pathArray)
	{
		myString = [myString stringByAppendingFormat:@"%@ > ",str];
	}
	
	pathLbl_gallary.text = [NSString stringWithFormat:@"%@",[myString substringToIndex:[myString length]-2]];
	
	NSString *path = [[NSBundle mainBundle]pathForResource:@"productlevel3" ofType:@"xml"];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL fileURLWithPath:path]];
	JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(SubproductCat_listTbl:) andHandler:self];
	
}

-(void)SubproductCat_listTbl:(NSDictionary*)dictionary{
	
	NSLog(@"%@",dictionary);
	
	[myPgressIndicator stopAnimating];
	//isLoded = TRUE;
	
	NSMutableArray *temp_subCat_Array = [[NSMutableArray alloc]init];
    temp_subCat_Array = [[dictionary valueForKey:@"product_list"] copy];
	
	NSMutableArray *subCat_Array_temp = [[NSMutableArray alloc]init];
	subCat_Array_temp = [temp_subCat_Array copy];
	[temp_subCat_Array release];
	
	for (int i = 0 ; i < [subCat_Array_temp count]; i++) {
		NSString *idStr = [[subCat_Array_temp objectAtIndex:i] valueForKey:@"sub_catid"];
		if ([idStr isEqualToString:productlvl2Id]) {
			self.product_lvl3_Array  = [[subCat_Array_temp objectAtIndex:i]valueForKey:@"product"];
		}
	}
	[subCat_Array_temp release];
	
	NSLog(@"%@",self.product_lvl3_Array);
	
	[product_Lvl3_tbl reloadData];
	
	if (self.product_lvl3_Array.count == 0){
		[customealert showAlert:@"Alert" message:@"No data found." delegate:self];
	}
	
}

//========================================================================


-(void)final_product_fatch_data:(NSString *)strId
{
	
	self.subCat_lise_Array = nil;
	[exploreourproduct_tbl reloadData];
	
	NSString *urlString = [NSString stringWithFormat:@"http://openxcellaus.info/waclighting/product_list.php?sub_catid=%@",strId];
	urlString = [urlString stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
	NSLog(@"%@",urlString);
	    
		
	Web_req =[[ASIHttpParser alloc] initWithRequestWithURL:urlString selSuccess:@selector(final_product_data:) selError:@selector(OnError) andHandler:self];
	//isLoded = FALSE;
	
	[myPgressIndicator startAnimating];
	
}


-(void)final_product_data:(NSDictionary*)dictionary
{
	//isLoded = TRUE;
	Web_req = nil;
	[Web_req release];
	
	[myPgressIndicator stopAnimating];
	
	NSMutableArray *temp_subCat_list_Array = [[NSMutableArray alloc]init];
	    
	temp_subCat_list_Array = [[dictionary valueForKey:@"products"] copy];
		
	self.subCat_lise_Array = [temp_subCat_list_Array copy];
	[temp_subCat_list_Array release];
	
	if (self.subCat_lise_Array.count == 0){
		[customealert showAlert:@"Alert" message:@"No data found." delegate:self];
	}
	
	[exploreourproduct_tbl reloadData];
	
}

//=====================================================================
//get product detail Data

//-(void)fatch_product_detail:(int)senderId
//{
//	[self showHUD];	
//	
//	//EGOCache *clearCatch = [[EGOCache alloc]init];
//	//	[clearCatch clearCache];
//	self.Product_Detail_Array = nil;
//	
//	
//	NSString *urlString = [NSString stringWithFormat:@"http://openxcellaus.info/waclighting/product_details.php?pid=959"];
//	NSLog(@"%@",urlString);
//    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
//	JSONParser *parser;
//    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(product_detail:) andHandler:self];
//    
//}
//
//-(void)product_detail:(NSDictionary*)dictionary{
//	NSLog(@"%@",dictionary);
//    
//    [self hideHUD];
//	
//	NSMutableArray *temp_detail_Array = [[NSMutableArray alloc]init];
//    
//    temp_detail_Array = [[dictionary valueForKey:@"products"] copy];
//	
//	self.Product_Detail_Array = [temp_detail_Array copy];
//	[temp_detail_Array release];
//	
//	
//	
//	if (self.Product_Detail_Array.count == 0){
//		[customealert showAlert:@"Alert" message:@"No data found." delegate:self];
//	}
//	
//	//NSLog(@"%@",self.subCat_lise_Array);
//	
//	
//}



//=====================================================================
//get Be-Inspire Data

-(void)fatch_BeInspireData:(NSString*)senderId
{
	
	self.BeInspire_Array = nil;
	[BeInspire_Tbl reloadData];
	
	NSString *urlString = [NSString stringWithFormat:@"http://openxcellaus.info/waclighting/be_inspired.php"];
	
	urlString = [urlString stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
	
	NSLog(@"%@",urlString);
	
	Web_req =[[ASIHttpParser alloc] initWithRequestWithURL:urlString selSuccess:@selector(BeInspireData_listTbl:) selError:@selector(OnError) andHandler:self];
	//isLoded =FALSE;
    [myPgressIndicator startAnimating];
	
	
    //NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
//	JSONParser *parser;
//    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(BeInspireData_listTbl:) andHandler:self];
//	
	
}

-(void)BeInspireData_listTbl:(NSDictionary*)dictionary{
	//beinspired_detail_view
	Web_req = nil;
	[Web_req release];
	[myPgressIndicator stopAnimating];
	//isLoded = TRUE;
	
	NSLog(@"%@",dictionary);	
	NSMutableArray *temp_BeInspire_Array = [[NSMutableArray alloc]init];
    temp_BeInspire_Array = [[dictionary valueForKey:@"projects"] copy];
	self.BeInspire_Array = [temp_BeInspire_Array copy];
	[temp_BeInspire_Array release];
	
	if (self.BeInspire_Array.count == 0){
		[customealert showAlert:@"Alert" message:@"No data found." delegate:self];
	}
	[BeInspire_Tbl reloadData];
			
		
}

//=====================================================================
//get Spec_Data

-(void)fatch_Spec_Data:(NSString*)senderId
{
	self.spec_data_Array = nil;
	[specdata_tbl reloadData];
		
	//NSString *urlString = [NSString stringWithFormat:@"http://openxcellaus.info/waclighting/spec_data_category.php"];
//	NSLog(@"%@",urlString);
//	
//	Web_req =[[ASIHttpParser alloc] initWithRequestWithURL:urlString selSuccess:@selector(Spec_Data:) selError:@selector(OnError) andHandler:self];
//	isLoded =FALSE;
//    [myPgressIndicator startAnimating];
	
	NSString *path = [[NSBundle mainBundle]pathForResource:@"Speclevel1" ofType:@"xml"];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL fileURLWithPath:path]];
	JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(Spec_Data:) andHandler:self];
	
	
    //NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
//	JSONParser *parser;
//    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(Spec_Data:) andHandler:self];
	
	
}

-(void)Spec_Data:(NSDictionary*)dictionary{
	//beinspired_detail_view
	NSLog(@"%@",dictionary);	
	[myPgressIndicator stopAnimating];
	//isLoded = TRUE;
	
	NSMutableArray *temp_Spec_Data_Array = [[NSMutableArray alloc]init];
    temp_Spec_Data_Array = [[dictionary valueForKey:@"category"] copy];
	self.spec_data_Array = [temp_Spec_Data_Array copy];
	[temp_Spec_Data_Array release];
	
	if (self.spec_data_Array.count == 0){
		[customealert showAlert:@"Alert" message:@"No data found." delegate:self];
	}
	[specdata_tbl reloadData];
	
	
}


//=====================================================================
//get Spec_Data_detail

-(void)fatch_Spec_Data_detail:(NSString*)senderId
{
	
	self.spec_data_detail_Array = nil;
	[spec_sub_detail_tbl reloadData];
	
	speclvl1Id = senderId;
	
	//NSString *urlString = [NSString stringWithFormat:@"http://openxcellaus.info/waclighting/spec_data_by_pid_middle.php?pid=%@",senderId];
//	NSLog(@"%@",urlString);
	
	//Web_req =[[ASIHttpParser alloc] initWithRequestWithURL:urlString selSuccess:@selector(Spec_Data_detail:) selError:@selector(OnError) andHandler:self];
//	isLoded =FALSE;
//    [myPgressIndicator startAnimating];
    
	NSString *path = [[NSBundle mainBundle]pathForResource:@"Speclevel2" ofType:@"xml"];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL fileURLWithPath:path]];
	JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(Spec_Data_detail:) andHandler:self];
	
	
	
	
	//NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
//	JSONParser *parser;
//    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(Spec_Data_detail:) andHandler:self];
	
	
}

-(void)Spec_Data_detail:(NSDictionary*)dictionary{
	//beinspired_detail_view
	NSLog(@"%@",dictionary);	
	[myPgressIndicator stopAnimating];
	//isLoded = TRUE;
	
	
	NSMutableArray *temp_Spec_Data__detail_Array = [[NSMutableArray alloc]init];
    temp_Spec_Data__detail_Array = [[dictionary valueForKey:@"product_list"]copy];
	
	NSMutableArray *subSpec_Array_temp = [[NSMutableArray alloc]init];
	subSpec_Array_temp = [temp_Spec_Data__detail_Array copy];
	[temp_Spec_Data__detail_Array release];
	

	for (int i = 0 ; i < [subSpec_Array_temp count]; i++) {
		NSString *idStr = [[subSpec_Array_temp objectAtIndex:i] valueForKey:@"tid"];
		if ([idStr isEqualToString:speclvl1Id]) {
			self.spec_data_detail_Array  = [[subSpec_Array_temp objectAtIndex:i]valueForKey:@"product"];
		}
	}
	
	[subSpec_Array_temp release];
	
	if (self.spec_data_detail_Array.count == 0){
		[customealert showAlert:@"Alert" message:@"No data found." delegate:self];
	}
	
		
	
	[spec_sub_detail_tbl reloadData];
}


//=====================================================================
//get Spec_Data_final

-(void)fatch_Spec_Data_final:(NSString*)senderId
{
	
	self.spec_data_final_Array = nil;
	[self loadScrollView:0];
	
	NSString *urlString = [NSString stringWithFormat:@"http://openxcellaus.info/waclighting/spec_data_by_pid.php?pid=%@",senderId];
	
	urlString = [urlString stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
	
	NSLog(@"%@",urlString);
    
	Web_req =[[ASIHttpParser alloc] initWithRequestWithURL:urlString selSuccess:@selector(Spec_Data_final:) selError:@selector(OnError) andHandler:self];
	//isLoded =FALSE;
    [myPgressIndicator startAnimating];
	
	
	
	//NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
//	JSONParser *parser;
//    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(Spec_Data_final:) andHandler:self];
	
	
}

-(void)Spec_Data_final:(NSDictionary*)dictionary{
	//beinspired_detail_view
	Web_req = nil;
	[Web_req release];
	
	NSLog(@"%@",dictionary);	
	[myPgressIndicator stopAnimating];
	//isLoded = TRUE;
	
	NSMutableArray *temp_Spec_Data__detail_Array = [[NSMutableArray alloc]init];
    temp_Spec_Data__detail_Array = [[[[dictionary valueForKey:@"product_list"] objectAtIndex:0]valueForKey:@"product"]copy];
	self.spec_data_final_Array = [temp_Spec_Data__detail_Array copy];
	[temp_Spec_Data__detail_Array release];
	
	if (self.spec_data_final_Array.count == 0){
		[customealert showAlert:@"Alert" message:@"No data found." delegate:self];
	}
	[self loadScrollView:self.spec_data_final_Array];
	//[specdata_sub_tbl reloadData];
}

//=======================================================================
//get final product detail



-(void)fatch_product_final:(NSString*)senderId
{
	
	
	//EGOCache *clearCatch = [[EGOCache alloc]init];
	//	[clearCatch clearCache];
	self.product_final_Array = nil;
	self.linesArray = nil;
	[final_detail_tbl reloadData];
	[final_detail_row_tbl reloadData];
	clickTozoomLbl.hidden = TRUE;
	
	
	NSString *urlString = [NSString stringWithFormat:@"http://openxcellaus.info/waclighting/product_details.php?pid=%@",senderId];
	
	urlString = [urlString stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
	
	NSLog(@"%@",urlString);
    
	Web_req =[[ASIHttpParser alloc] initWithRequestWithURL:urlString selSuccess:@selector(product_finad:) selError:@selector(OnError) andHandler:self];
	//isLoded =FALSE;
    [myPgressIndicator startAnimating];
	
	
	
	//NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
//	JSONParser *parser;
//    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(product_finad:) andHandler:self];
    
}

-(void)product_finad:(NSDictionary*)dictionary{
	
	Web_req = nil;
	[Web_req release];
    
    [myPgressIndicator stopAnimating];
	//isLoded = TRUE;
	
	
	clickTozoomLbl.hidden = FALSE;
	NSMutableArray *temp_Array = [[NSMutableArray alloc]init];
    
    temp_Array = [[dictionary valueForKey:@"product"] copy];
	
	self.product_final_Array = [temp_Array copy];
	[temp_Array release];
	
	NSLog(@"%@",product_final_Array);
	
	NSString *str1 = [NSString stringWithFormat:@"%@",[self.product_final_Array valueForKey:@"body"]];
	str1 = [str1 stringByReplacingOccurrencesOfString:@"(html)" withString:@"\n"];
	str1 = [str1 stringByReplacingOccurrencesOfString:@"&bull;" withString:@"\n&bull;"];
	NSArray *arr = [str1 componentsSeparatedByString:@"\n"];
	//self.linesArray=(NSMutableArray*)arr;
	
	NSMutableArray *temp_arr = [[NSMutableArray alloc]init];
	for (int i = 0; i < [arr count]; i++) {
		if (![[arr objectAtIndex:i] isEqualToString:@""]) {
			[temp_arr addObject:[arr objectAtIndex:i]];
		}
	}
	self.linesArray=[temp_arr copy];
	[temp_arr release];
	
	[final_detail_tbl reloadData];
	[final_detail_row_tbl reloadData];
	
	if (self.product_final_Array.count == 0){
		[customealert showAlert:@"Alert" message:@"No data found." delegate:self];
	}
	

	
	id value1 = [self.product_final_Array valueForKey:@"spec_pdfpath"];
	NSString *str11 = @"";
	if(value1 != [NSNull null])
		str11 = (NSString *)value1;
	
	
	id value2 = [self.product_final_Array valueForKey:@"inst_pdfpath"];
	NSString *str2 = @"";
	if(value2 != [NSNull null])
		str2 = (NSString *)value2;
	
	id value3 = [self.product_final_Array valueForKey:@"ies"];
	NSString *str3 = @"";
	if(value3 != [NSNull null])
		str3 = (NSString *)value3;
	
	
	id value4 = [self.product_final_Array valueForKey:@"pid"];
	NSString *str4 = @"";
	if(value4 != [NSNull null])
		str4 = (NSString *)value4;
	
	
	if(![str11 isEqualToString:@""])
	{
		pdf1_btn.hidden = FALSE;
	}
	
	if(![str2 isEqualToString:@""])
	{
		pdf2_btn.hidden = FALSE;
	}
	
	if(![str3 isEqualToString:@""])
	{
		word_btn.hidden = FALSE;
	}
	
	if(![str4 isEqualToString:@""])
	{
		[pdf1_btn.titleLabel setFont:[UIFont fontWithName:@"helvetica" size:1]];
		[pdf1_btn setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
		[pdf1_btn setTitle:[NSString stringWithFormat:@"%@",str4] forState:UIControlStateNormal];
	}
}


//=====================================================================
//get fatch_search_data

-(void)fatch_search_data:(NSString*)senderId
{
	[myPgressIndicator startAnimating];
	self.search_Array = nil;
	[first_search_list_tbl reloadData];
	first_search_list_tbl.hidden = TRUE;
	
	NSString *urlString = [NSString stringWithFormat:@"http://openxcellaus.info/waclighting/product_search_auto_list.php?title=%@",senderId];
	
	urlString = [urlString stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
	
	NSLog(@"%@",urlString);
   
	Web_req =[[ASIHttpParser alloc] initWithRequestWithURL:urlString selSuccess:@selector(search_data:) selError:@selector(OnError) andHandler:self];
	//isLoded =FALSE;
    [myPgressIndicator startAnimating];
	
	
	
	
	//NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
//	JSONParser *parser;
//    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(search_data:) andHandler:self];
//	
	
}

-(void)search_data:(NSDictionary*)dictionary{
	
	Web_req = nil;
	[Web_req release];
	
	//beinspired_detail_view
	NSLog(@"%@",dictionary);	
	[myPgressIndicator stopAnimating];
	//isLoded = TRUE;
	
	NSMutableArray *temp_search_Array = [[NSMutableArray alloc]init];
    temp_search_Array = [dictionary valueForKey:@"product"];
	self.search_Array = [temp_search_Array retain];
	[temp_search_Array release];
	
	if (self.search_Array.count == 0){
		[customealert showAlert:@"Alert" message:@"No data found." delegate:self];
		first_search_list_tbl.hidden = TRUE;
		[searchtxt resignFirstResponder];
	}
	else {
		first_search_list_tbl.hidden = FALSE;
	}
	//[start_search_tbl reloadData];
	[first_search_list_tbl reloadData];
}



-(void)final_image_zoom:(id)sender
{
	UIButton *btn = (UIButton*)sender;
	
	InternetAccessibility = [appObj_iphone checkInternet];
	if (InternetAccessibility==0) 
	{
		[customealert showAlert:@"Network Connection Error" message:@"Please make sure you are connected to the internet." delegate:self];
	}else
	{
		[self show_detail_img:btn];
	}
}


#pragma mark specdatacustomcell methods

-(void)aMethod1:(id)sender{
	
	UIView *btn= [(UIButton*)sender superview];
	int i = btn.tag;
	NSLog(@" button 1 %d",i);
	
	UIButton *b = (UIButton*)sender;
	NSLog(@"%@",b.titleLabel.text);
	
	self.mailIDstr = [NSString stringWithFormat:@"%@",b.titleLabel.text];
	
	InternetAccessibility = [appObj_iphone checkInternet];
	if (InternetAccessibility==0) 
	{
		[customealert showAlert:@"Network Connection Error" message:@"Please make sure you are connected to the internet." delegate:self];
	}else
	{
		spec_pdf_flag = TRUE;
		
		NSString *video_str = [NSString stringWithFormat:@"%@",[[self.spec_data_final_Array objectAtIndex:i]valueForKey:@"spec_pdfpath"]];
		
		[CustomSpecAlert showAlert:@"View Spec Data" message:@"Please Choose An Option" Cat:@"spec_pdfpath" Url:video_str delegate:self];
	}
}


-(void)aMethod2:(id)sender{
	UIView *btn= [(UIButton*)sender superview];
	int i = btn.tag;
	NSLog(@"button 2 %d",i);
	
	InternetAccessibility = [appObj_iphone checkInternet];
	if (InternetAccessibility==0) 
	{
		[customealert showAlert:@"Network Connection Error" message:@"Please make sure you are connected to the internet." delegate:self];
	}else
	{
		spec_pdf_flag = FALSE;
		
		NSString *video_str = [NSString stringWithFormat:@"%@",[[self.spec_data_final_Array objectAtIndex:i]valueForKey:@"inst_pdfpath"]];
		
		[CustomSpecAlert showAlert:@"View Spec Data" message:@"Please Choose An Option" Cat:@"inst_pdfpath" Url:video_str delegate:self];
	}
	
	//[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[[self.spec_data_final_Array objectAtIndex:i]valueForKey:@"inst_pdfpath"]]]];
}
-(void)aMethod3:(id)sender{
	UIView *btn= [(UIButton*)sender superview];
	int i = btn.tag;
	NSLog(@" button 3 %d",i);
	
	InternetAccessibility = [appObj_iphone checkInternet];
	if (InternetAccessibility==0) 
	{
		[customealert showAlert:@"Network Connection Error" message:@"Please make sure you are connected to the internet." delegate:self];
	}else
	{
		NSString *fileStr = [[NSString alloc]initWithString:[[self.spec_data_final_Array objectAtIndex:i]valueForKey:@"ies"]];
		
		[CustomSpecAlert showAlert:@"View Spec Data" message:@"Please Choose An Option" Cat:@"ies" Url:fileStr delegate:self];
		
		[fileStr release];
	}
}




-(IBAction)show_pdf1_clicked:(id)sender
{
	InternetAccessibility = [appObj_iphone checkInternet];
	if (InternetAccessibility==0) 
	{
		[customealert showAlert:@"Network Connection Error" message:@"Please make sure you are connected to the internet." delegate:self];
	}else
	{
		spec_pdf_flag = TRUE;
		
		UIButton *b = (UIButton*)sender;
		NSLog(@"%@",b.titleLabel.text);
		
		self.mailIDstr = [NSString stringWithFormat:@"%@",b.titleLabel.text];
		
		NSString *video_str = [NSString stringWithFormat:@"%@",[self.product_final_Array valueForKey:@"spec_pdfpath"]];
		//video_str = [video_str stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
		[CustomSpecAlert showAlert:@"View Spec Data" message:@"Please Choose An Option" Cat:@"spec_pdfpath" Url:video_str delegate:self];
//		[self show_web_view:video_str];
	}
}

-(IBAction)show_pdf2_clicked:(id)sender
{
	InternetAccessibility = [appObj_iphone checkInternet];
	if (InternetAccessibility==0) 
	{
		[customealert showAlert:@"Network Connection Error" message:@"Please make sure you are connected to the internet." delegate:self];
	}else
	{
		spec_pdf_flag = FALSE;
		NSString *video_str = [NSString stringWithFormat:@"%@",[self.product_final_Array valueForKey:@"inst_pdfpath"]];
		//video_str = [video_str stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
		[CustomSpecAlert showAlert:@"View Spec Data" message:@"Please Choose An Option" Cat:@"inst_pdfpath" Url:video_str delegate:self];
//		[self show_web_view:video_str];
	}
	
	
}

-(IBAction)show_word_clicked:(id)sender
{
	InternetAccessibility = [appObj_iphone checkInternet];
	if (InternetAccessibility==0) 
	{
		[customealert showAlert:@"Network Connection Error" message:@"Please make sure you are connected to the internet." delegate:self];
	}else
	{
		NSString *fileStr = [[NSString alloc]initWithString:[self.product_final_Array valueForKey:@"ies"]];
		fileStr = [fileStr stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
		[CustomSpecAlert showAlert:@"View Spec Data" message:@"Please Choose An Option" Cat:@"ies" Url:fileStr delegate:self];
	
	}
}

-(IBAction)Show_where_to_buy_clicked:(id)sender
{
	InternetAccessibility = [appObj_iphone checkInternet];
	if (InternetAccessibility==0) 
	{
		[customealert showAlert:@"Network Connection Error" message:@"Please make sure you are connected to the internet." delegate:self];
	}else
	{
		[mail_Web_btn setEnabled:FALSE];
		NSString *url = [[NSString alloc]initWithString:@"http://launch.waclighting.com/locator"];
		[self show_web_view:url];
		[url release];
	}
	
}

-(IBAction)Do_mail_InWeb_Clicked
{
	if(spec_pdf_flag == TRUE)
	{
		[myPgressIndicator startAnimating];
		//NSString *urlString = [NSString stringWithFormat:@"http://openxcellaus.info/waclighting/product_overview_html.php?pid=1041"];
		NSString *urlString = [NSString stringWithFormat:@"http://openxcellaus.info/waclighting/product_overview_html.php?pid=%@",self.mailIDstr];
		NSLog(@"%@",urlString);
		Web_req =[[ASIHttpParser alloc] initWithRequestWithURL:urlString selSuccess:@selector(mail_data:) selError:@selector(OnError) andHandler:self];
		[myPgressIndicator startAnimating];
	}else {
		[self select_mail_spec:nil :web_home_str];
	}

	
}

-(void)mail_data:(NSDictionary*)dictionary{
	
	NSLog(@"%@",dictionary);	
	[myPgressIndicator stopAnimating];
	
	Web_req = nil;
	[Web_req release];
	
	NSMutableDictionary *temp_search_Dict = [[NSMutableDictionary alloc]init];
    temp_search_Dict = (NSMutableDictionary*)[dictionary valueForKey:@"product"];
	
	
	[self spec_mail_clicked:web_home_str Dict:temp_search_Dict];
    
    temp_search_Dict = nil;
    [temp_search_Dict release];
}

-(void)select_view_spec:(NSString*)str:(NSString*)url
{
	
	if ([str isEqualToString:@"spec_pdfpath"] || [str isEqualToString:@"inst_pdfpath"]) {
		[mail_Web_btn setEnabled:TRUE];
		[self show_web_view:url];
	}
	
	if ([str isEqualToString:@"ies"]) {
		[self getYourBook:url];
	}
	
}

-(void)select_mail_spec:(NSString*)str:(NSString*)url
{	
	if ([str isEqualToString:@"spec_pdfpath"]) {
		web_home_str = url;
		[self Do_mail_InWeb_Clicked];
	}
	else
	{
			
		if ([MFMailComposeViewController canSendMail]) {
			
			isMail = TRUE;
			
			MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
			NSArray *toRecipients = [NSArray arrayWithObject:@"sales@waclighting.com"];
			[mail setToRecipients:toRecipients];
			[mail setMailComposeDelegate:self];
			//NSString *newString = [BeInspire_detail_lbl.text stringByReplacingOccurrencesOfString:@" " withString:@"-"];
			
			NSString *emailBody = [NSString stringWithFormat:@"%@",url];
			
			[mail setMessageBody:emailBody isHTML:YES];
			
			[self presentModalViewController:mail animated:YES];
		}
	}
	
}

-(void)spec_mail_clicked:(NSString*)url Dict:(NSMutableDictionary*)dict
{
	NSLog(@"%@",dict);
	if ([MFMailComposeViewController canSendMail]) {
		
        MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
        NSArray *toRecipients = [NSArray arrayWithObject:@"sales@waclighting.com"];
        [mail setToRecipients:toRecipients];
        [mail setMailComposeDelegate:self];
        //NSString *newString = [BeInspire_detail_lbl.text stringByReplacingOccurrencesOfString:@" " withString:@"-"];
		
		
		
        NSString *emailBody = [NSString stringWithFormat:@"%@ \n\n %@",url,dict];
		
		
        [mail setMessageBody:emailBody isHTML:YES];
        [self presentModalViewController:mail animated:YES];
    }
	
}


-(void)webViewDidStartLoad:(UIWebView *)webView {
    //[self showHUD];
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES; 
}


-(void)webViewDidFinishLoad:(UIWebView *)webView{
	//[self hideHUD];
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO; 
}


-(IBAction)OnEmail_beinspiered:(id)sender{
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
        NSArray *toRecipients = [NSArray arrayWithObject:@"sales@waclighting.com"];
        [mail setToRecipients:toRecipients];
        [mail setMailComposeDelegate:self];
        NSString *newString = [BeInspire_detail_lbl.text stringByReplacingOccurrencesOfString:@" " withString:@"-"];
		
        NSString *emailBody = [NSString stringWithFormat:@"http://launch.waclighting.com/project/%@",newString];
        
        [mail setMessageBody:emailBody isHTML:YES];
        
        [self presentModalViewController:mail animated:YES];
    }
    NSLog(@" inbeinspired");
	
}
-(IBAction)OnEmail_Contactus:(id)sender{
    
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
        NSArray *toRecipients = [NSArray arrayWithObject:@"sales@waclighting.com"];
        [mail setToRecipients:toRecipients];
		[mail setSubject:@"Sign Me Up For eNews!"];
        [mail setMailComposeDelegate:self];
        NSString *emailBody = [NSString stringWithFormat:@" I’d like to be signed up for the WAC Lighting eNEWs. My e-mail address is, %@",email_contactus_txt.text];
        [mail setMessageBody:emailBody isHTML:YES];
        [self presentModalViewController:mail animated:YES];
    }
    
}


- (void)printTapped:(NSString *)urlStr {  
	void (^completionHandler)(UIPrintInteractionController *, BOOL, NSError *) =
	^(UIPrintInteractionController *pic, BOOL completed, NSError *error) {
		if (!completed && error) NSLog(@"Print error: %@", error);
	};
	
	NSData *pdfData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[urlStr stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]]]];
	printController.printingItem = pdfData;
	[printController presentAnimated:YES completionHandler:completionHandler];
	
	
}


#pragma mark Search 

-(IBAction)search_btn_clicked
{
	InternetAccessibility = [appObj_iphone checkInternet];
	if (InternetAccessibility == 0) 
	{
		[searchtxt resignFirstResponder];
		[customealert showAlert:@"Network Connection Error" message:@"Please make sure you are connected to the internet." delegate:self];
	}else
	{
		NSString *searchStr = [searchtxt.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
		
		if (![searchStr isEqualToString:@""]) 
		{
			[self fatch_search_data: searchStr];
			
		}
	}
}


-(void)show_search_tbl_view
{
	[self.view bringSubviewToFront:start_search_view];
	[self.view bringSubviewToFront:myPgressIndicator];
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.8];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(animDone:finished:context:)];
	start_search_view.frame = CGRectMake(0, 44, start_search_view.frame.size.width, start_search_view.frame.size.height);
	[UIView commitAnimations];
}


-(void)close_search_tbl_view
{
	if([back_btn_tag_Arr count]!=0)
	[back_btn_tag_Arr removeLastObject];
	//[self.view setUserInteractionEnabled:TRUE];
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.8];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(animDone:finished:context:)];
	start_search_view.frame = CGRectMake(320, 44, start_search_view.frame.size.width, start_search_view.frame.size.height);
	[UIView commitAnimations];
}



-(void)fatch_second_search_data:(NSString*)senderId
{
	self.search_array_second = nil;
	[start_search_tbl reloadData];
	
	//NSURL *url = [NSURL URLWithString:[urlstr stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
	
	NSString *urlString = [NSString stringWithFormat:@"http://openxcellaus.info/waclighting/product_search_temp.php?title=%@",senderId];
	urlString = [urlString stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
	
	NSLog(@"%@",urlString);
	
	Web_req =[[ASIHttpParser alloc] initWithRequestWithURL:urlString selSuccess:@selector(second_search_data:) selError:@selector(OnError) andHandler:self];
	//isLoded =FALSE;
    [myPgressIndicator startAnimating];
	
}

-(void)second_search_data:(NSDictionary*)dictionary{
	
	Web_req = nil;
	[Web_req release];
	
	//beinspired_detail_view
	NSLog(@"%@",dictionary);	
	[self.view setUserInteractionEnabled:TRUE];
	[myPgressIndicator stopAnimating];
	//isLoded = TRUE;
	[searchtxt resignFirstResponder];
	
	NSMutableArray *temp_search_Array_second = [[NSMutableArray alloc]init];
    temp_search_Array_second = [dictionary valueForKey:@"product"];
	self.search_array_second = [temp_search_Array_second retain];
	[temp_search_Array_second release];
	
	if (self.search_array_second.count == 0){
		[customealert showAlert:@"Alert" message:@"No data found." delegate:self];
		
	}

	//[start_search_tbl reloadData];
	[start_search_tbl reloadData];
}



#pragma mark Social Media Methods

-(IBAction)Btn_facebook_press
{
	InternetAccessibility = [appObj_iphone checkInternet];
	if (InternetAccessibility==0) 
	{
		[customealert showAlert:@"Network Connection Error" message:@"Please make sure you are connected to the internet." delegate:self];
	}else
	{
		[mail_Web_btn setEnabled:FALSE];
		NSString *video_str = @"http://www.facebook.com/wac.lighting?sk=wall";
		[self show_web_view:video_str];
	}
}


-(IBAction)Btn_twitter_press
{
	InternetAccessibility = [appObj_iphone checkInternet];
	if (InternetAccessibility==0) 
	{
		[customealert showAlert:@"Network Connection Error" message:@"Please make sure you are connected to the internet." delegate:self];
	}else
	{
		[mail_Web_btn setEnabled:FALSE];
		NSString *video_str = @"https://twitter.com/#!/waclighting";
		//[self show_web_view:video_str];

		back_btn.tag = 9;
		if ([back_btn_tag_Arr containsObject:[NSString stringWithFormat:@"%d",back_btn.tag]]) {
			[back_btn_tag_Arr removeObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
		}
		back_btn.hidden = FALSE;
		[back_btn_tag_Arr addObject:[NSString stringWithFormat:@"%d",back_btn.tag]];
		
		web_home_str = video_str;
		
		if(myWebView1)
		{
			[myWebView1 removeFromSuperview];
			myWebView1 = nil;
			[myWebView1 release];
		}
		myWebView1 = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 320, 372)];
		[web_view addSubview:myWebView1];
		NSURL *url = [NSURL URLWithString:video_str];
		NSURLRequest *request = [NSURLRequest requestWithURL:url];
		[myWebView1 loadRequest:request];
		myWebView1.delegate = self;
		myWebView1.scalesPageToFit = TRUE;
		myWebView1.autoresizesSubviews = YES;
		myWebView1.autoresizingMask=(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
		
		[self.view bringSubviewToFront:web_view];
		[self.view bringSubviewToFront:myPgressIndicator];
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.8];
		web_view.frame = CGRectMake(0, 44, 320, 416);
		[UIView commitAnimations];
		
	}
}

-(IBAction)Btn_blogger_press
{
	InternetAccessibility = [appObj_iphone checkInternet];
	if (InternetAccessibility==0) 
	{
		[customealert showAlert:@"Network Connection Error" message:@"Please make sure you are connected to the internet." delegate:self];
	}else
	{
		[mail_Web_btn setEnabled:FALSE];
		NSString *video_str = @"http://waclightingusa.blogspot.com/";
		[self show_web_view:video_str];
	}
}

-(IBAction)Btn_youtube_press
{
	InternetAccessibility = [appObj_iphone checkInternet];
	if (InternetAccessibility==0) 
	{
		[customealert showAlert:@"Network Connection Error" message:@"Please make sure you are connected to the internet." delegate:self];
	}else
	{
		[mail_Web_btn setEnabled:FALSE];
		NSString *video_str = @"http://www.youtube.com/user/WACLighting";
		[self show_web_view:video_str];
	}
}

-(IBAction)Btn_linkedin_press
{
	InternetAccessibility = [appObj_iphone checkInternet];
	if (InternetAccessibility==0) 
	{
		[customealert showAlert:@"Network Connection Error" message:@"Please make sure you are connected to the internet." delegate:self];
	}else
	{
		[mail_Web_btn setEnabled:FALSE];
		NSString *video_str = @"http://www.linkedin.com/company/454469?trk=tyah";
		[self show_web_view:video_str];
	}
}






- (NSString *)decodeHTMLEntities:(NSString *)string {
	// Reserved Characters in HTML
	string = [string stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
	string = [string stringByReplacingOccurrencesOfString:@"&apos;" withString:@"'"];
	string = [string stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
	string = [string stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
	string = [string stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
	
	// ISO 8859-1 Symbols
	string = [string stringByReplacingOccurrencesOfString:@"&iexcl;" withString:@"¡"];
	string = [string stringByReplacingOccurrencesOfString:@"&cent;" withString:@"¢"];
	string = [string stringByReplacingOccurrencesOfString:@"&pound;" withString:@"£"];
	string = [string stringByReplacingOccurrencesOfString:@"&curren;" withString:@"¤"];
	string = [string stringByReplacingOccurrencesOfString:@"&yen;" withString:@"¥"];
	string = [string stringByReplacingOccurrencesOfString:@"&brvbar;" withString:@"¦"];
	string = [string stringByReplacingOccurrencesOfString:@"&sect;" withString:@"§"];
	string = [string stringByReplacingOccurrencesOfString:@"&uml;" withString:@"¨"];
	string = [string stringByReplacingOccurrencesOfString:@"&copy;" withString:@"©"];
	string = [string stringByReplacingOccurrencesOfString:@"&ordf;" withString:@"ª"];
	string = [string stringByReplacingOccurrencesOfString:@"&laquo;" withString:@"«"];
	string = [string stringByReplacingOccurrencesOfString:@"&not;" withString:@"¬"];
	string = [string stringByReplacingOccurrencesOfString:@"&shy;" withString:@"	"];
	string = [string stringByReplacingOccurrencesOfString:@"&reg;" withString:@"®"];
	string = [string stringByReplacingOccurrencesOfString:@"&macr;" withString:@"¯"];
	string = [string stringByReplacingOccurrencesOfString:@"&deg;" withString:@"°"];
	string = [string stringByReplacingOccurrencesOfString:@"&plusmn;" withString:@"±	"];
	string = [string stringByReplacingOccurrencesOfString:@"&sup2;" withString:@"²"];
	string = [string stringByReplacingOccurrencesOfString:@"&sup3;" withString:@"³"];
	string = [string stringByReplacingOccurrencesOfString:@"&acute;" withString:@"´"];
	string = [string stringByReplacingOccurrencesOfString:@"&micro;" withString:@"µ"];
	string = [string stringByReplacingOccurrencesOfString:@"&para;" withString:@"¶"];
	string = [string stringByReplacingOccurrencesOfString:@"&middot;" withString:@"·"];
	string = [string stringByReplacingOccurrencesOfString:@"&cedil;" withString:@"¸"];
	string = [string stringByReplacingOccurrencesOfString:@"&sup1;" withString:@"¹"];
	string = [string stringByReplacingOccurrencesOfString:@"&ordm;" withString:@"º"];
	string = [string stringByReplacingOccurrencesOfString:@"&raquo;" withString:@"»"];
	string = [string stringByReplacingOccurrencesOfString:@"&frac14;" withString:@"¼"];
	string = [string stringByReplacingOccurrencesOfString:@"&frac12;" withString:@"½"];
	string = [string stringByReplacingOccurrencesOfString:@"&frac34;" withString:@"¾"];
	string = [string stringByReplacingOccurrencesOfString:@"&iquest;" withString:@"¿"];
	string = [string stringByReplacingOccurrencesOfString:@"&times;" withString:@"×"];
	string = [string stringByReplacingOccurrencesOfString:@"&divide;" withString:@"÷"];
	
	// ISO 8859-1 Characters
	string = [string stringByReplacingOccurrencesOfString:@"&Agrave;" withString:@"À"];
	string = [string stringByReplacingOccurrencesOfString:@"&Aacute;" withString:@"Á"];
	string = [string stringByReplacingOccurrencesOfString:@"&Acirc;" withString:@"Â"];
	string = [string stringByReplacingOccurrencesOfString:@"&Atilde;" withString:@"Ã"];
	string = [string stringByReplacingOccurrencesOfString:@"&Auml;" withString:@"Ä"];
	string = [string stringByReplacingOccurrencesOfString:@"&Aring;" withString:@"Å"];
	string = [string stringByReplacingOccurrencesOfString:@"&AElig;" withString:@"Æ"];
	string = [string stringByReplacingOccurrencesOfString:@"&Ccedil;" withString:@"Ç"];
	string = [string stringByReplacingOccurrencesOfString:@"&Egrave;" withString:@"È"];
	string = [string stringByReplacingOccurrencesOfString:@"&Eacute;" withString:@"É"];
	string = [string stringByReplacingOccurrencesOfString:@"&Ecirc;" withString:@"Ê"];
	string = [string stringByReplacingOccurrencesOfString:@"&Euml;" withString:@"Ë"];
	string = [string stringByReplacingOccurrencesOfString:@"&Igrave;" withString:@"Ì"];
	string = [string stringByReplacingOccurrencesOfString:@"&Iacute;" withString:@"Í"];
	string = [string stringByReplacingOccurrencesOfString:@"&Icirc;" withString:@"Î"];
	string = [string stringByReplacingOccurrencesOfString:@"&Iuml;" withString:@"Ï"];
	string = [string stringByReplacingOccurrencesOfString:@"&ETH;" withString:@"Ð"];
	string = [string stringByReplacingOccurrencesOfString:@"&Ntilde;" withString:@"Ñ"];
	string = [string stringByReplacingOccurrencesOfString:@"&Ograve;" withString:@"Ò"];
	string = [string stringByReplacingOccurrencesOfString:@"&Oacute;" withString:@"Ó"];
	string = [string stringByReplacingOccurrencesOfString:@"&Ocirc;" withString:@"Ô"];
	string = [string stringByReplacingOccurrencesOfString:@"&Otilde;" withString:@"Õ"];
	string = [string stringByReplacingOccurrencesOfString:@"&Ouml;" withString:@"Ö"];
	string = [string stringByReplacingOccurrencesOfString:@"&Oslash;" withString:@"Ø"];
	string = [string stringByReplacingOccurrencesOfString:@"&Ugrave;" withString:@"Ù"];
	string = [string stringByReplacingOccurrencesOfString:@"&Uacute;" withString:@"Ú"];
	string = [string stringByReplacingOccurrencesOfString:@"&Ucirc;" withString:@"Û"];
	string = [string stringByReplacingOccurrencesOfString:@"&Uuml;" withString:@"Ü"];
	string = [string stringByReplacingOccurrencesOfString:@"&Yacute;" withString:@"Ý"];
	string = [string stringByReplacingOccurrencesOfString:@"&THORN;" withString:@"Þ"];
	string = [string stringByReplacingOccurrencesOfString:@"&szlig;" withString:@"ß"];
	string = [string stringByReplacingOccurrencesOfString:@"&agrave;" withString:@"à"];
	string = [string stringByReplacingOccurrencesOfString:@"&aacute;" withString:@"á"];
	string = [string stringByReplacingOccurrencesOfString:@"&acirc;" withString:@"â"];
	string = [string stringByReplacingOccurrencesOfString:@"&atilde;" withString:@"ã"];
	string = [string stringByReplacingOccurrencesOfString:@"&auml;" withString:@"ä"];
	string = [string stringByReplacingOccurrencesOfString:@"&aring;" withString:@"å"];
	string = [string stringByReplacingOccurrencesOfString:@"&aelig;" withString:@"æ"];
	string = [string stringByReplacingOccurrencesOfString:@"&ccedil;" withString:@"ç"];
	string = [string stringByReplacingOccurrencesOfString:@"&egrave;" withString:@"è"];
	string = [string stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"];
	string = [string stringByReplacingOccurrencesOfString:@"&ecirc;" withString:@"ê"];
	string = [string stringByReplacingOccurrencesOfString:@"&euml;" withString:@"ë"];
	string = [string stringByReplacingOccurrencesOfString:@"&igrave;" withString:@"ì"];
	string = [string stringByReplacingOccurrencesOfString:@"&iacute;" withString:@"í"];
	string = [string stringByReplacingOccurrencesOfString:@"&icirc;" withString:@"î"];
	string = [string stringByReplacingOccurrencesOfString:@"&iuml;" withString:@"ï"];
	string = [string stringByReplacingOccurrencesOfString:@"&eth;" withString:@"ð"];
	string = [string stringByReplacingOccurrencesOfString:@"&ntilde;" withString:@"ñ"];
	string = [string stringByReplacingOccurrencesOfString:@"&ograve;" withString:@"ò"];
	string = [string stringByReplacingOccurrencesOfString:@"&oacute;" withString:@"ó"];
	string = [string stringByReplacingOccurrencesOfString:@"&ocirc;" withString:@"ô"];
	string = [string stringByReplacingOccurrencesOfString:@"&otilde;" withString:@"õ"];
	string = [string stringByReplacingOccurrencesOfString:@"&ouml;" withString:@"ö"];
	string = [string stringByReplacingOccurrencesOfString:@"&oslash;" withString:@"ø"];
	string = [string stringByReplacingOccurrencesOfString:@"&ugrave;" withString:@"ù"];
	string = [string stringByReplacingOccurrencesOfString:@"&uacute;" withString:@"ú"];
	string = [string stringByReplacingOccurrencesOfString:@"&ucirc;" withString:@"û"];
	string = [string stringByReplacingOccurrencesOfString:@"&uuml;" withString:@"ü"];
	string = [string stringByReplacingOccurrencesOfString:@"&yacute;" withString:@"ý"];
	string = [string stringByReplacingOccurrencesOfString:@"&thorn;" withString:@"þ"];
	string = [string stringByReplacingOccurrencesOfString:@"&yuml;" withString:@"ÿ"];
	string = [string stringByReplacingOccurrencesOfString:@"&trade;" withString:@"™"];
	string = [string stringByReplacingOccurrencesOfString:@"&#39;" withString:@"'"];
	string = [string stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@" "];
	string = [string stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
	string = [string stringByReplacingOccurrencesOfString:@"&bull;" withString:@"•"];
	string = [string stringByReplacingOccurrencesOfString:@"&rsquo;" withString:@"’"];
	string = [string stringByReplacingOccurrencesOfString:@"&rdquo;" withString:@"”"];
	return string;
}


#pragma mark -
#pragma mark Alert Handle

-(void)showHUD{
	[self hideHUD];
	HUD = [[MBProgressHUD alloc] initWithView:self.view];
	[self.view addSubview:HUD];
    HUD.labelText = @"Processing..";
	[HUD show:YES];
	self.view.userInteractionEnabled = NO;
}
-(void)hideHUD{
	if (HUD) {
		[HUD hide:YES];
		[HUD removeFromSuperview];
		[HUD release];
		HUD = nil;
		self.view.userInteractionEnabled = YES;
	}
}

#pragma mark -
#pragma mark download Zip File

-(void)getYourBook:(NSString*)zipString{
	[self showHUD];
	
    NSString *temp_str = [NSString stringWithFormat:@"%@",zipString];
	
	NSFileManager *fileManager = [NSFileManager defaultManager];
	zipName = [[NSString alloc]initWithString:[temp_str lastPathComponent]];
	NSString *file_path = [self getPath:zipName];
	
	BOOL success = [fileManager fileExistsAtPath:file_path]; 
    if(success){
		[self hideHUD];
		[customealert showAlert:@"Alert" message:@"File is already downloaded" delegate:self];
		return;
	}
	
	
    NSURL *url = [NSURL URLWithString: [temp_str stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    
    [req setHTTPMethod:@"POST"];
    
    conn = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    if (conn) {
        webData = [[NSMutableData data] retain];
    }       
}

-(void)connection:(NSURLConnection* )connection didReceiveResponse:(NSURLResponse* )response {
    [webData setLength: 0];
}
-(void)connection:(NSURLConnection* )connection didReceiveData:(NSData *)data {
    [webData appendData:data];
    
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [self hideHUD];
    UIAlertView  *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"connection lost" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
    [errorAlert release];
    NSLog(@"ERROR with theConenction");   
    
    [connection release];
    [webData release];
}

- (NSString *) getPath :(NSString *)fstr{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
    //NSLog(@"%@",[paths objectAtIndex:0]);
    NSString *documentsDir = [paths objectAtIndex:0];
    //NSLog(@"%@",[documentsDir stringByAppendingPathComponent:@"LikeMeFit.sqlite"]);
    return [documentsDir stringByAppendingPathComponent:fstr];    
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [self hideHUD];  
    NSString * file_write = [self getPath:[NSString stringWithFormat:@"%@",zipName]];
    [webData writeToFile:file_write atomically:YES];
    NSLog(@"written in file");
}




-(void)loadScrollView:(NSMutableArray *)array{
	
	if(myscroll)
	{
		[myscroll removeFromSuperview];
		[myscroll release];
	}
	pageCntrl.numberOfPages = 0;
    
	pageCntrl.enabled =TRUE;
	
	myscroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 33.0, 320, 335)];
	myscroll.delegate =self;
	
	for(int i=0;i<[array count];i++){
		int p =(i/10);
		
		myscroll.contentSize = CGSizeMake((320*p)+320, 335);
		
		UIView *u =[[UIView alloc]initWithFrame:CGRectMake(p*320, (i%10)*33, 320, 32)];
		u.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"specCellBg.png"]];
		
		id value1 = [[array objectAtIndex:i]valueForKey:@"spec_pdfpath"];
		NSString *str1 = @"";
		if(value1 != [NSNull null])
			str1 = (NSString *)value1;
		
		
		id value2 = [[array objectAtIndex:i]valueForKey:@"inst_pdfpath"];
		NSString *str2 = @"";
		if(value2 != [NSNull null])
			str2 = (NSString *)value2;
		
		id value3 = [[array objectAtIndex:i]valueForKey:@"ies"];
		NSString *str3 = @"";
		if(value3 != [NSNull null])
			str3 = (NSString *)value3;
		
		id value4 = [[array objectAtIndex:i]valueForKey:@"images"];
		NSString *str4 = @"";
		if(value4 != [NSNull null])
			str4 = (NSString *)value4;
		
		id value5 = [[array objectAtIndex:i]valueForKey:@"images_actual"];
		NSString *str5 = @"";
		if(value5 != [NSNull null])
			str5 = (NSString *)value5;
		
		id value6 = [[array objectAtIndex:i]valueForKey:@"pid"];
		NSString *str6 = @"";
		if(value6 != [NSNull null])
			str6 = (NSString *)value6;
		
		if(![str1 isEqualToString:@""])
		{
			UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
			[button setImage:[UIImage imageNamed:@"pdfLogo.png"] forState:UIControlStateNormal];
			[button addTarget:self action:@selector(aMethod1:)forControlEvents:UIControlEventTouchDown];
			[button setTitle:[NSString stringWithFormat:@"%@",str6] forState:UIControlStateNormal];
			button.frame = CGRectMake(172, 2, 30, 30);
			[u addSubview:button];
			
		}		
		
		if(![str2 isEqualToString:@""])
		{
			UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
			button1.imageView.image =[UIImage imageNamed:@"pdfLogo.png"];
			[button1 setImage:[UIImage imageNamed:@"pdfLogo.png"] forState:UIControlStateNormal];
			[button1 addTarget:self action:@selector(aMethod2:)forControlEvents:UIControlEventTouchDown];
			button1.frame = CGRectMake(225, 2, 30,30);
			[u addSubview:button1];
		
			
		}
		
		if(![str3 isEqualToString:@""])
		{
			UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
			[button2 setImage:[UIImage imageNamed:@"wordLogo.png"] forState:UIControlStateNormal];
			[button2 addTarget:self action:@selector(aMethod3:)
			  forControlEvents:UIControlEventTouchDown];
			button2.frame = CGRectMake(282, 2, 30,30);
			[u addSubview:button2];
			
		}
		
		if(![str4 isEqualToString:@""])
		{
			
			UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
			[button3 setImage:[UIImage imageNamed:@"productLogo.png"] forState:UIControlStateNormal];
			button3.frame = CGRectMake(2,3,30,27);
			[u addSubview:button3];
			
			[button3 setTitle:[NSString stringWithFormat:@"%@",str5] forState:UIControlStateNormal];
			[button3 addTarget:self action:@selector(show_detail_img:) forControlEvents:UIControlEventTouchUpInside];
			
			
			EGOImageView *myimageView = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"place_spec_img.png"]];
			myimageView.frame = [button3 bounds];
			[button3 addSubview:myimageView];
			CATransition *transition = [CATransition animation];
			transition.duration = 0.75;		
			transition.type = kCATransitionFade;
			[myimageView.layer addAnimation:transition forKey:nil];
			myimageView.imageURL = [NSURL URLWithString:[str4 stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
			[myimageView release];
			
		}
		
		id val = [[array objectAtIndex:i]valueForKey:@"title"];
		NSString *str = @"";
		if(val != [NSNull null])
			str = (NSString *)val;
		str = [self decodeHTMLEntities:str];
	
		UILabel *myLabel = [[UILabel alloc]initWithFrame:CGRectMake(33, 1, 120, 28)];
		[myLabel setBackgroundColor:[UIColor clearColor]];
		[myLabel setFont:[UIFont fontWithName:@"helvetica" size:9]];
		[myLabel setNumberOfLines:2];
		[myLabel setLineBreakMode:UILineBreakModeClip];
		[myLabel setText:[NSString stringWithFormat:@"%@",str]];
		[u addSubview:myLabel];
		
		u.tag = i;
		
		[myscroll addSubview:u];
		
		[myLabel release];
		[u release];
	}
	
	myscroll.pagingEnabled =TRUE;
	pageCntrl.numberOfPages = myscroll.contentSize.width/320;
	pageCntrl.currentPage = 0;
	if([array count]!=0)
	[specdata_sub_view addSubview:myscroll];
}


-(IBAction)home_btn_clicked
{
	[self viewWillAppear:NO];
	logoView.frame = CGRectMake(0, -80, logoView.frame.size.width, logoView.frame.size.height);
	add_scroll_view.frame = CGRectMake(0, 480, add_scroll_view.frame.size.width, add_scroll_view.frame.size.height);
	[self set_allLayout_animated:nil];
}


#pragma mark -
#pragma mark GestureRecognizers

- (void)addGestureRecognizersToPiece:(UIView *)piece
{
	
	UISwipeGestureRecognizer *downSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(showResetMenu:)];
	downSwipeGesture.direction = UISwipeGestureRecognizerDirectionDown;
	[piece addGestureRecognizer:downSwipeGesture];
	[downSwipeGesture release];
	
}
- (void)showResetMenu:(UISwipeGestureRecognizer *)gestureRecognizer
{
    if ([gestureRecognizer state] == UIGestureRecognizerStateEnded) {
		if (gestureRecognizer.view == menu_view) {
			[self close_menu_view];
		}
		
		if (gestureRecognizer.view == search_view) {
			[self close_search_view];
		}
		
	}
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	[[EGOCache currentCache] clearCache];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

-(void)OnError{
    //isLoded =TRUE;
	
	if(Web_req){
		[Web_req cancelReq];
		Web_req = nil;
		[Web_req release];
    }
	
    myPgressIndicator.hidden =TRUE;
    [myPgressIndicator stopAnimating];
    
}


- (void)animDone:(NSString *)animationID finished:(BOOL)finished context:(void *)context {
	
	if([back_btn_tag_Arr count]!=0)
		back_btn.hidden = FALSE;
	else 
		back_btn.hidden = TRUE;
	
	[self.view setUserInteractionEnabled:TRUE];
	
	
	
}


- (void)dealloc {
    [super dealloc];
	
	self.mainCat_Array = nil;
	self.subCat_Array = nil;
	self.subCat_lise_Array = nil;
	self.BeInspire_Array = nil;
	self.Product_Detail_Array = nil;
	self.BeInspire_detail_lbl_array = nil;
	self.spec_data_Array = nil;
	self.spec_data_detail_Array = nil;
	self.spec_data_final_Array = nil;
	self.product_final_Array = nil;
	self.search_Array = nil;
	self.product_lvl3_Array = nil;
	self.linesArray = nil;
    
    img_arr = nil;
    [img_arr release];
	
}


@end
