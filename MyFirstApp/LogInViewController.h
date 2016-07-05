//
//  LogInViewController.h
//  MyFirstApp
//
//  Created by qburst on 28/06/16.
//  Copyright © 2016 qburst. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LogInViewControllerDelegate;


@interface LogInViewController : UIViewController<UIAlertViewDelegate>{

}

@property (weak, nonatomic) IBOutlet UITextField *userField;
@property (weak, nonatomic) IBOutlet UITextField *userPasswordField;
- (IBAction)loginButton:(id)sender;

@property(nonatomic,strong) id<LogInViewControllerDelegate> delegate;

@end

@protocol LogInViewControllerDelegate <NSObject>
//- (void)logInViewController:(LogInViewController *)logInViewController didEnterLogInInfo:(LogInInfo *)logInInfo;
@end