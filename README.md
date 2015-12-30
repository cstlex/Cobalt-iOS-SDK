# Cobalt-iOS-SDK

Unofficial [Coblat](https://github.com/cobalt-uoft/cobalt) iOS SDK

##Setup

```Objective-C
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	[MSCobaltKit setApiKey:@"YOUR-COBALT-KEY"]
	
	//Only when you do self hosting
	[MSCobaltKit setBaseUrl:@"BASE-URL"]
}
```

##Usage

```Objective-C
[MSCCourseKit getCourseListWithSkip:0 limit:20 sort:@[@"+department"] success:^(NSArray *response){
	//Use array of MSCCourse object
} error:^(NSError *error){
	NSLog(@"%@", error);
}];
```