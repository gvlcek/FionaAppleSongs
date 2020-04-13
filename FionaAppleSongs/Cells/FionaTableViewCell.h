//
//  FionaTableViewCell.h
//  FionaAppleSongs
//
//  Created by Guadalupe Vlcek on 12/04/2020.
//  Copyright © 2020 gvlcek. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FionaData;

NS_ASSUME_NONNULL_BEGIN

@interface FionaTableViewCell : UITableViewCell
- (void) populate:(FionaData*)data;
@end

NS_ASSUME_NONNULL_END
