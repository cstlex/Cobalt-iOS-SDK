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
typedef void (^MSCFetchDoneBlock)(NSError *error);

typedef NS_ENUM(NSInteger, MSCCampus){
    MSCCampusStGeorge = 0,
    MSCCampusMissisagua,
    MSCCampusScarborough
};

@protocol MSCFetchable <NSObject>

@required
@property (assign, readonly) BOOL dataAvailable;

- (void)fetch;
- (void)fetchIfNeeded;
- (void)fetchInBackground;
- (void)fetchIfNeededInBackground;
- (void)fetchInBackgroundWithCompletion:(MSCFetchDoneBlock)completion;
- (void)fetchIfNeededInBackgroundWithCompletion:(MSCFetchDoneBlock)completion;

@end

@interface MSCobaltKit : NSObject

+ (void)setBaseUrl:(NSString *)baseUrl;
+ (NSString *)baseUrl;

+ (void)setApiKey:(NSString *)apiKey;
+ (NSString *)apiKey;

+ (void)performRequestWithUrl:(NSString *)url parameters:(NSMutableDictionary *)param onCompletion:(MSCRequestDoneBlock)handler;

+ (MSCCampus)campusFromString:(NSString *)campus;
+ (NSString *)stringFromCampus:(MSCCampus)campus;

@end
