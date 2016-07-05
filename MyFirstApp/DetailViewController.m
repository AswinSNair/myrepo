//
//  DetailViewController.m
//  MyFirstApp
//
//  Created by qburst on 01/07/16.
//  Copyright © 2016 qburst. All rights reserved.
//


#import "DetailViewController.h"
#import "WebPageViewController.h"
#import "MapViewController.h"
                                  
@interface DetailViewController ()
                                  
@end
                                  
@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
                                      
    self.detailNameLabel.text = self.personalInfo.name;
    self.detailEmailLabel.text = self.personalInfo.email;
    self.detailPhonenoLabel.text = self.personalInfo.phoneno;
    self.detailWebsiteLabel.text = self.personalInfo.website;
    self.detailImageView.image = [UIImage imageWithData:self.personalInfo.imageData];
    self.detailLattitudeLabel.text = self.personalInfo.lattitude;
    self.detailLongitudeLabel.text = self.personalInfo.longitude;
                                      
    // Do any additional setup after loading the view.
}
                                  
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Message Composer

- (IBAction)messageButton:(id)sender
{
    if(![MFMessageComposeViewController canSendText])
    {
        [self showAlertMessageWithTitle:@"Error" andmessage:@"Your device doesn't support SMS!"];
        return;
    }
    NSArray *messageReceipient = @[self.personalInfo.phoneno];
    NSArray *recipents = messageReceipient;
    NSString *message = [NSString stringWithFormat:@" Testing message composer "];
    
    MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
    messageController.messageComposeDelegate = self;
    [messageController setRecipients:recipents];
    [messageController setBody:message];
    
    [self presentViewController:messageController animated:YES completion:nil];

}

- (void) messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result anderror:(NSError *)error
{
    switch (result)
    {
        case MessageComposeResultCancelled:
            NSLog(@"Message cancelled");
            break;
        case MessageComposeResultSent:
            NSLog(@"Message sent");
            break;
        case MessageComposeResultFailed:
            NSLog(@"Message sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

// Mail Composer

- (IBAction)mailComposerButton:(id)sender
{
    if(![MFMailComposeViewController canSendMail])
    {
        [self showAlertMessageWithTitle:@"Error" andmessage:@"Mail Composer Not Supported"];
        return;
    }
    NSString *emailTitle = @"Test Email";
    
    NSString *messageBody = @"Testing message composer";
    NSArray *toRecipents = @[self.personalInfo.email];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    [self presentViewController:mc animated:YES completion:NULL];
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }

    [self dismissViewControllerAnimated:YES completion:NULL];
}

// Call composer

- (IBAction)callButton:(id)sender
{
    NSString *phoneNo = self.personalInfo.phoneno;
    NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",phoneNo]];
    
    if ([[UIApplication sharedApplication] canOpenURL:phoneUrl])
    {
        [[UIApplication sharedApplication] openURL:phoneUrl];
    }
    else
    {
        [self showAlertMessageWithTitle:@"Error" andmessage:@"Calling not allowed"];
    }
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier]isEqualToString:@"WebPageSegue"])
    {

        WebPageViewController *webpage =[segue destinationViewController];
        
        webpage.website = self.personalInfo.website;
    }
    
    if([[segue identifier] isEqualToString:@"MapViewSegue"])
    {
        MapViewController *coordinates = [segue destinationViewController];
        coordinates.lattitude = self.personalInfo.lattitude;
        coordinates.longitude = self.personalInfo.longitude;
    }
}

- (void) showAlertMessageWithTitle:(NSString *)title andmessage:(NSString *)message
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
