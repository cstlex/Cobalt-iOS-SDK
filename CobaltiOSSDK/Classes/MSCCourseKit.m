//
//  MSCCourseKit.m
//  CobaltiOSSDK
//
//  Created by Minsoo Kim on 2015. 12. 23..
//  Copyright © 2015 CstLex. All rights reserved.
//

#import "MSCCourseKit.h"

@implementation MSCCourseKit

+ (void)getCourseListWithSuccess:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error {
    [self getCourseListWithSkip:0 limit:10 sort:@[] success:success error:error];
}

+ (void)getCourseListWithLimit:(int)limit success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error {
    [self getCourseListWithSkip:0 limit:limit sort:@[] success:success error:error];
}

+ (void)getCourseListWithLimit:(int)limit sort:(NSArray *)sortKeys success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error {
    [self getCourseListWithSkip:0 limit:limit sort:sortKeys success:success error:error];
}

+ (void)getCourseListWithSkip:(int)skip success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error {
    [self getCourseListWithSkip:skip limit:10 sort:@[] success:success error:error];
}

+ (void)getCourseListWithSkip:(int)skip sort:(NSArray *)sortKeys success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error {
    [self getCourseListWithSkip:skip limit:10 sort:sortKeys success:success error:error];
}

+ (void)getCourseListWithSort:(NSArray *)sortKeys success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error {
    [self getCourseListWithSkip:0 limit:10 sort:sortKeys success:success error:error];
}

+ (void)getCourseListWithSkip:(int)skip limit:(int)limit success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error {
    [self getCourseListWithSkip:skip limit:limit sort:@[] success:success error:error];
}

+ (void)getCourseListWithSkip:(int)skip limit:(int)limit sort:(NSArray *)sortKeys success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)errorHandler {
    NSMutableDictionary *params = [NSMutableDictionary new];
    
    [params setObject:[NSNumber numberWithInt:skip] forKey:@"skip"];
    [params setObject:[NSNumber numberWithInt:limit] forKey:@"limit"];
    if ([sortKeys count] > 0){
        NSString *sortKey = @"";
        for (NSString *key in sortKeys){
            if (![sortKey isEqualToString:@""])
                sortKey = [sortKey stringByAppendingString:@" "];
            [sortKey stringByAppendingString:key];
        }
        [params setObject:sortKey forKey:@"sort"];
    }
    
    [super performRequestWithUrl:@"https://cobalt.qas.im/api/1.0/courses/list" parameters:params onCompletion:^(NSDictionary *response, NSError *error){
        if (error){
            if (errorHandler){
                errorHandler(error);
            }
        } else {
            if (success){
                success(response);
            }
        }
    }];
}

@end
