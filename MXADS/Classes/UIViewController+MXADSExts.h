//
//  UIViewController+MXADSExts.h
//  MXADS
//
//  Created by heke on 2018/10/23.
//  Copyright © 2018 MX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MXADSWindow.h"
NS_ASSUME_NONNULL_BEGIN

@class MXADSEvent;
typedef void(^ADSCloseBlock)(MXADSEvent *event);

@interface UIViewController (MXADSExts)

@property (nonatomic, copy, readonly) ADSCloseBlock adsClose;

@end

NS_ASSUME_NONNULL_END
