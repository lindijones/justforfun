//
//  NormalTableViewCell.m
//  JustForFun
//
//  Created by Linder, Thomas L. (415) on 13.12.15.
//  Copyright © 2015 Linder, Thomas L. (415). All rights reserved.
//

#import "NormalTableViewCell.h"

@implementation NormalTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // init code here...
        
    }
    return self;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
