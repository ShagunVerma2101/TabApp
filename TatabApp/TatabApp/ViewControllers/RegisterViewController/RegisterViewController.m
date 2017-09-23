//
//  RegisterViewController.m
//  TatabApp
//
//  Created by Shagun Verma on 23/09/17.
//  Copyright © 2017 Shagun Verma. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrlView;
@property (weak, nonatomic) IBOutlet CustomTextField *txtName;
@property (weak, nonatomic) IBOutlet CustomTextField *txtEmail;
@property (weak, nonatomic) IBOutlet CustomTextField *txtPassword;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _txtName.leftImgView.image = [UIImage imageNamed:@"iconName"];
    _txtPassword.leftImgView.image = [UIImage imageNamed:@"iconPassword"];
    _txtEmail.leftImgView.image = [UIImage imageNamed:@"iconEmail"];
    [CommonFunction setViewBackground:self.scrlView withImage:[UIImage imageNamed:@"BackgroundGeneral"]];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnBackClicked:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}
- (IBAction)btnContinueClicked:(id)sender {

    RegisterCompleteViewController* vc;
    vc = [[RegisterCompleteViewController alloc] initWithNibName:@"RegisterCompleteViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:true];
    
    
}
- (IBAction)btnTermsAndConditions:(id)sender {

}


@end
