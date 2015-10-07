//
//  SLKQuoteView.h
//  Pods
//
//  Created by Hen Levy on 07/10/2015.
//
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "SLKTextViewController.h"

@protocol CustomViewDelegate <NSObject>

- (void)doneAnimateShowOrHideView:(UIView *)view;

@end

@interface CustomView : UIView

@property (nonatomic) SLKKeyboardStatus keyboardStatus;
@property (nonatomic) CGFloat keyboardHeight, startY, viewHeight;
@property (nonatomic, weak) id<CustomViewDelegate> delegate;

- (id)initWithKeyboardStatus:(SLKKeyboardStatus)keyboardStatus keyboardHeight:(CGFloat)keyboardHeight andViewHeight:(CGFloat)viewHeight;
- (void)animateShowOrHideView;

@end
