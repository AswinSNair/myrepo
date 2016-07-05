//
//  WebPageViewController.m
//  MyFirstApp
//
//  Created by qburst on 04/07/16.
//  Copyright © 2016 qburst. All rights reserved.
//

#import "WebPageViewController.h"

@interface WebPageViewController ()


@end

@implementation WebPageViewController
@synthesize website;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *urlNameInString = self.website;
    NSURL *url = [NSURL URLWithString:urlNameInString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    [self.webPage loadRequest:urlRequest];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelButton:(id)sender
{
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}
@end
