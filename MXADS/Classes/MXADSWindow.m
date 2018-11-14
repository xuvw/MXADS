//
//  MXADSWindow.m
//  MXADS
//
//  Created by heke on 2018/10/22.
//  Copyright © 2018 MX. All rights reserved.
//

#import "MXADSWindow.h"
#import "MXADSEvent.h"
#import <objc/message.h>

@interface MXADSWindow ()

@property (nonatomic, class, assign) UIWindowLevel adsWindowLevel;

@end

@implementation MXADSWindow

+ (void)setAdsWindowLevel:(UIWindowLevel)adsWindowLevel {
    objc_setAssociatedObject(self, _cmd, @(adsWindowLevel), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

+ (UIWindowLevel)adsWindowLevel {
    NSNumber *levelRaw = objc_getAssociatedObject(self, @selector(setAdsWindowLevel:));
    UIWindowLevel level = UIWindowLevelStatusBar + 1;
    if (levelRaw) {
        level = (UIWindowLevel)[levelRaw floatValue];
    }
    
    level += 1;
    MXADSWindow.adsWindowLevel = level;
    
    return level;
}



- (instancetype)initWithADSProvider:(ADSContentProvider)adsContentProvider {
    
    CGRect frame = [UIScreen mainScreen].bounds;
    
    if (self = [super initWithFrame:frame]) {
        
        [self initADSWindow];
        
        if (adsContentProvider) {
           
            UIViewController *adsVC = adsContentProvider();
        
            self.rootViewController = adsVC;
            
        }
    
    }
    
    return self;

}

- (void)initADSWindow {
    
    self.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:.4];
    
    self.windowLevel = MXADSWindow.adsWindowLevel;
}

- (void)show {
    
    [self notifyWindowWillShow];
    
    self.hidden = NO;
    
    [self notifyWindowDidShow];
}

- (void)hideWithEvent:(MXADSEvent *)event {
    
    [self notifyWindowWillCloseWith:event];
    
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    
    [UIView animateWithDuration:.3 animations:^{
        
        self.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        self.hidden = YES;
        
        [self notifyWindowDidCloseWith:event];
        
        [self clear];
        
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    }];
}

- (void)notifyWindowWillShow {
    
    if (self.delegate &&
        [self.delegate respondsToSelector:@selector(adsWindowWillShow:)]) {
        
        [self.delegate adsWindowWillShow:self];
    }
}

- (void)notifyWindowDidShow {
    
    if (self.delegate &&
        [self.delegate respondsToSelector:@selector(adsWindowDidShow:)]) {
        
        [self.delegate adsWindowDidShow:self];
    }
}

- (void)notifyWindowWillCloseWith:(MXADSEvent *)event {
    
    if (self.delegate &&
        [self.delegate respondsToSelector:@selector(adsWindowWillClose:withEvent:)]) {
        
        [self.delegate adsWindowWillClose:self withEvent:event];
    }
}

- (void)notifyWindowDidCloseWith:(MXADSEvent *)event {
    
    if (self.delegate &&
        [self.delegate respondsToSelector:@selector(adsWindowDidClose:withEvent:)]) {
        
        [self.delegate adsWindowDidClose:self withEvent:event];
    }
}

- (void)clear {
    
    [self setRootViewController:nil];
    
    NSArray *subViews = self.subviews;
    
    [subViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

@end
