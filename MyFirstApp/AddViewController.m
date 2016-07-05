//
//  AddViewController.m
//  MyFirstApp
//
//  Created by qburst on 27/06/16.
//  Copyright © 2016 qburst. All rights reserved.
//

#import "AddViewController.h"
@import UIKit;
@interface AddViewController ()

@end

@implementation AddViewController
@synthesize imageView,imagepicker;
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.nameTextField.text = self.personalInfo.name;
    self.emailTextField.text = self.personalInfo.email;
    self.phonenoTextField.text = self.personalInfo.phoneno;
    self.websiteTextField.text = self.personalInfo.website;
    self.imageView.image = [UIImage imageWithData:self.personalInfo.imageData];
    self.lattitudeTextField.text = self.personalInfo.lattitude;
    self.longitudeTextField.text = self.personalInfo.longitude;
    
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
    
}

- (IBAction)doneButtonClicked:(id)sender {
    
    if((_nameTextField.text.length == 0 ) && (_emailTextField.text.length== 0)&&(_phonenoTextField.text.length == 0)&&(_websiteTextField.text.length == 0))
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                       message:@"You must complete all field"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        
        return;
    }
    
    if(imageView.image == nil)
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                       message:@"You must enter an image"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        
        return;
    }
    
    BOOL isEmailValid = [self validateEmailWithString:self.emailTextField.text];
    
    if(!isEmailValid)
    {
        [self showAlertWithTitle:@"Error"andMessage:@"Email Not Valid"];
        return;
    }
    
    if(![self validateUrl:self.websiteTextField.text])
    {
        [self showAlertWithTitle:@"Error" andMessage:@"Website Not Valid"];
        return;
    }
    
    if(!([self validateLattitude:self.lattitudeTextField.text] && [self validateLongitude:self.longitudeTextField.text]))
    {
        return;
    }
    
    PersonalInfo *personalInfo = [[PersonalInfo alloc]init];
    
    personalInfo.name = self.nameTextField.text;
    
    
    personalInfo.email = self.emailTextField.text;
    
    personalInfo.website = self.websiteTextField.text;
    
    personalInfo.phoneno = self.phonenoTextField.text;
    
    personalInfo.imageData = UIImagePNGRepresentation(imageView.image);
    
    personalInfo.lattitude = self.lattitudeTextField.text;
    
    personalInfo.longitude = self.longitudeTextField.text;
    
    if (self.didEdit == YES)
    {
        [self.delegate addViewController:self didEditedPersonalInfo:personalInfo atIndex:self.indexPath.row];
    } 
    
    else
    {
        
        [self.delegate addViewController:self didAddedNewPersonalInfo:personalInfo];
    }
     [self.navigationController popViewControllerAnimated:YES ];
}

- (IBAction)showActionSheet:(id)sender {
    
    
    UIAlertController* alert = [UIAlertController
                                alertControllerWithTitle:nil
                                message:nil
                                preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* button0 = [UIAlertAction
                              actionWithTitle:@"Cancel"
                              style:UIAlertActionStyleCancel
                              handler:^(UIAlertAction * action)
                              {
                                  
                              }];
    
    UIAlertAction* button1 = [UIAlertAction
                              actionWithTitle:@"camera"
                              style:UIAlertActionStyleDefault
                              handler:^(UIAlertAction * action)
                              {
                                  if([UIImagePickerController isSourceTypeAvailable:(UIImagePickerControllerSourceTypeCamera) ])
                                  {
                                      UIImagePickerController *imagePickerController= [[UIImagePickerController alloc] init];
                                      imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
                                      imagePickerController.delegate =self;
                                      [self presentViewController:imagePickerController animated:YES completion:^{}];
                                  }
                                  else
                                  {
                                      
                                      [self showAlertWithTitle:@"Error"andMessage:@"Camera not available"];
                                  }
                              }];
    
    UIAlertAction* button2 = [UIAlertAction
                              actionWithTitle:@"gallery"
                              style:UIAlertActionStyleDefault
                              handler:^(UIAlertAction * action)
                              {
                                  if([UIImagePickerController isSourceTypeAvailable:(UIImagePickerControllerSourceTypePhotoLibrary)])
                                  {
                                      UIImagePickerController *imagePickerController= [[UIImagePickerController alloc] init];
                                      imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                                      imagePickerController.delegate = self;
                                      [self presentViewController:imagePickerController animated:YES completion:^{}];
                                  }
                                  else
                                  {
                                      
                                      [self showAlertWithTitle:@"Error"andMessage:@"Photo library not available"];

                                  }
                              }];
    
    [alert addAction:button0];
    [alert addAction:button1];
    [alert addAction:button2];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary<NSString *,id> *)editingInfo
{
    
    imageView.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message
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

- (BOOL)validateEmailWithString:(NSString*)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

- (BOOL) validateUrl: (NSString *) candidate
{
    NSString *urlRegEx =
    @"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    return [urlTest evaluateWithObject:candidate];
}

- (BOOL) validateLattitude: (NSString *) latitude
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *latitude1 = [numberFormatter numberFromString:latitude];
    
    if (latitude1 != nil)
        
    {
        //check it is within lat/long range
        
        if ((latitude1.floatValue > -90.0) && (latitude1.floatValue < 90.0)) {
            
            NSLog(@"Hello Latitude!!!");
            
            return 1;
        }
        
    } else {
        
        //not even a valid number, reject it
        
        return 0;
        
    }
    
    return 0;
    
}


- (BOOL) validateLongitude: (NSString *) longitude
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *longitude1 = [numberFormatter numberFromString:longitude];
    
    if (longitude1 != nil)
        
    {
        //check it is within lat/long range
        
        if ((longitude1.floatValue > -180.0) && (longitude1.floatValue < 180.0)) {
            
            NSLog(@"Hello Longitude!!!");
            
            return 1;
        }
        
    } else {
        
        //not even a valid number, reject it
        
        return 0;
        
    }
    
    return 0;
    
}

@end
