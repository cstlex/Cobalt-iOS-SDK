//
//  MSCTime.h
//  CobaltiOSSDK
//
//  Created by Minsoo Kim on 2015. 12. 23..
//  Copyright © 2015년 CstLex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSCTime : NSObject

@property (strong, readonly) NSString *dayString;
@property (assign, readonly) int day;
@property (assign, readonly) int start;
@property (assign, readonly) int end;
@property (assign, readonly) int duration;
@property (strong, readonly) NSString *location;

- (instancetype)initWithData:(NSDictionary *)data;

@end
