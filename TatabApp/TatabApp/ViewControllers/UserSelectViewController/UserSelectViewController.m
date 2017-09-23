//
//  UserSelectViewController.m
//  TatabApp
//
//  Created by Shagun Verma on 23/09/17.
//  Copyright © 2017 Shagun Verma. All rights reserved.
//

#import "UserSelectViewController.h"
#import "Constant.h"



@interface UserSelectViewController ()

@end

@implementation UserSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnUserType_tapped:(id)sender {

    UIButton * bt = sender;
    
    if (bt.tag == TAG_USERTYPE_CONSULTING){
        LoginViewController* vc ;
        vc = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:true];
        
    }
    else if (bt.tag == TAG_USERTYPE_AWARENESS)
    {
        LoginViewController* vc ;
        vc = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:true];

    }


}

@end
