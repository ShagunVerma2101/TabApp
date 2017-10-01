//
//  RegisterCompleteViewController.m
//  TatabApp
//
//  Created by Shagun Verma on 23/09/17.
//  Copyright © 2017 Shagun Verma. All rights reserved.
//

#import "RegisterCompleteViewController.h"

@interface RegisterCompleteViewController ()
@property (weak, nonatomic) IBOutlet CustomTextField *txtBirthday;
@property (weak, nonatomic) IBOutlet CustomTextField *txtCity;
@property (weak, nonatomic) IBOutlet UIScrollView *scrlView;
@property (weak, nonatomic) IBOutlet UITableView *tblView;
@property (strong, nonatomic) IBOutlet UIView *popUpView;
@property (weak, nonatomic) IBOutlet CustomTextField *txtName;
@property (weak, nonatomic) IBOutlet CustomTextField *txt_BirthDate;
@property (weak, nonatomic) IBOutlet UIButton *btnFemale;
@property (weak, nonatomic) IBOutlet UIButton *btnMAle;


@end

@implementation RegisterCompleteViewController{
    BOOL isMale;
    UIView *viewOverPicker;
    UIDatePicker* pickerForDate;
     UIToolbar *toolBar;
    NSDate *departDate;
    NSString *departDateString;
    NSMutableArray *dependencyArray;
    LoderView *loderObj;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [CommonFunction setResignTapGestureToView:self.view andsender:self];
    isMale = true;
    dependencyArray = [NSMutableArray new];
    _txtBirthday.leftImgView.image = [UIImage imageNamed:@"iconName"];
    _txtCity.leftImgView.image = [UIImage imageNamed:@"iconName"];
    _txtName.leftImgView.image = [UIImage imageNamed:@"iconName"];
    _txt_BirthDate.leftImgView.image = [UIImage imageNamed:@"iconName"];
    [CommonFunction setViewBackground:self.scrlView withImage:[UIImage imageNamed:@"BackgroundGeneral"]];
    [_tblView registerNib:[UINib nibWithNibName:@"DependantDetailTableViewCell" bundle:nil]forCellReuseIdentifier:@"DependantDetailTableViewCell"];
    _tblView.rowHeight = UITableViewAutomaticDimension;
    _tblView.estimatedRowHeight = 35;
    _tblView.backgroundColor = [UIColor clearColor];
    
     _btnFemale.tintColor = [CommonFunction colorWithHexString:COLORCODE_FOR_TEXTFIELD];
    _btnMAle.layer.cornerRadius = 22;
    _btnFemale.layer.cornerRadius = 22;
    _btnMAle.layer.borderWidth = 3;
    _btnFemale.layer.borderWidth = 3;
    _btnFemale.layer.borderColor =[[CommonFunction colorWithHexString:COLORCODE_FOR_TEXTFIELD] CGColor];
    _btnMAle.layer.borderColor =[[CommonFunction colorWithHexString:COLORCODE_FOR_TEXTFIELD] CGColor];
    
    _btnMAle.backgroundColor = [CommonFunction colorWithHexString:COLORCODE_FOR_TEXTFIELD];
    _btnMAle.tintColor = [UIColor whiteColor];

    departDate = [NSDate date];
       // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)resignResponder{
    [CommonFunction resignFirstResponderOfAView:self.view];
}

#pragma mark- tableView delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (dependencyArray.count>0) {
     return dependencyArray.count+1;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    DependantDetailTableViewCell *cell = [_tblView dequeueReusableCellWithIdentifier:@"DependantDetailTableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
   
   
        
    
    
    if((indexPath.row-1)%2 == 0){
        cell.contentView.backgroundColor = [UIColor whiteColor];
    }
    else
    {
        cell.contentView.backgroundColor = [UIColor lightGrayColor];
    }
    
    if (indexPath.row == 0){
        cell.contentView.backgroundColor = [UIColor blueColor];
        cell.lblBirthday.textColor = [UIColor whiteColor];
        cell.lblGender.textColor = [UIColor whiteColor];
        cell.lblName.textColor = [UIColor whiteColor];
        cell.lblSerialNumber.textColor = [UIColor whiteColor];
        cell.lblSerialNumber.text = @"Sn.";
        [cell.lblName setText:@"Name"];
        [cell.lblGender setText:@"Gender"];
        [cell.lblBirthday setText:@"Birthday"];
        
    }
    else{
         RegistrationDpendency *obj = [dependencyArray objectAtIndex:indexPath.row-1];
        cell.lblSerialNumber.text = [NSString stringWithFormat:@"%d",(int)indexPath.row];
        cell.contentView.backgroundColor = [UIColor blueColor];
        [cell.lblName setText:obj.name];
        if (obj.isMale) {
            [cell.lblGender setText:@"Male"];
        }
        else{
            [cell.lblGender setText:@"Female"];
        }
        [cell.lblBirthday setText:obj.birthDay];
    }
   
        
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}


// value change of the date picker
-(void) dueDateChanged:(UIDatePicker *)sender {
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    //self.myLabel.text = [dateFormatter stringFromDate:[dueDatePickerView date]];
    NSLog(@"Picked the date %@", [dateFormatter stringFromDate:[sender date]]);
    [dateFormatter setDateFormat:@"dd-MMM-YYYY"];
    departDateString = [dateFormatter stringFromDate:[sender date]];
    departDate = sender.date;
    if (sender.tag == 0){
       
        _txtBirthday.text = departDateString;
    }else if (sender.tag == 1){
        _txt_BirthDate.text = departDateString;
    }
    
}

-(void)doneForPicker:(id)sender
{
    [viewOverPicker removeFromSuperview];
    
}

#pragma mark- Btn Actions
- (IBAction)btnActionConfirmAdd:(id)sender {
    NSDictionary *dictForValidation = [self validateData];
    
    if (![[dictForValidation valueForKey:BoolValueKey] isEqualToString:@"0"]){
        [_popUpView removeFromSuperview];
        
        RegistrationDpendency *dependencyObj = [RegistrationDpendency new];
        dependencyObj.name = [CommonFunction trimString:_txtName.text];
        dependencyObj.birthDay = _txt_BirthDate.text;
        dependencyObj.isMale = isMale;
        [dependencyArray addObject:dependencyObj];
        [_tblView reloadData];

    }
    else{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert" message:[dictForValidation valueForKey:AlertKey] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
    
  
    
}



- (IBAction)btnActionBirthDay:(id)sender {
    
    
       pickerForDate = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - 150, self.view.frame.size.width, 150)];
    pickerForDate.datePickerMode = UIDatePickerModeDate;
    pickerForDate.tag = ((UIButton *)sender).tag;
    
        [pickerForDate setDate:departDate];
    [pickerForDate setMaximumDate: [NSDate date]];
    
 
   
    [pickerForDate addTarget:self action:@selector(dueDateChanged:)
            forControlEvents:UIControlEventValueChanged];
    viewOverPicker = [[UIView alloc]initWithFrame:self.view.frame];
    pickerForDate.backgroundColor = [UIColor lightGrayColor];
    viewOverPicker.backgroundColor = [UIColor clearColor];
    [CommonFunction setResignTapGestureToView:viewOverPicker andsender:self];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Done" style:UIBarButtonItemStyleDone
                                   target:self action:@selector(doneForPicker:)];
    doneButton.tintColor = [CommonFunction colorWithHexString:@"f7a41e"];
    UIBarButtonItem *space = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    toolBar = [[UIToolbar alloc]initWithFrame:
               CGRectMake(0, self.view.frame.size.height-
                          pickerForDate.frame.size.height-50, self.view.frame.size.width, 50)];
    //    [toolBar setBarTintColor:[UIColor redColor]];
    UIBarButtonItem *doneButton2 = [[UIBarButtonItem alloc]
                                    initWithTitle:@"" style:UIBarButtonItemStyleDone
                                    target:nil action:nil];
    //    doneButton2.tintColor = [CommonFunction colorWithHexString:@"f7a41e"];
    NSDictionary *barButtonAppearanceDict = @{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Light" size:14.0], NSForegroundColorAttributeName: [CommonFunction colorWithHexString:@"f7a41e"]};
    [doneButton2 setTitleTextAttributes:barButtonAppearanceDict forState:UIControlStateNormal];
    [toolBar setBarStyle:UIBarStyleBlackOpaque];
    NSArray *toolbarItems = [NSArray arrayWithObjects:space,doneButton2,
                             space,doneButton, nil];
    [toolBar setItems:toolbarItems];
    [viewOverPicker addSubview:pickerForDate];
    [viewOverPicker addSubview:toolBar];
    [self.view addSubview:viewOverPicker];
}


- (IBAction)btnActionGender:(id)sender {
    if (((UIButton *)sender).tag == 10) {
        isMale = true;
        _btnMAle.backgroundColor = [CommonFunction colorWithHexString:COLORCODE_FOR_TEXTFIELD];
        _btnMAle.tintColor = [UIColor whiteColor];
        _btnFemale.backgroundColor = [UIColor whiteColor];
        _btnFemale.tintColor = [CommonFunction colorWithHexString:COLORCODE_FOR_TEXTFIELD];

    }else{
        isMale = false;
        _btnFemale.backgroundColor = [CommonFunction colorWithHexString:COLORCODE_FOR_TEXTFIELD];
        _btnFemale.tintColor = [UIColor whiteColor];
        _btnMAle.backgroundColor = [UIColor whiteColor];
        _btnMAle.tintColor = [CommonFunction colorWithHexString:COLORCODE_FOR_TEXTFIELD];
    }
}




- (IBAction)btnBackClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)btnCompleteRegistrationClicked:(id)sender {
    NSDictionary *dictForValidation = [self validateData2];
    
    if (![[dictForValidation valueForKey:BoolValueKey] isEqualToString:@"0"]){
        
        [self hitApi];
    }
    else{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert" message:[dictForValidation valueForKey:AlertKey] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        [self presentViewController:alertController animated:YES completion:nil];
    }

    
}

- (IBAction)btnTermsClicked:(id)sender {
}

- (IBAction)btnAddDependentsClciked:(id)sender {
    [[self popUpView] setAutoresizesSubviews:true];
    [[self popUpView] setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) ;
    frame.origin.y = 0.0f;
    self.popUpView.center = CGPointMake(self.view.center.x, self.view.center.y);
    [[self popUpView] setFrame:frame];
    
    [self.view addSubview:_popUpView];
}

-(NSDictionary *)validateData{
    NSMutableDictionary *validationDict = [[NSMutableDictionary alloc] init];
    [validationDict setValue:@"1" forKey:BoolValueKey];
    if (![CommonFunction validateName:_txtName.text]){
        [validationDict setValue:@"0" forKey:BoolValueKey];
        if ([CommonFunction trimString:_txtName.text].length == 0){
            [validationDict setValue:@"We need a First Name" forKey:AlertKey];
        }else{
            [validationDict setValue:@"Oops! It seems that this is not a valid First Name." forKey:AlertKey];
        }
        
    }
    else if(_txt_BirthDate.text.length == 0){
        [validationDict setValue:@"0" forKey:BoolValueKey];
        [validationDict setValue:@"We need a birth date" forKey:AlertKey];
    }
    return validationDict.mutableCopy;
    
}
-(NSDictionary *)validateData2{
    NSMutableDictionary *validationDict = [[NSMutableDictionary alloc] init];
    [validationDict setValue:@"1" forKey:BoolValueKey];
    if(_txtBirthday.text.length == 0){
        [validationDict setValue:@"0" forKey:BoolValueKey];
        [validationDict setValue:@"We need a birth date" forKey:AlertKey];
    }
    else if(_txtCity.text.length == 0){
        [validationDict setValue:@"0" forKey:BoolValueKey];
        [validationDict setValue:@"We need a city" forKey:AlertKey];
    }
    return validationDict.mutableCopy;
    
}

-(void)hitApi{
    NSMutableDictionary *parameterDict = [[NSMutableDictionary alloc]init];
    [parameterDict setValue:[CommonFunction trimString:@"123"] forKey:@"country_code"];
    [parameterDict setValue:[CommonFunction trimString:@"1234567890"] forKey:@"contact_number"];
    [parameterDict setValue:[CommonFunction trimString:_firstNameString] forKey:@"username"];
    [parameterDict setValue:[CommonFunction trimString:_emailString] forKey:@"email"];
    [parameterDict setValue:[CommonFunction trimString:_firstNameString] forKey:@"first_name"];
    [parameterDict setValue:[CommonFunction trimString:_firstNameString] forKey:@"last_name"];
    
    [parameterDict setValue:[CommonFunction trimString:@"Male"] forKey:@"gender"];
    [parameterDict setValue:[CommonFunction trimString:@"Doctor"] forKey:@"user_type"];
    [parameterDict setValue:[CommonFunction trimString:_passwordString] forKey:@"password"];
    [parameterDict setValue:[CommonFunction trimString:_txtBirthday.text] forKey:@"date_of_birth"];
    [parameterDict setValue:[CommonFunction trimString:_passwordString] forKey:@"confirm_password"];
    

 
    if ([ CommonFunction reachability]) {
        [self addLoder];
        
        //            loaderView = [CommonFunction loaderViewWithTitle:@"Please wait..."];
        [WebServicesCall responseWithUrl:[NSString stringWithFormat:@"%@%@",API_BASE_URL,API_REGISTER_USER_URL]  postResponse:[parameterDict mutableCopy] postImage:nil requestType:POST tag:nil isRequiredAuthentication:NO header:NPHeaderName completetion:^(BOOL status, id responseObj, NSString *tag, NSError * error, NSInteger statusCode, id operation, BOOL deactivated) {
            if (error == nil) {
                
                    
               
                    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Register Successfully." preferredStyle:UIAlertControllerStyleAlert];
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
#pragma mark - hit api

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
@end
