//
//  QuoteView.m
//  Messenger
//
//  Created by Hen Levy on 07/10/2015.
//  Copyright © 2015 Slack Technologies, Inc. All rights reserved.
//

#import "QuoteView.h"

@interface QuoteView ()

@property (nonatomic, strong) UILabel *usernameLabel;
@property (nonatomic, strong) UITextView *quoteTextView;
@property (nonatomic, strong) UIButton *cancelButton;

@end

@implementation QuoteView

- (instancetype)init
{
    if (self = [super init])
    {
    }
    return self;
}

- (void)didMoveToSuperview
{
    self.backgroundColor = [UIColor lightGrayColor];
    [self addCancelButton];
}

- (void)setUsername:(NSString *)username
{
    _username = username;
    self.usernameLabel.text = username;
}

- (void)setText:(NSString *)text
{
    _text = text;
    self.quoteTextView.text = text;
}

- (UILabel *)usernameLabel
{
    if (!_usernameLabel)
    {
        UIFont *labelFont = [UIFont fontWithName:@"Helvetica" size:[UIFont labelFontSize]];
        
        CGRect expectedRect = [self.username boundingRectWithSize:[self minLabelSize] options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:labelFont} context:nil];
        
        _usernameLabel = [[UILabel alloc] initWithFrame:CGRectMake(kSubviewMargin, kSubviewMargin + kSubviewMargin/2, expectedRect.size.width, expectedRect.size.height)];
        _usernameLabel.text = self.username;
        _usernameLabel.textColor = [UIColor blackColor];
        _usernameLabel.font = labelFont;
        [self addSubview:_usernameLabel];
    }
    else
    {
        CGRect expectedRect = [self.username boundingRectWithSize:[self minLabelSize] options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:_usernameLabel.font} context:nil];
        _usernameLabel.frame = CGRectMake(_usernameLabel.frame.origin.x, _usernameLabel.frame.origin.y, expectedRect.size.width, expectedRect.size.height);
        
    }
    return _usernameLabel;
}

- (UITextView *)quoteTextView
{
    if (!_quoteTextView)
    {
        _quoteTextView = [[UITextView alloc] initWithFrame:CGRectMake(kSubviewMargin, self.usernameLabel.frame.origin.y + self.usernameLabel.frame.size.height, self.frame.size.width - kSubviewMargin*2, kTextViewHeight)];
        _quoteTextView.text = self.text;
        _quoteTextView.textColor = [UIColor lightTextColor];
        _quoteTextView.backgroundColor = [UIColor clearColor];
        _quoteTextView.font = [UIFont fontWithName:@"Helvetica" size:13.0];
        _quoteTextView.editable = NO;
        _quoteTextView.textContainer.maximumNumberOfLines = kMaxTextViewNumOfLines;
        _quoteTextView.textContainer.lineBreakMode = NSLineBreakByTruncatingTail;
        [self addSubview:_quoteTextView];

    }
    return _quoteTextView;
}

- (void)addCancelButton
{
    self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.cancelButton setFrame:CGRectMake(0, 0, kCancelButtonWidth, kSubviewMargin)];
    [self.cancelButton setTitle:@"x" forState:UIControlStateNormal];
    [self.cancelButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.cancelButton addTarget:self action:@selector(cancelDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.cancelButton];
}

- (CGSize)minLabelSize
{
    return CGSizeMake(self.frame.size.width - kSubviewMargin*2, kSubviewMargin);
}

#pragma mark - Events

- (void)cancelDidTap:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:SLKHideCustomView object:nil];
}

@end
