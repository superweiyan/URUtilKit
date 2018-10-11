//
//  InputViewInternalView.m
//  URTest
//
//  Created by lin weiyan on 2018/10/4.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "InputViewInternalView.h"
#import "URTextView.h"

CGFloat URInputPaddingTop = 5;
CGFloat URInputPaddingLeft = 5;

@interface InputViewInternalView()<UITextViewDelegate>

@property (nonatomic, strong) URTextView    *textView;

@end

@implementation InputViewInternalView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.textView = [[URTextView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, [self heightForString])];
        self.textView.backgroundColor = [UIColor clearColor];
        self.textView.font = [UIFont systemFontOfSize:15];
        self.textView.returnKeyType = UIReturnKeySend;
        self.textView.enablesReturnKeyAutomatically = YES;
        self.textView.textContainer.lineFragmentPadding = 0;
        self.textView.textContainerInset = UIEdgeInsetsZero;
        self.textView.contentInset = UIEdgeInsetsZero;
        self.textView.scrollEnabled = NO;
        self.textView.delegate = self;
        self.textView.scrollsToTop = NO;
        [self addSubview:self.textView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect rect = self.bounds;
    self.textView.frame = CGRectMake(rect.origin.x + URInputPaddingLeft,
                                     rect.origin.y + URInputPaddingTop,
                                     rect.size.width - URInputPaddingLeft * 2,
                                     rect.size.height - URInputPaddingTop * 2);
}

- (void)updateAdditionView:(UIView *)addtionView
{
    self.textView.inputView = addtionView;
    [self.textView becomeFirstResponder];
    [self.textView reloadInputViews];
}

#pragma mark - send

- (void)sendClicked
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(onSendClicked:)]) {
        
        NSString *tosend = [self.textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if (tosend.length == 0) {
            [self.delegate onSendClicked:tosend];
        }
    }
}

#pragma mark - delegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        return NO;
    }
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(inputViewHeightChange:)]) {
        CGFloat height = [self heightForString];
        [self.delegate inputViewHeightChange:height + URInputPaddingTop * 2];
    }
}

#pragma mark - private

- (float)heightForString
{
    if (self.textView.text.length == 0) {
        return self.textView.font.lineHeight + [self getExtranHeight];
    }
    
    CGSize sizeToFit = [self.textView sizeThatFits:CGSizeMake(self.bounds.size.width - URInputPaddingLeft * 2, MAXFLOAT)];
    return sizeToFit.height;
}

- (CGFloat)getExtranHeight
{
    return self.textView.contentInset.bottom
    + self.textView.contentInset.top
    + self.textView.textContainer.lineFragmentPadding
    + self.textView.textContainerInset.top
    + self.textView.textContainerInset.bottom;
}

#pragma mark - touch

- (void)textViewWasTapped
{
    if (self.textView.inputView) {
        self.textView.inputView = nil;
        [self.textView becomeFirstResponder];
        [self.textView reloadInputViews];
    }
}

@end
