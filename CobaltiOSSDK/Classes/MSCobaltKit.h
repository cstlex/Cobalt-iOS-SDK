//
//  MSCobaltKit.h
//  CobaltiOSSDK
//
//  Created by Minsoo Kim on 2015. 12. 23..
//  Copyright © 2015 CstLex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

typedef void (^MSCRequestDoneBlock)(id response, NSError *error);

@interface MSCobaltKit : NSObject

+ (void)setApiKey:(NSString *)apiKey;

- (void)performRequestWithUrl:(NSString *)url parameters:(NSMutableDictionary *)param onCompletion:(MSCRequestDoneBlock)handler;

@end
