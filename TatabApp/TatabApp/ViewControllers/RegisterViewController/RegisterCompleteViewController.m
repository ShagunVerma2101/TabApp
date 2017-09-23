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

@end

@implementation RegisterCompleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _txtBirthday.leftImgView.image = [UIImage imageNamed:@"iconName"];
    _txtCity.leftImgView.image = [UIImage imageNamed:@"iconName"];

    [CommonFunction setViewBackground:self.scrlView withImage:[UIImage imageNamed:@"BackgroundGeneral"]];
    
    
    [_tblView registerNib:[UINib nibWithNibName:@"DependantDetailTableViewCell" bundle:nil]forCellReuseIdentifier:@"DependantDetailTableViewCell"];
    _tblView.rowHeight = UITableViewAutomaticDimension;
    _tblView.estimatedRowHeight = 35;
    _tblView.backgroundColor = [UIColor clearColor];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnBackClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:true];
}
- (IBAction)btnCompleteRegistrationClicked:(id)sender {
}
- (IBAction)btnTermsClicked:(id)sender {
}
- (IBAction)btnAddDependentsClciked:(id)sender {
}


#pragma mark- tableView delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    DependantDetailTableViewCell *cell = [_tblView dequeueReusableCellWithIdentifier:@"DependantDetailTableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
   
    if (indexPath.row == 0){
        cell.contentView.backgroundColor = [UIColor blueColor];
        [cell.lblName setText:@"Name"];
        [cell.lblGender setText:@"Gender"];
        [cell.lblBirthday setText:@"Birthday"];
    }
    
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
        
    }
   
        
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}



@end
