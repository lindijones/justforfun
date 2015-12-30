//
//  UIImage+ScaleExtras.h
//  JustForFun
//
//  Created by Thomas Linder on 30.12.15.
//  Copyright © 2015 Linder, Thomas L. (415). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ScaleExtras)
- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;
@end;
