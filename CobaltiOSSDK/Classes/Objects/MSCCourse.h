//
//  MSCCourse.h
//  CobaltiOSSDK
//
//  Created by Minsoo Kim on 2015. 12. 23..
//  Copyright © 2015년 CstLex. All rights reserved.
//

#import "MSCobaltKit.h"
#import "MSCMeetingSection.h"

@interface MSCCourse : NSObject <MSCFetchable>

@property (strong, readonly) NSString *courseId;
@property (strong, readonly) NSString *code;
@property (strong, readonly) NSString *name;
@property (strong, readonly) NSString *courseDescription;
@property (strong, readonly) NSString *division;
@property (strong, readonly) NSString *department;
@property (strong, readonly) NSArray *prerequisites;
@property (strong, readonly) NSString *exclusions;
@property (assign, readonly) NSInteger level;
@property (assign, readonly) MSCCampus campus;
@property (strong, readonly) NSString *term;
@property (strong, readonly) NSArray *meetingSections;
@property (strong, readonly) NSArray *breadths;

+ (instancetype)objectWithCourseId:(NSString *)courseId;

- (instancetype)initWithData:(NSDictionary *)data;

@end
