//
//  QuoteView.h
//  Messenger
//
//  Created by Hen Levy on 07/10/2015.
//  Copyright © 2015 Slack Technologies, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLKTextViewController.h"
#import "CustomView.h"

static CGFloat kSubviewMargin = 20.0;

@interface QuoteView : CustomView

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *text;

@property (nonatomic, strong) UILabel *usernameLabel;
@property (nonatomic, strong) UITextView *quoteTextView;
@property (nonatomic, strong) UIButton *cancelButton;

- (id)initWithUsername:(NSString *)username
               andText:(NSString *)text
        keyboardStatus:(SLKKeyboardStatus)keyboardStatus
        keyboardHeight:(CGFloat)keyboardHeight
         andViewHeight:(CGFloat)viewHeight;

- (void)updateWithUsername:(NSString *)username andText:(NSString *)text;

@end
