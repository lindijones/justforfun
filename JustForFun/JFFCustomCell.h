//
//  CustomCell.h
//  JustForFun
//
//  Created by Linder, Thomas L. (415) on 06.12.15.
//  Copyright © 2015 Linder, Thomas L. (415). All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PureLayout/PureLayout.h>
#import <QuartzCore/QuartzCore.h>

@interface JFFCustomCell : UITableViewCell
@property (nonatomic,strong) UIImageView *iv;
@property (nonatomic,strong) UILabel *customLabel;
@property (nonatomic,strong) UITextView *descriptionTextView;
@end
