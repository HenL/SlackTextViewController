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
static CGFloat kTextViewHeight = 50.0;
static CGFloat kQuoteViewHeight = 110.0;
static CGFloat kCancelButtonWidth = 20.0;
static CGFloat kMaxTextViewNumOfLines = 2;

@interface QuoteView : CustomView

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *text;

@end
