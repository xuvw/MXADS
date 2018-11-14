//
//  UIViewController+MXADSExts.m
//  MXADS
//
//  Created by heke on 2018/10/23.
//  Copyright © 2018 MX. All rights reserved.
//

#import "UIViewController+MXADSExts.h"

@implementation UIViewController (MXADSExts)

- (ADSCloseBlock)adsClose {
    return ^(MXADSEvent *event) {
        [[self adsWindow] hideWithEvent:event];
    };
}

- (MXADSWindow *)adsWindow {
    
    MXADSWindow *adsWindow = nil;
    UIResponder *resp = self;
    while (YES) {
        resp = resp.nextResponder;
        if (resp == nil ) {
            break;
        }
        
        if ([resp isKindOfClass:[MXADSWindow class]]) {
            adsWindow = (MXADSWindow *)resp; break;
        }
    }
    
    NSAssert(adsWindow, @"viewController:%@ 不在MXADSWindow上",NSStringFromClass([self class]));
    
    return adsWindow;
}

@end
