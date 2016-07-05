//
//  LogInViewController.m
//  MyFirstApp
//
//  Created by qburst on 28/06/16.
//  Copyright © 2016 qburst. All rights reserved.
//

#import "LogInViewController.h"

@interface LogInViewController ()

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        

    // Do any additional setup after loading the view.-
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginButton:(id)sender {
    
    /*if (_userField.text.length == 0){
        
        UIAlertView *error = [[UIAlertView alloc]initWithTitle:@"Error"message:@"You must complete all field"delegate:self cancelButtonTitle:@"OK"otherButtonTitles:Nil];
        
        [error show];
        
        return;
        
    }
    
    if(_userPasswordField.text.length== 0){
        
        UIAlertView *error = [[UIAlertView alloc]initWithTitle:@"Error"message:@"You must complete all field"delegate:self cancelButtonTitle:@"OK"otherButtonTitles:Nil];
        
        [error show];
        
        return;
        
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(logInViewController:didEnterPersonalInfo:)]){
        
        LogInInfo *logInInfo = [[LogInInfo alloc]init];
        
        logInInfo.username = self.userField.text;
        
        logInInfo.password = self.userPasswordField.text;
        
        
        [self.delegate logInViewController:self didEnterLogInInfo:logInInfo];
        
        [self.navigationController popViewControllerAnimated:YES ];
    }*/
}
@end
