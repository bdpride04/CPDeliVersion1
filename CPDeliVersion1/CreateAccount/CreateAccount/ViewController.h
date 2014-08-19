//
//  ViewController.h
//  CreateAccount
//
//  Created by Emil Khan on 8/12/14.
//  Copyright (c) 2014 emil khan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSURLConnectionDelegate,NSXMLParserDelegate>

@property (strong, nonatomic) IBOutlet UILabel *displayDat;


@property (strong, nonatomic) IBOutlet UITextField *firstNameText;
@property (strong, nonatomic) IBOutlet UITextField *lastNameText;
@property (strong, nonatomic) IBOutlet UITextField *emailText;
@property (strong, nonatomic) IBOutlet UITextField *streetText;
@property (strong, nonatomic) IBOutlet UITextField *cityText;
@property (strong, nonatomic) IBOutlet UITextField *stateText;
@property (strong, nonatomic) IBOutlet UITextField *zipText;
@property (strong, nonatomic) IBOutlet UITextField *phoneNumberText;
@property (strong, nonatomic) IBOutlet UITextField *passwordText;

@property (nonatomic, strong) NSURLConnection *theConnection;


- (IBAction)submitClicked:(id)sender;

- (IBAction)backgroundClicked:(id)sender;

@end
