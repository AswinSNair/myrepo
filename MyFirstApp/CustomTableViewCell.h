//
//  CustomCellTableViewCell.h
//  MyFirstApp
//
//  Created by qburst on 29/06/16.
//  Copyright © 2016 qburst. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomTableViewCellDelegate;

@interface CustomTableViewCell : UITableViewCell
{
    
}
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelEmail;
@property (weak, nonatomic) IBOutlet UIImageView *thisImageView;
@property (weak, nonatomic) NSIndexPath *indexPath;


@property (strong, nonatomic) id<CustomTableViewCellDelegate>delegate;

@end


@protocol CustomTableViewCellDelegate <NSObject>


- (void)customTableViewCell:(CustomTableViewCell *)customTableViewCell didClickedEditButton:(NSIndexPath *)indexPath;

@end
