//
//  MSCCourseKit.h
//  CobaltiOSSDK
//
//  Created by Minsoo Kim on 2015. 12. 23..
//  Copyright © 2015 CstLex. All rights reserved.
//

#import "MSCCourse.h"

typedef void (^MSCCourseLoadSuccessBlock)(id response);
typedef void (^MSCCourseLoadErrorBlock)(NSError *error);

@interface MSCCourseKit : MSCobaltKit

#pragma List
+ (void)getCourseListWithSuccess:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error;

+ (void)getCourseListWithLimit:(int)limit success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error;

+ (void)getCourseListWithLimit:(int)limit sort:(NSArray *)sortKeys success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error;

+ (void)getCourseListWithSkip:(int)skip success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error;

+ (void)getCourseListWithSkip:(int)skip sort:(NSArray *)sortKeys success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error;

+ (void)getCourseListWithSort:(NSArray *)sortKeys success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error;

+ (void)getCourseListWithSkip:(int)skip limit:(int)limit success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error;

+ (void)getCourseListWithSkip:(int)skip limit:(int)limit sort:(NSArray *)sortKeys success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)errorHandler;

#pragma Search
+ (void)searchWithQuery:(NSString *)query success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error;

+ (void)searchWithQuery:(NSString *)query limit:(int)limit success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error;

+ (void)searchWithQuery:(NSString *)query skip:(int)skip success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error;

+ (void)searchWithQuery:(NSString *)query sort:(NSArray *)sortKeys success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error;

+ (void)searchWithQuery:(NSString *)query limit:(int)limit skip:(int)skip success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error;

+ (void)searchWithQuery:(NSString *)query limit:(int)limit sort:(NSArray *)sortKeys success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error;

+ (void)searchWithQuery:(NSString *)query skip:(int)skip sort:(NSArray *)sortKeys success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error;

+ (void)searchWithQuery:(NSString *)query limit:(int)limit skip:(int)skip sort:(NSArray *)sortKeys success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error;

@end
