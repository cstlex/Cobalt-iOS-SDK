//
//  MSCMeetingSection.h
//  CobaltiOSSDK
//
//  Created by Minsoo Kim on 2015. 12. 23..
//  Copyright © 2015년 CstLex. All rights reserved.
//

#import "MSCTime.h"

@interface MSCMeetingSection : NSObject

@property (strong, readonly) NSString *code;
@property (assign, readonly) int size;
@property (assign, readonly) int enrolment;
@property (strong, readonly) NSArray *times;
@property (strong, readonly) NSArray *instructors;

- (instancetype)initWithData:(NSDictionary *)data;

@end
