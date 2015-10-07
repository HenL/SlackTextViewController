//
//  QuoteView.m
//  Messenger
//
//  Created by Hen Levy on 07/10/2015.
//  Copyright © 2015 Slack Technologies, Inc. All rights reserved.
//

#import "QuoteView.h"

@implementation QuoteView

- (id)initWithUsername:(NSString *)username
               andText:(NSString *)text
        keyboardStatus:(SLKKeyboardStatus)keyboardStatus
        keyboardHeight:(CGFloat)keyboardHeight
         andViewHeight:(CGFloat)viewHeight
{
    if (self = [super initWithKeyboardStatus:keyboardStatus
                              keyboardHeight:keyboardHeight
                               andViewHeight:viewHeight])
    {
        [self updateWithUsername:username andText:text];
    }
    return self;
}

- (void)updateWithUsername:(NSString *)username andText:(NSString *)text
{
    self.username = username;
    self.text = text;
    
    [self setupSubviews];
}

- (void)setupSubviews
{
    [self addUsernameLabel];
    [self addQuoteTextView];
}

- (void)addUsernameLabel
{
    UIFont *labelFont = [UIFont fontWithName:@"Helvetica" size:[UIFont labelFontSize]];
    CGSize labelMinSize = CGSizeMake(self.frame.size.width - kSubviewMargin*2, 20.0);

    CGRect expectedRect = [self.username boundingRectWithSize:labelMinSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:labelFont} context:nil];

    if(self.usernameLabel)
    {
        [self.usernameLabel removeFromSuperview];
        self.usernameLabel = nil;
    }
    
    self.usernameLabel = [[UILabel alloc] initWithFrame:CGRectMake(kSubviewMargin, kSubviewMargin, expectedRect.size.width, expectedRect.size.height)];
    self.usernameLabel.text = self.username;
    self.usernameLabel.textColor = [UIColor darkGrayColor];
    self.usernameLabel.font = labelFont;
    [self addSubview:self.usernameLabel];
}

- (void)addQuoteTextView
{
    UIFont *textViewFont = [UIFont fontWithName:@"Helvetica" size:13.0];
    CGSize textViewMinSize = CGSizeMake(self.frame.size.width - kSubviewMargin*2, 40.0);

    CGRect expectedRect = [self.text boundingRectWithSize:textViewMinSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:textViewFont} context:nil];

    if(self.quoteTextView)
    {
        [self.quoteTextView removeFromSuperview];
        self.quoteTextView = nil;
    }
    
    self.quoteTextView = [[UITextView alloc] initWithFrame:CGRectMake(kSubviewMargin, self.usernameLabel.frame.origin.y + self.usernameLabel.frame.size.height, expectedRect.size.width, expectedRect.size.height)];
    self.quoteTextView.text = self.text;
    self.quoteTextView.textColor = [UIColor lightTextColor];
    self.quoteTextView.backgroundColor = [UIColor clearColor];
    self.quoteTextView.font = textViewFont;
    self.quoteTextView.editable = NO;
    [self addSubview:self.quoteTextView];
}

@end
