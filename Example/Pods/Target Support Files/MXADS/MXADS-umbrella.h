#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "MXADS.h"
#import "MXADSEvent.h"
#import "MXADSWindow.h"
#import "UIViewController+MXADSExts.h"

FOUNDATION_EXPORT double MXADSVersionNumber;
FOUNDATION_EXPORT const unsigned char MXADSVersionString[];

