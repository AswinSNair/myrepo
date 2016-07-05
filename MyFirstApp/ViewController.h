//
//  ViewController.h
//  MyFirstApp
//
//  Created by qburst on 22/06/16.
//  Copyright © 2016 qburst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddViewController.h"
#import "CustomTableViewCell.h"


@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,AddViewControllerDelegate,CustomTableViewCellDelegate>
{
    NSMutableArray *myData;

}
@property (weak, nonatomic) IBOutlet UIBarButtonItem *plusButton;

@property (weak, nonatomic) IBOutlet UITableView *tableRow;

@end

