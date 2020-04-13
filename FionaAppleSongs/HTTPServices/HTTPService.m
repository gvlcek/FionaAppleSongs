//
//  HTTPService.m
//  FionaAppleSongs
//
//  Created by Guadalupe Vlcek on 12/04/2020.
//  Copyright © 2020 gvlcek. All rights reserved.
//

#import "HTTPService.h"

#define URL_BASE "https://itunes.apple.com/search?media=music&term=Fiona+Apple"

@implementation HTTPService

+ (id) instance {
    static HTTPService *sharedInstance = nil;
    @synchronized (self) {
        if (sharedInstance == nil)
            sharedInstance = [[self alloc] init];
    }
    return sharedInstance;
}

- (void) getData:(nullable onComplete) completionHandler {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%s", URL_BASE]];
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
        if (data) {
            NSError *err;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&err];
            if (err == nil) {
                completionHandler(json, nil);
            } else {
                completionHandler(nil, @"Try again");
            }
        } else {
            NSLog(@"Network error: %@", error.debugDescription);
            completionHandler(nil, @"Server connection problem");
        }
    }] resume];
}

@end
