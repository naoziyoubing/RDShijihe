//
//  RDMainTabBarController.m
//  RDProjectNew
//
//  Created by realdata on 16/3/21.
//  Copyright © 2016年 realdata. All rights reserved.
//

#import "RDMainTabBarController.h"
#import "RDPersonalViewController.h"
#import "RDCourseTypeViewController.h"

@interface RDMainTabBarController ()

@end

@implementation RDMainTabBarController
@synthesize tabBarController;

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    tabBarController = [[UITabBarController alloc] init];
    NSMutableArray *tabBarControllers = [[NSMutableArray alloc] initWithCapacity:1];
    
    RDPersonalViewController *RDPersonalCtl=[[RDPersonalViewController alloc]init];
    UINavigationController* RDPersonalNav = [[UINavigationController alloc]initWithRootViewController:RDPersonalCtl];
    [tabBarControllers addObject:RDPersonalNav];
    
    
    RDCourseTypeViewController *RDCourseTypeCtl=[[RDCourseTypeViewController alloc]init];
    UINavigationController* RDCourseTypeNav = [[UINavigationController alloc]initWithRootViewController:RDCourseTypeCtl];
    [tabBarControllers addObject:RDCourseTypeNav];
    
    UIViewController *c3=[[UIViewController alloc]init];
    c3.view.backgroundColor = [UIColor greenColor];
    //    c3.tabBarItem.title=@"动态";
    
    UIViewController *c4=[[UIViewController alloc]init];
    c4.view.backgroundColor = [UIColor purpleColor];
    //    c4.tabBarItem.title=@"设置";
    
    
    tabBarController.viewControllers = tabBarControllers;
    //设置 点击item 的 颜色
    //    UITabBar *tabBar = tabBarController.tabBar;
    //    tabBar.tintColor = [UIColor blueColor];
    
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:12.f]};
    UITabBarItem *itemOne = (UITabBarItem *)(self.tabBarController.tabBar.items)[0];
    
    [itemOne setTitle:@"我"];
    [itemOne setTitleTextAttributes:attribute forState:UIControlStateNormal];
//    [itemOne setImage:[UIImage imageNamed:@"contact_notice"]];
//    [itemOne setSelectedImage:[[UIImage imageNamed:@"contact_notice_checked"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    UITabBarItem* itemTwo = (UITabBarItem *)(self.tabBarController.tabBar.items)[1];
    [itemTwo setTitle:@"课程"];
    [itemTwo setTitleTextAttributes:attribute forState:UIControlStateNormal];
    
    
    [self.view addSubview:tabBarController.view];
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setMain];
}

-(void) setMain
{
    
}

@end
