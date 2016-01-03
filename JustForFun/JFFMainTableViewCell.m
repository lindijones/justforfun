//
//  JFFMainTableViewCell.m
//  JustForFun
//
//  Created by Thomas Linder on 03.01.16.
//  Copyright © 2016 Linder, Thomas L. (415). All rights reserved.
//

#import "JFFMainTableViewCell.h"

@implementation JFFMainTableViewCell

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
