//
//  InputViewInternalView.h
//  URTest
//
//  Created by lin weiyan on 2018/10/4.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol InputViewInternalViewDelegate <NSObject>

- (void)inputViewHeightChange:(CGFloat)height;
- (void)onSendClicked:(NSString *)text;

@optional
- (void)textViewWasTapped;

@end

@interface InputViewInternalView : UIView

@property (nonatomic, weak) id<InputViewInternalViewDelegate> delegate;

- (void)updateAdditionView:(UIView *)addtionView;

@end

NS_ASSUME_NONNULL_END
