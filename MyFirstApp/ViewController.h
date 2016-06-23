//
//  ViewController.h
//  MyFirstApp
//
//  Created by qburst on 22/06/16.
//  Copyright © 2016 qburst. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *myData;

}

@property (weak, nonatomic) IBOutlet UITableView *tableRow;
@end
