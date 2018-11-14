//
//  MXADSEvent.h
//  MXADS
//
//  Created by heke on 2018/10/22.
//  Copyright © 2018 MX. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, MXADSEventType) {
    MXADSEventTypeUnkown = 0,
    MXADSEventTypeTap,
    MXADSEventTypeCancel,
    MXADSEventTypeTimeout
    //可扩展
};

@interface MXADSEvent : NSObject

@property (nonatomic, copy)             NSString *adsID;
@property (nonatomic, assign, readonly) MXADSEventType eventType;
@property (nonatomic, copy)             NSString *eventName;
@property (nonatomic, copy, readonly)   NSDictionary *eventData;

- (instancetype)initWith:(MXADSEventType)eventType data:(NSDictionary *)data;

@end

NS_ASSUME_NONNULL_END
