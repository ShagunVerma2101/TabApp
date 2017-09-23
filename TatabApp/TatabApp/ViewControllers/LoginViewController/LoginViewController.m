//
//  LoginViewController.m
//  TatabApp
//
//  Created by Shagun Verma on 20/09/17.
//  Copyright © 2017 Shagun Verma. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet CustomTextField *txtUsername;
@property (weak, nonatomic) IBOutlet CustomTextField *txtPassword;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    _txtUsername.leftImgView.image = [UIImage imageNamed:@"iconUsername"];
    _txtPassword.leftImgView.image = [UIImage imageNamed:@"iconPassword"];
    
    // Do any additional setup after loading the view from its nib.

}

-(void) viewDidLayoutSubviews {
        [CommonFunction setViewBackground:self.scrlView withImage:[UIImage imageNamed:@"BackgroundGeneral"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnBackClicked:(id)sender {

    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)btnRegisterClicked:(id)sender {

    
    RegisterViewController* vc ;
    vc = [[RegisterViewController alloc ] initWithNibName:@"RegisterViewController" bundle:nil];
    UINavigationController* navVC = [[UINavigationController alloc] initWithRootViewController:vc];

    vc.navigationController.navigationBarHidden = true;
    
    [self presentViewController:navVC animated:true completion:nil];
    
}

@end
