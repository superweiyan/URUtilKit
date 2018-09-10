//
//  UIButton+TextImageLayout.h
//  URMission
//
//  Created by lin weiyan on 2018/9/10.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, BtnLayoutSytle){
    BtnLayoutSytleImageLeft = 0,
    BtnLayoutSytleImageRight = 1,
    BtnLayoutSytleImageUp = 2,
    BtnLayoutSytleImageDown = 3
};

@interface UIButton (TextImageLayout)

- (void)updateLayout:(BtnLayoutSytle)layoutStyle;

@end
