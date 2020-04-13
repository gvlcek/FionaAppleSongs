//
//  FionaTableViewCell.m
//  FionaAppleSongs
//
//  Created by Guadalupe Vlcek on 12/04/2020.
//  Copyright © 2020 gvlcek. All rights reserved.
//

#import "FionaData.h"
#import "FionaTableViewCell.h"

@interface FionaTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@end

@implementation FionaTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.mainImageView.layer setCornerRadius: 12.0];
}

// Mark: Class Methods

- (void)populate:(nonnull FionaData*)data {
    self.titleLabel.text = data.trackName;
    self.descriptionLabel.text = data.collectionName;
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[ NSURL URLWithString: data.artworkUrl100]]];
    self.mainImageView.image = image;
}

@end
