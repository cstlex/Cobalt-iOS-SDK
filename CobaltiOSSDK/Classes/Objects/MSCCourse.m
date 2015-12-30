//
//  MSCCourse.m
//  CobaltiOSSDK
//
//  Created by Minsoo Kim on 2015. 12. 23..
//  Copyright © 2015년 CstLex. All rights reserved.
//

#import "MSCCourse.h"

@implementation MSCCourse

@synthesize dataAvailable, courseId, code, name, courseDescription, division, department, prerequisites, exclusions, level, campus, term, meetingSections, breadths;

+ (instancetype)objectWithCourseId:(NSString *)courseId {
    MSCCourse *course = [[self alloc] initWithData:@{@"id" : courseId}];

    return course;
}

- (instancetype)initWithData:(NSDictionary *)data {
    self = [super init];
    
    if (self){
        [self setVariablesWithData:data];
    }
    
    return self;
}

- (void)setVariablesWithData:(NSDictionary *)data {
    courseId = [data objectForKey:@"id"];
    code = [data objectForKey:@"code"];
    name = [data objectForKey:@"name"];
    courseDescription = [data objectForKey:@"description"];
    division = [data objectForKey:@"division"];
    department = [data objectForKey:@"department"];
    
    NSString *prerequisitesRawString = [data objectForKey:@"prerequisites"];
    prerequisites = [prerequisitesRawString componentsSeparatedByString:@"\\"];
    
    exclusions = [data objectForKey:@"exclusions"];
    
    level = [[data objectForKey:@"level"] integerValue];
    
    campus = [MSCobaltKit campusFromString:[data objectForKey:@"campus"]];
    
    term = [data objectForKey:@"term"];
    
    NSArray *meetingSectionRawData = [data objectForKey:@"meeting_sections"];
    NSMutableArray *temp = [NSMutableArray new];
    for (NSDictionary *meetingSectionData in meetingSectionRawData){
        MSCMeetingSection *section = [[MSCMeetingSection alloc] initWithData:meetingSectionData];
        [temp addObject:section];
    }
    meetingSections = [NSArray arrayWithArray:temp];
    
    breadths = [data objectForKey:@"breadths"];
    
    if ([[data allKeys] count] > 1)
        dataAvailable = YES;
    else
        dataAvailable = NO;
}

- (void)fetchWithError:(NSError **)error {
    NSURL *fetchingUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@courses/show/%@?key=%@", [MSCobaltKit baseUrl], courseId, [MSCobaltKit apiKey]]];
    NSDictionary *data = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfURL:fetchingUrl] options:NSJSONReadingAllowFragments error:error];
    [self setVariablesWithData:data];
}

- (void)fetch {
    [self fetchWithError:nil];
}

- (void)fetchIfNeeded {
    if (!dataAvailable)
        [self fetch];
}

- (void)fetchInBackground {
    [self fetchInBackgroundWithCompletion:NULL];
}

- (void)fetchInBackgroundWithCompletion:(MSCFetchDoneBlock)completion {
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
        NSError *error = nil;
        [self fetchWithError:&error];
        completion(error);
    });
}

- (void)fetchIfNeededInBackground {
    [self fetchIfNeededInBackgroundWithCompletion:NULL];
}

- (void)fetchIfNeededInBackgroundWithCompletion:(MSCFetchDoneBlock)completion {
    if (!dataAvailable){
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
            NSError *error = nil;
            [self fetchWithError:&error];
            completion(error);
        });
    } else {
        completion(nil);
    }
}

@end
