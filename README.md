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

```Objective-C
[MSCCourseKit searchWithQuery:@"Introduction" skip:0 limit:200 sort:@[@"+department"] success^(NSArray *response){
	//Use array of MSCCourse object
} error:^(NSError *error){
	NSLog(@"%@", error);
}];
```

```Objective-C
Correspond to courses/show/:id

MSCCourse *course = [MSCCourse objectWithCourseId:@"CSC148H1F20159"];
[course fetchIfNeededInBackgroundWithCompletion:^(NSError *error){
	if (error) {
		NSLog(@"%@", error);
	} else {
		//Use course instance
	}
}];
```

##Unimplemented Parts
Currently Building and filter of Course is not implemented but will be implemented soon