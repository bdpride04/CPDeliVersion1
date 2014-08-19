//
//  ViewController.m
//  CreateAccount
//
//  Created by Emil Khan on 8/12/14.
//  Copyright (c) 2014 emil khan. All rights reserved.
//

#import "ViewController.h"
#define createAccountURL @"http://71.238.152.208:1986/CPDeliWebService.asmx/CreateAccount"

@interface ViewController ()

@end

@implementation ViewController
{
    NSMutableData *responseData;
    NSMutableString *currentElement;
    NSMutableString *finalResponse;
    
    
}

@synthesize firstNameText, lastNameText, emailText, streetText, cityText, stateText, zipText, phoneNumberText, passwordText, displayDat, theConnection;

- (IBAction)backgroundClicked:(id)sender
{
    // to dismiss keyboard
    [firstNameText resignFirstResponder];
    [lastNameText resignFirstResponder];
    [emailText resignFirstResponder];
    [streetText resignFirstResponder];
    [cityText resignFirstResponder];
    [stateText resignFirstResponder];
    [zipText resignFirstResponder];
    [phoneNumberText resignFirstResponder];
    [passwordText resignFirstResponder];
}

- (IBAction)submitClicked:(id)sender
{
    
    
    //web service address and function
    NSString *urlString = createAccountURL;
    
    //convert string to url data type
    NSURL *url = [NSURL URLWithString:urlString];
    
    //make the request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    //set request type: "POST"
    [request setHTTPMethod: @"POST"];
    
    
    //here we want the key jsonCustomerInfo
    NSString *myRequestString1 = @"FirstName"; // Attention HERE!!!!
    
    //here we want the key jsonCartItems
    NSString *myRequestString2 = @"LastName"; // Attention HERE!!!!
    
    //here we want the key jsonCustomerInfo
    NSString *myRequestString3 = @"EMail"; // Attention HERE!!!!
    
    //here we want the key jsonCartItems
    NSString *myRequestString4 = @"Street"; // Attention HERE!!!!
    
    //here we want the key jsonCustomerInfo
    NSString *myRequestString5 = @"City"; // Attention HERE!!!!
    
    //here we want the key jsonCartItems
    NSString *myRequestString6 = @"State"; // Attention HERE!!!!
    
    //here we want the key jsonCustomerInfo
    NSString *myRequestString7 = @"Zip"; // Attention HERE!!!!
    
    //here we want the key jsonCartItems
    NSString *myRequestString8 = @"PhoneNumber"; // Attention HERE!!!!
    
    //here we want the key jsonCustomerInfo
    NSString *myRequestString9 = @"Password"; // Attention HERE!!!!
    

    
    //and three more parameters
    
    NSString *myParamString1 = self.firstNameText.text;
    NSString *myParamString2 = self.lastNameText.text;
    NSString *myParamString3 = self.emailText.text;
    NSString *myParamString4 = self.streetText.text;
    NSString *myParamString5 = self.cityText.text;
    NSString *myParamString6 = self.stateText.text;
    NSString *myParamString7 = self.zipText.text;
    NSString *myParamString8 = self.phoneNumberText.text;
    NSString *myParamString9 = self.passwordText.text;
   
    
    
    NSString *reqStringFUll=[NSString stringWithFormat:@"%@=%@&%@=%@&%@=%@&%@=%@&%@=%@&%@=%@&%@=%@&%@=%@&%@=%@",myRequestString1,myParamString1,myRequestString2,myParamString2,myRequestString3,myParamString3,myRequestString4,myParamString4,myRequestString5,myParamString5,myRequestString6,myParamString6,myRequestString7,myParamString7,myRequestString8,myParamString8,myRequestString9,myParamString9];
    
    NSData *requestData = [NSData dataWithBytes:[reqStringFUll UTF8String] length:[reqStringFUll length]];
    
    [request setHTTPBody:requestData];
    
    theConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    

}

//if gets messed up delete from below

#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection
didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    responseData = [[NSMutableData alloc] init];
    NSLog(@"Here I am");
    
}

- (void)connection:(NSURLConnection *)connection
    didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    
    NSXMLParser *parser=[[NSXMLParser alloc] initWithData:responseData];
    [parser setDelegate:self];
    [parser parse];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
    NSLog(@"Error : %@",[error localizedDescription]);
}


/////////////////////////////////////////////////////////

- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    NSLog(@"Parser start");
}
- (void) parser: (NSXMLParser *) parser
didStartElement: (NSString *) elementName
   namespaceURI: (NSString *) namespaceURI
  qualifiedName: (NSString *) qName
     attributes: (NSDictionary *) attributeDict
{
    if ([elementName isEqualToString:@"string"])
    {
        currentElement = [[NSMutableString alloc] init];
        return;
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    [currentElement appendString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if([elementName isEqualToString:@"string"])
    {
        return;
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    finalResponse = currentElement;
    displayDat.text = finalResponse;
}

/********************************/

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

@end
