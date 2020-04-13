//
//  HTTPService.h
//  FionaAppleSongs
//
//  Created by Guadalupe Vlcek on 12/04/2020.
//  Copyright © 2020 gvlcek. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^onComplete)(NSDictionary *__nullable dataDict , NSString *__nullable errMessage);

@interface HTTPService : NSObject
+ (id) instance;
- (void) getData:(nullable onComplete) completionHandler;
@end

NS_ASSUME_NONNULL_END
