//
//  MXADSEvent.m
//  MXADS
//
//  Created by heke on 2018/10/22.
//  Copyright © 2018 MX. All rights reserved.
//

#import "MXADSEvent.h"

@implementation MXADSEvent

- (instancetype)initWith:(MXADSEventType)eventType data:(NSDictionary *)data {
    if (self = [super init]) {
        _eventType = eventType;
        _eventData = [data copy];
    }
    return self;
}

@end
