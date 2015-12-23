//
//  MSCobaltKit.m
//  CobaltiOSSDK
//
//  Created by Minsoo Kim on 2015. 12. 23..
//  Copyright © 2015 CstLex. All rights reserved.
//

#import "MSCobaltKit.h"

@implementation MSCobaltKit

static NSString *apiKey;

+ (void)setApiKey:(NSString *)_apiKey {
    apiKey = _apiKey;
}

- (void)performRequestWithUrl:(NSString *)url parameters:(NSMutableDictionary *)param onCompletion:(MSCRequestDoneBlock)handler {
    if (apiKey == nil){
        [NSException raise:@"Cobalt API KEY is not initialized" format:@"Cobalt API KEY must be initialized before using"];
    }
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [param setObject:apiKey forKey:@"key"];
    
    [manager GET:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        handler(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        handler(nil, error);
    }];
}

@end
