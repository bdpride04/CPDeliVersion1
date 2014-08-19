//
//  signInPage.m
//  CreateAccount
//
//  Created by Emil Khan on 8/15/14.
//  Copyright (c) 2014 emil khan. All rights reserved.
//

#import "signInPage.h"
#define AuthenticateUser @"http://71.238.152.208:1986/CPDeliWebService.asmx/AuthenticateUser"

@interface signInPage ()

@end

@implementation signInPage
{
    NSMutableData *responseData;
    NSMutableString *currentElement;
    NSMutableString *finalResponse;
}
@synthesize emailText, passwordText, theConnection;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)signInClicked:(id)sender
{
    //web service address and function
    NSString *urlString = AuthenticateUser;
    
    //convert string to url data type
    NSURL *url = [NSURL URLWithString:urlString];
    
    //make the request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    //set request type: "POST"
    [request setHTTPMethod: @"GET"];
}
@end
