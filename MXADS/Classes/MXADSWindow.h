//
//  MXADSWindow.h
//  MXADS
//
//  Created by heke on 2018/10/22.
//  Copyright © 2018 MX. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MXADSWindowDelegate;
@class    MXADSEvent;
typedef   __kindof UIViewController *(^ADSContentProvider)(void);

@interface MXADSWindow : UIWindow

@property (nonatomic, weak) id<MXADSWindowDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame __unavailable;

- (instancetype)initWithADSProvider:(ADSContentProvider)adsContentProvider;

- (void)show;

- (void)hideWithEvent:(__kindof MXADSEvent *)event;

@end

@protocol MXADSWindowDelegate <NSObject>

@optional
- (void)adsWindowWillShow:(MXADSWindow *)adsWindow;
- (void)adsWindowDidShow:(MXADSWindow *)adsWindow;

- (void)adsWindowWillClose:(MXADSWindow *)addWindow withEvent:(__kindof MXADSEvent *)event;
- (void)adsWindowDidClose:(MXADSWindow *)addWindow withEvent:(__kindof MXADSEvent *)event;

@end

NS_ASSUME_NONNULL_END
