//
//  signInPage.h
//  CreateAccount
//
//  Created by Emil Khan on 8/15/14.
//  Copyright (c) 2014 emil khan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface signInPage : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *emailText;
@property (strong, nonatomic) IBOutlet UITextField *passwordText;

@property (nonatomic, strong) NSURLConnection *theConnection;

- (IBAction)signInClicked:(id)sender;

@end
