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

+ (NSString *)apiKey {
    return apiKey;
}

+ (void)performRequestWithUrl:(NSString *)url parameters:(NSMutableDictionary *)param onCompletion:(MSCRequestDoneBlock)handler {
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

+ (MSCCampus)campusFromString:(NSString *)campus {
    MSCCampus campusValue = MSCCampusStGeorge;
    if ([campus isEqualToString:@"UTM"]){
        campusValue = MSCCampusMissisagua;
    } else if ([campus isEqualToString:@"UTSC"]){
        campusValue = MSCCampusScarborough;
    }
    return campusValue;
}

+ (NSString *)stringFromCampus:(MSCCampus)campus {
    NSString *campusString;
    switch (campus) {
        case MSCCampusStGeorge:
            campusString = @"UTSG";
            break;
            
        case MSCCampusMissisagua:
            campusString = @"UTM";
            break;
            
        case MSCCampusScarborough:
            campusString = @"UTSC";
            break;
            
        default:
            break;
    }
    return campusString;
}

@end
