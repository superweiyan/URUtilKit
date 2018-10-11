//
//  URTextView.m
//  URTest
//
//  Created by lin weiyan on 2018/10/11.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URTextView.h"

@implementation URTextView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if ([self.delegate respondsToSelector:@selector(textViewWasTapped)]) {
        [self.delegate performSelector:@selector(textViewWasTapped)];
    }
    return YES;
}


@end
