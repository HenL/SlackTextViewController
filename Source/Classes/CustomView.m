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
    self.startY = self.superview.frame.origin.y + self.superview.frame.size.height;
    CGFloat y = self.hidden ? self.startY - self.keyboardHeight - self.viewHeight : self.startY;
    
    if(self.hidden)
        self.hidden = NO;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 1.0;
        self.frame = CGRectMake(self.superview.frame.origin.x, y, self.superview.frame.size.width, self.viewHeight);
        
    } completion:^(BOOL finished) {
        
        if(y == self.startY)
            self.hidden = YES;
        
        if(self.delegate && [self.delegate respondsToSelector:@selector(doneAnimateShowOrHideView:)])
            [self.delegate doneAnimateShowOrHideView:self];
    }];
}

@end
