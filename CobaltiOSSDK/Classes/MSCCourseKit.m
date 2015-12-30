//
//  MSCCourseKit.m
//  CobaltiOSSDK
//
//  Created by Minsoo Kim on 2015. 12. 23..
//  Copyright © 2015 CstLex. All rights reserved.
//

#import "MSCCourseKit.h"

@implementation MSCCourseKit

#pragma List
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
    
    [super performRequestWithUrl:@"courses/list" parameters:params onCompletion:^(NSArray *response, NSError *error){
        if (error){
            if (errorHandler){
                errorHandler(error);
            }
        } else {
            if (success){
                NSMutableArray *temp = [NSMutableArray new];
                for (NSDictionary *data in response){
                    MSCCourse *course = [[MSCCourse alloc] initWithData:data];
                    [temp addObject:course];
                }
                success([NSArray arrayWithArray:temp]);
            }
        }
    }];
}

#pragma Search
+ (void)searchWithQuery:(NSString *)query success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error {
    [self searchWithQuery:query skip:0 limit:0 sort:nil success:success error:error];
}

+ (void)searchWithQuery:(NSString *)query limit:(int)limit success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error {
    [self searchWithQuery:query skip:0 limit:limit sort:nil success:success error:error];
}

+ (void)searchWithQuery:(NSString *)query skip:(int)skip success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error {
    [self searchWithQuery:query skip:skip limit:0 sort:nil success:success error:error];
}

+ (void)searchWithQuery:(NSString *)query sort:(NSArray *)sortKeys success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error {
    [self searchWithQuery:query skip:0 limit:0 sort:sortKeys success:success error:error];
}

+ (void)searchWithQuery:(NSString *)query skip:(int)skip limit:(int)limit success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error {
    [self searchWithQuery:query skip:skip limit:limit sort:nil success:success error:error];
}

+ (void)searchWithQuery:(NSString *)query limit:(int)limit sort:(NSArray *)sortKeys success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error {
    [self searchWithQuery:query skip:0 limit:limit sort:sortKeys success:success error:error];
}

+ (void)searchWithQuery:(NSString *)query skip:(int)skip sort:(NSArray *)sortKeys success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error {
    [self searchWithQuery:query skip:skip limit:0 sort:sortKeys success:success error:error];
}

+ (void)searchWithQuery:(NSString *)query skip:(int)skip limit:(int)limit sort:(NSArray *)sortKeys success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)errorHandler {
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
    
    [super performRequestWithUrl:@"courses/search" parameters:params onCompletion:^(id response, NSError *error) {
        if (error){
            if (errorHandler){
                errorHandler(error);
            }
        } else {
            if (success) {
                NSMutableArray *temp = [NSMutableArray new];
                for (NSDictionary *data in response){
                    MSCCourse *course = [[MSCCourse alloc] initWithData:data];
                    [temp addObject:course];
                }
                success([NSArray arrayWithArray:temp]);
            }
        }
    }];
}

@end
