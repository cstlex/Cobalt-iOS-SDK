//
//  MSCMeetingSection.m
//  CobaltiOSSDK
//
//  Created by Minsoo Kim on 2015. 12. 23..
//  Copyright © 2015년 CstLex. All rights reserved.
//

#import "MSCMeetingSection.h"

@implementation MSCMeetingSection

@synthesize code, size, enrolment, times, instructors;

- (instancetype)initWithData:(NSDictionary *)data {
    self = [super init];
    
    if (self){
        code = [data objectForKey:@"code"];
        size = [[data objectForKey:@"size"] intValue];
        enrolment = [[data objectForKey:@"enrolment"] intValue];
        
        NSArray *rawTimes = [data objectForKey:@"times"];
        NSMutableArray *temp = [NSMutableArray new];
        for (NSDictionary *data in rawTimes){
            MSCTime *time = [[MSCTime alloc] initWithData:data];
            [temp addObject:time];
        }
        times = [NSArray arrayWithArray:temp];
        
        instructors = [data objectForKey:@"instructors"];
    }
    
    return self;
}

@end
