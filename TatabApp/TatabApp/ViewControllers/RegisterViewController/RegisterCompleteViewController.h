//
//  RegisterCompleteViewController.h
//  TatabApp
//
//  Created by Shagun Verma on 23/09/17.
//  Copyright © 2017 Shagun Verma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterCompleteViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic,strong)NSString *firstNameString;
@property(nonatomic,strong)NSString *emailString;
@property(nonatomic,strong)NSString *passwordString;
@end
