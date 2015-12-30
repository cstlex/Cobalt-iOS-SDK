//
//  MSCCourseKit.h
//  CobaltiOSSDK
//
//  Created by Minsoo Kim on 2015. 12. 23..
//  Copyright © 2015 CstLex. All rights reserved.
//

#import "MSCobaltKit.h"

typedef void (^MSCCourseLoadSuccessBlock)(id response);
typedef void (^MSCCourseLoadErrorBlock)(NSError *error);

@interface MSCCourseKit : MSCobaltKit

+ (void)getCourseListWithSuccess:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error;

+ (void)getCourseListWithLimit:(int)limit success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error;

+ (void)getCourseListWithLimit:(int)limit sort:(NSArray *)sortKeys success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error;

+ (void)getCourseListWithSkip:(int)skip success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error;

+ (void)getCourseListWithSkip:(int)skip sort:(NSArray *)sortKeys success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error;

+ (void)getCourseListWithSort:(NSArray *)sortKeys success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error;

+ (void)getCourseListWithSkip:(int)skip limit:(int)limit success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)error;

+ (void)getCourseListWithSkip:(int)skip limit:(int)limit sort:(NSArray *)sortKeys success:(MSCCourseLoadSuccessBlock)success error:(MSCCourseLoadErrorBlock)errorHandler;

@end
