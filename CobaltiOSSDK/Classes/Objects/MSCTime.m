//
//  MSCTime.m
//  CobaltiOSSDK
//
//  Created by Minsoo Kim on 2015. 12. 23..
//  Copyright © 2015년 CstLex. All rights reserved.
//

#import "MSCTime.h"

@implementation MSCTime

@synthesize day, dayString, start, end, duration, location;

- (instancetype)initWithData:(NSDictionary *)data {
    self = [super init];
    
    if (self){
        dayString = [data objectForKey:@"day"];
        day = [MSCTime parseDay:dayString];
        start = [[data objectForKey:@"start"] intValue];
        end = [[data objectForKey:@"end"] intValue];
        duration = [[data objectForKey:@"duration"] intValue];
        location = [data objectForKey:@"location"];
    }
    
    return self;
}

+ (int)parseDay:(NSString *)dayString {
    int day = 0;
    
    if ([dayString isEqualToString:@"MONDAY"]){
        day = 1;
    } else if ([dayString isEqualToString:@"TUESDAY"]){
        day = 2;
    } else if ([dayString isEqualToString:@"WEDNESDAY"]){
        day = 3;
    } else if ([dayString isEqualToString:@"THURSDAY"]){
        day = 4;
    } else if ([dayString isEqualToString:@"FRIDAY"]){
        day = 5;
    }
    
    return day;
}

@end