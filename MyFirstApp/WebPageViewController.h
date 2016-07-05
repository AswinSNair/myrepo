//
//  WebPageViewController.h
//  MyFirstApp
//
//  Created by qburst on 04/07/16.
//  Copyright © 2016 qburst. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebPageViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIWebView *webPage;

- (IBAction)cancelButton:(id)sender;

@property (strong, nonatomic) NSString *website;

@end
