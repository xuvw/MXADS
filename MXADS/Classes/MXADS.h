#if __has_include(<MXADS/MXADS.h>)

FOUNDATION_EXPORT double MXADSVersionNumber;
FOUNDATION_EXPORT const unsigned char MXADSVersionString[];

#import <MXADS/MXADSWindow.h>
#import <MXADS/MXADSEvent.h>
#import <MXADS/UIViewController+MXADSExts.h>

#else

#import "MXADSWindow.h"
#import "MXADSEvent.h"
#import "UIViewController+MXADSExts.h"

#endif
