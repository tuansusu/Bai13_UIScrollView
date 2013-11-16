//
//  ViewController.m
//  TestScrollView
//
//  Created by VTIT on 11/13/13.
//  Copyright (c) 2013 VTIT. All rights reserved.
//

#import "ViewController.h"
#import "UIDevice+extend.h"

@interface ViewController ()
{
    NSArray *_data;
    UIDevice *_device;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _data = @[@"15.jpg", @"16.jpg", @"17.jpg", @"18.jpg", @"19.jpg"];
	self.scrollView.delegate = self;
    _device =[[UIDevice alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int pageIndex =  scrollView.contentOffset.x / scrollView.bounds.size.width;
   // NSLog(@"%d", pageIndex);
    //self.pageControl.currentPage = pageIndex;
}
- (void) viewWillLayoutSubviews
{
    
    CGSize screenSize = [_device getScreenSize];
    NSLog(@"width = %f height = %f", screenSize.width, screenSize.height);
    
    if (self.interfaceOrientation == UIInterfaceOrientationPortrait ||
         self.interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        NSLog(@"xoay doc");
        self.scrollView.frame = CGRectMake(0, 0, 768, 1004);
    }
    else{
        NSLog(@"xoay ngang");
        self.scrollView.frame = CGRectMake(0, 0, 1024, 748);
    }
    //remove all subview in scrollview
    for (id view in self.scrollView.subviews) {
            if([view isKindOfClass:[UIView class]])
                    [view removeFromSuperview];
    }
    
    float sWidth = self.scrollView.bounds.size.width;
    float sHeight = self.scrollView.bounds.size.height;
    NSLog(@"aaaaaaaaa width = %f height = %f", sWidth, sHeight);
    self.scrollView.contentSize = CGSizeMake([_data count] * sWidth, sHeight);
    //Thêm UIImageView vào trong scrollView
    BOOL xoayNgang = sWidth>sHeight;
    float xWidth = sWidth;
    if (xoayNgang) {
        xWidth = xWidth/2;
    }
    int count = 0;
    NSLog(@"xwith = %f", xWidth);
    for (id photoName in _data) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:photoName]];
        imageView.frame = CGRectMake(count * xWidth, 0, xWidth, sHeight);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.scrollView addSubview:imageView];
        count ++;
    }
    self.scrollView.pagingEnabled = YES;
    self.pageControl.numberOfPages = [_data count]/2;

//    if (self.interfaceOrientation == UIInterfaceOrientationPortrait ||
//        self.interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
//       
//        float sWidth = self.scrollView.bounds.size.width;
//        float sHeight = self.scrollView.bounds.size.height;
//         NSLog(@"xxxxxxx width = %f height = %f", sWidth, sHeight);
//        self.scrollView.contentSize = CGSizeMake([_data count] * sWidth, sHeight);
//        //Thêm UIImageView vào trong scrollView
//        int count = 0;
//        for (id photoName in _data) {
//            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:photoName]];
//            imageView.frame = CGRectMake(count * sWidth, 0, sWidth, sHeight);
//            imageView.contentMode = UIViewContentModeScaleAspectFit;
//            [self.scrollView addSubview:imageView];
//            count ++;
//        }
//        self.scrollView.pagingEnabled = YES;
//        self.pageControl.numberOfPages = [_data count];
//        
//    } else {
//        
//       
//        float sWidth = self.scrollView.bounds.size.width;
//        float sHeight = self.scrollView.bounds.size.height;
//         NSLog(@"aaaaaaaaa width = %f height = %f", sWidth, sHeight);
//        self.scrollView.contentSize = CGSizeMake([_data count] * sWidth, sHeight);
//        //Thêm UIImageView vào trong scrollView
//        BOOL xoayNgang = sWidth>sHeight;
//        int count = 0;
//        for (id photoName in _data) {
//            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:photoName]];
//            if (xoayNgang) {
//                imageView.frame = CGRectMake(count * sWidth/2, 0, sWidth/2, sHeight);
//            }else{
//                imageView.frame = CGRectMake(count * sWidth, 0, sWidth, sHeight);
//            }
//            
//            imageView.contentMode = UIViewContentModeScaleAspectFit;
//            [self.scrollView addSubview:imageView];
//            count ++;
//        }
//        self.scrollView.pagingEnabled = YES;
//        self.pageControl.numberOfPages = [_data count]/2;
//        
//    }
}

- (void) viewDidLayoutSubviews
{
    NSLog(@"did layout");
}
@end
