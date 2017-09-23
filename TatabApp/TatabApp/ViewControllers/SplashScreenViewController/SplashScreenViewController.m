//
//  SplashScreenViewController.m
//  TatabApp
//
//  Created by Shagun Verma on 23/09/17.
//  Copyright © 2017 Shagun Verma. All rights reserved.
//

#import "SplashScreenViewController.h"

@interface SplashScreenViewController ()

@end

@implementation SplashScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidLoad];
    
    
    
        sleep(1);
    
    if ([CommonFunction getBoolValueFromDefaultWithKey:@"isLogin"] == true) {
        HomeViewController *frontViewController = [[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
        
//        SideDrawerViewController *rearViewController = [[SideDrawerViewController alloc]initWithNibName:@"SideDrawerViewController" bundle:nil];
        
//        UINavigationController *frontNavigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
//        
//        frontNavigationController.navigationBar.barTintColor = [CommonFunction getColorFromHexString:@"258036"];
//        
//        SWRevealViewController *mainRevealController = [[SWRevealViewController alloc]initWithRearViewController:rearViewController frontViewController:frontViewController];
//        
//        mainRevealController.delegate = self;
//        self.swController = mainRevealController;
//        
//        UINavigationController* nvc = [[UINavigationController alloc] initWithRootViewController:self.swController];
//        nvc.navigationBarHidden = true;
//        [self presentViewController:nvc animated:YES completion:nil];
        
    }
    else
    {
        UserSelectViewController* vc = [[UserSelectViewController alloc] initWithNibName:@"UserSelectViewController" bundle:nil];
        UINavigationController* navCon = [[UINavigationController alloc] initWithRootViewController:vc];
        vc.navigationController.navigationBarHidden = true;
        [self presentViewController:navCon animated:YES completion:nil];
    }
    
    
}


@end
