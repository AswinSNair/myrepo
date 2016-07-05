//
//  CustomCellTableViewCell.m
//  MyFirstApp
//
//  Created by qburst on 29/06/16.
//  Copyright © 2016 qburst. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

@synthesize labelEmail = _labelEmail;

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)editButtonClicked:(id)sender {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(customTableViewCell:didClickedEditButton:)])
    {
        
        [self.delegate customTableViewCell:self didClickedEditButton:self.indexPath];
        
    }
}
@end