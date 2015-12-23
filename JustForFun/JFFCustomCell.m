//
//  CustomCell.m
//  JustForFun
//
//  Created by Linder, Thomas L. (415) on 06.12.15.
//  Copyright © 2015 Linder, Thomas L. (415). All rights reserved.
//

#import "JFFCustomCell.h"

@interface JFFCustomCell()

@property (nonatomic) NSInteger counter;

@end

@implementation JFFCustomCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.iv =  [UIImageView newAutoLayoutView];
        self.customLabel = [UILabel newAutoLayoutView];
        self.descriptionTextView = [UITextView newAutoLayoutView];
        
        [self.iv setContentMode:UIViewContentModeScaleAspectFill];
        // this is the magical property FUCK! :-S :-D
        [self.iv setClipsToBounds:YES];
        [self.contentView addSubview:self.iv];
        [self.contentView addSubview:self.customLabel];
        [self.contentView addSubview:self.descriptionTextView];
        
        [self.iv autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.iv autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self.contentView withMultiplier:0.8];
        [self.iv autoMatchDimension:ALDimensionWidth toDimension:ALDimensionHeight ofView:self.iv withMultiplier:1];
        [self.iv autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.contentView withOffset:20];
        [self.iv setAutoresizingMask:UIViewAutoresizingNone];


        [self.customLabel setTextAlignment:NSTextAlignmentRight];
        [self.customLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.contentView withOffset:-20];
        [self.customLabel autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.contentView withMultiplier:0.15];
        [self.customLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [self.descriptionTextView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.iv withOffset:10.0];
        [self.descriptionTextView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.iv];
        [self.descriptionTextView autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self.iv withMultiplier:1.0];
        [self.descriptionTextView autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.customLabel];
        [self.descriptionTextView setText:@"Lorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."];


    }
    return self;
}



-(void)layoutSubviews{
    [super layoutSubviews];
    // Make sure the contentView does a layout pass here so that its subviews have their frames set, which we
    // need to use to set the preferredMaxLayoutWidth below.
    
    // important for settings the constraints / frames correctly after initializing the cell values
    [self.iv setNeedsLayout];
    [self.iv layoutIfNeeded];


    self.iv.layer.cornerRadius = self.iv.frame.size.height/2;
    self.iv.layer.borderColor = [[UIColor grayColor] CGColor];
    self.iv.layer.borderWidth = 1;
    self.iv.layer.masksToBounds = YES;
    
    NSLog(@"Content view height: %f", self.contentView.frame.size.height);
    NSLog(@"iv origin x, y: %f, %f", self.iv.frame.origin.x, self.iv.frame.origin.y);
    NSLog(@"iv width: %f", self.iv.frame.size.width);
    NSLog(@"iv heihgt: %f", self.iv.frame.size.height);    
    NSLog(@"Counter: %li", (long)self.counter);
    self.counter++;
    NSLog(@"Cell Nr.: %@", self.customLabel.text);

    

    
    // Set the preferredMaxLayoutWidth of the mutli-line bodyLabel based on the evaluated width of the label's frame,
    // as this will allow the text to wrap correctly, and as a result allow the label to take on the correct height.
    //self.textLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.textLabel.frame);

}





@end
