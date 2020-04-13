//
//  FionaData.m
//  FionaAppleSongs
//
//  Created by Guadalupe Vlcek on 12/04/2020.
//  Copyright © 2020 gvlcek. All rights reserved.
//

#import "FionaData.h"

@implementation FionaData

- (instancetype)initWithDict:(NSDictionary*)dict {
    if (self = [super init]) {
        self.artworkUrl100 = [dict objectForKey: @"artworkUrl100"];
        self.collectionName = [dict objectForKey: @"collectionName"];
        self.trackName = [dict objectForKey: @"trackName"];
    }
    return self;
}
@end
