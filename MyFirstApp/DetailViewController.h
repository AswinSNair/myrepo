//
//  DetailViewController.h
//  MyFirstApp
//
//  Created by qburst on 01/07/16.
//  Copyright © 2016 qburst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "PersonalInfo.h"
@interface DetailViewController : UIViewController<MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *detailNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailEmailLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailPhonenoLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailWebsiteLabel;
@property (weak, nonatomic) IBOutlet UIImageView *detailImageView;
@property (weak, nonatomic) IBOutlet UILabel *detailLongitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLattitudeLabel;
- (IBAction)messageButton:(id)sender;

- (IBAction)mailComposerButton:(id)sender;
- (IBAction)callButton:(id)sender;

@property (strong, nonatomic) PersonalInfo *personalInfo;

@end