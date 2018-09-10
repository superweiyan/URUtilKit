//
//  UIButton+TextImageLayout.m
//  URMission
//
//  Created by lin weiyan on 2018/9/10.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "UIButton+TextImageLayout.h"

@implementation UIButton (TextImageLayout)

- (void)updateLayout:(BtnLayoutSytle)layoutStyle
{
    
//  注掉titleFrame 是因为此时得到的size 是为0，导致在调高度的时候，计算都有错误。
//    CGRect titleFrame = self.titleLabel.frame;
    CGRect imageFrame = self.imageView.frame;
    
    CGFloat space = 0.0;
    
    self.titleLabel.backgroundColor = [UIColor blueColor];
    
    switch (layoutStyle) {
        case BtnLayoutSytleImageRight:
        {
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -imageFrame.size.width, 0, imageFrame.size.width)];
            [self setImageEdgeInsets:UIEdgeInsetsMake(0,self.titleLabel.bounds.size.width + space, 0, -(self.titleLabel.bounds.size.width + space))];
        }

            break;
            
        case BtnLayoutSytleImageUp:
            
            self.titleEdgeInsets = UIEdgeInsetsMake(imageFrame.size.height,
                                                    -imageFrame.size.width,
                                                    0,
                                                    0);
            
            self.imageEdgeInsets = UIEdgeInsetsMake(-self.imageView.frame.size.height/2,
                                                    0,
                                                    0,
                                                    -self.titleLabel.bounds.size.width);
            
            break;
            
        case BtnLayoutSytleImageDown:
        {
            CGFloat centerY = self.bounds.size.height/2 + self.titleLabel.bounds.size.height/2 - imageFrame.origin.y;
            self.titleEdgeInsets = UIEdgeInsetsMake(-centerY,
                                                    -imageFrame.size.width,
                                                    0,
                                                    0);
            
            CGFloat y = self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height - self.imageView.frame.origin.y;
            
            self.imageEdgeInsets = UIEdgeInsetsMake(y,
                                                    0,
                                                    0,
                                                    -self.titleLabel.bounds.size.width);
        }

            break;
            
        default:
            break;
    }
}

@end
