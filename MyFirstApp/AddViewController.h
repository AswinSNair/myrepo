//
//  AddViewController.h
//  MyFirstApp
//
//  Created by qburst on 27/06/16.
//  Copyright © 2016 qburst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonalInfo.h"


@protocol AddViewControllerDelegate;

@interface AddViewController : UIViewController<UIAlertViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{    
    
}
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *phonenoTextField;
@property (weak, nonatomic) IBOutlet UITextField *websiteTextField;
@property (weak, nonatomic) IBOutlet UITextField *lattitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeTextField;

@property(nonatomic,strong) NSIndexPath *indexPath;

@property (strong, nonatomic) PersonalInfo *personalInfo;

@property(nonatomic,assign) BOOL didEdit;


- (IBAction)showActionSheet:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) UIImagePickerController * imagepicker;

@property(nonatomic,strong) id<AddViewControllerDelegate> delegate;

@end


@protocol AddViewControllerDelegate <NSObject>

- (void)addViewController:(AddViewController *)addViewController didAddedNewPersonalInfo:(PersonalInfo *)personalInfo;

- (void)addViewController:(AddViewController *)addViewController didEditedPersonalInfo:(PersonalInfo *)personalInfo atIndex:(NSInteger)index;
@end