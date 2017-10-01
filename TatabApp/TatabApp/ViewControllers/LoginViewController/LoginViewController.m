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

@implementation LoginViewController{

    LoderView *loderObj;
}

- (void)viewDidLoad {
    [super viewDidLoad];
      [CommonFunction setResignTapGestureToView:self.view andsender:self];
    _txtUsername.leftImgView.image = [UIImage imageNamed:@"iconUsername"];
    _txtPassword.leftImgView.image = [UIImage imageNamed:@"iconPassword"];
    _txtPassword.text = @"Admin@123";
    _txtUsername.text = @"shgupta09@gmail.com";
    // Do any additional setup after loading the view from its nib.

}

-(void) viewDidLayoutSubviews {
        [CommonFunction setViewBackground:self.scrlView withImage:[UIImage imageNamed:@"BackgroundGeneral"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)resignResponder{
    [CommonFunction resignFirstResponderOfAView:self.view];
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
- (IBAction)btnAction_Login:(id)sender {
    [self hitApiForLogin];
}


-(void)hitApiForLogin{

    NSDictionary *dictForValidation = [self validateData];
    
    if (![[dictForValidation valueForKey:BoolValueKey] isEqualToString:@"0"]){
        
        NSMutableDictionary *parameterDict = [[NSMutableDictionary alloc]init];
        [parameterDict setValue:[CommonFunction trimString:_txtUsername.text] forKey:loginUsername];
        [parameterDict setValue:_txtPassword.text forKey:loginPassword];
        
        if ([ CommonFunction reachability]) {
            [self addLoder];
            
            //            loaderView = [CommonFunction loaderViewWithTitle:@"Please wait..."];
            [WebServicesCall responseWithUrl:[NSString stringWithFormat:@"%@%@",API_BASE_URL,API_LOGIN_URL]  postResponse:[parameterDict mutableCopy] postImage:nil requestType:POST tag:nil isRequiredAuthentication:NO header:NPHeaderName completetion:^(BOOL status, id responseObj, NSString *tag, NSError * error, NSInteger statusCode, id operation, BOOL deactivated) {
                if (error == nil) {
                    
                    
                    
                    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Login Successfully." preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                    [alertController addAction:ok];
                    [self presentViewController:alertController animated:YES completion:nil];
                    [self removeloder];
                    
                }
                
                  
                
            }];
        } else {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Network Error" message:@"No Network Access" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:ok];
            [self presentViewController:alertController animated:YES completion:nil];
        }
    }
    else{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert" message:[dictForValidation valueForKey:AlertKey] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        [self presentViewController:alertController animated:YES completion:nil];
    }

}

#pragma mark - TextField Delegate

//! for change the current first responder
//! @param: TextField
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    UIResponder *nextResponder = [self.view viewWithTag:textField.tag+1];
    if(nextResponder){
        [nextResponder becomeFirstResponder];   //next responder found
    } else {
        [CommonFunction resignFirstResponderOfAView:self.view];
    }
    return NO;
}

#pragma mark - add loder

-(void)addLoder{
    self.view.userInteractionEnabled = NO;
    //  loaderView = [CommonFunction loaderViewWithTitle:@"Please wait..."];
    loderObj = [[LoderView alloc] initWithFrame:self.view.frame];
    loderObj.lbl_title.text = @"Logging In...";
    [self.view addSubview:loderObj];
}

-(void)removeloder{
    //loderObj = nil;
    [loderObj removeFromSuperview];
    //[loaderView removeFromSuperview];
    self.view.userInteractionEnabled = YES;
}
-(NSDictionary *)validateData{
    NSMutableDictionary *validationDict = [[NSMutableDictionary alloc] init];
    [validationDict setValue:@"1" forKey:BoolValueKey];
    if (![CommonFunction validateEmailWithString:[CommonFunction trimString:_txtUsername.text]]){
        [validationDict setValue:@"0" forKey:BoolValueKey];
        if ([CommonFunction trimString:_txtUsername.text].length == 0){
            [validationDict setValue:@"We need an Email ID" forKey:AlertKey];
        }else{
            [validationDict setValue:@"Oops! It seems that this is not a valid Email ID." forKey:AlertKey];
        }
    }
    else if([CommonFunction trimString:_txtPassword.text].length == 0){
        [validationDict setValue:@"0" forKey:BoolValueKey];
        [validationDict setValue:@"We need a Password" forKey:AlertKey];
    }
    return validationDict.mutableCopy;
}



@end
