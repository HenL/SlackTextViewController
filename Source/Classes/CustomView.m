//
//  SLKQuoteView.m
//  Pods
//
//  Created by Hen Levy on 07/10/2015.
//
//

#import "CustomView.h"

@implementation CustomView

- (id)initWithKeyboardStatus:(SLKKeyboardStatus)keyboardStatus keyboardHeight:(CGFloat)keyboardHeight andViewHeight:(CGFloat)viewHeight;
{
    if (self = [super init])
    {
        self.keyboardStatus = keyboardStatus;
        self.keyboardHeight = keyboardHeight;
        self.viewHeight = viewHeight;
        
        self.frame = CGRectZero;
        self.hidden = YES;
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)animateShowOrHideView
{
    CGRect superviewRect = self.superview.frame;
    self.startY = superviewRect.origin.y + superviewRect.size.height;
    
    CGFloat y = !self.hidden ? self.startY - self.keyboardHeight - self.viewHeight : self.startY;
    self.frame = CGRectMake(superviewRect.origin.x, y, superviewRect.size.width, self.viewHeight);
    
    y = self.hidden ? self.startY - self.keyboardHeight - self.viewHeight : self.startY;
    
    if (self.hidden)
    {
        self.hidden = NO;
    }
    
    [UIView animateWithDuration:kAnimationDuration animations:^{
        
        self.alpha = 1.0;
        self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.viewHeight);
        
    } completion:^(BOOL finished) {
        
        if (y == self.startY)
        {
            self.hidden = YES;
        }
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(doneAnimateShowOrHideView:)])
        {
            [self.delegate doneAnimateShowOrHideView:self];
        }
    }];
}

@end
