//
//  FionaViewController.m
//  FionaAppleSongs
//
//  Created by Guadalupe Vlcek on 12/04/2020.
//  Copyright © 2020 gvlcek. All rights reserved.
//

#import "HTTPService.h"
#import "FionaData.h"
#import "FionaViewController.h"
#import "FionaTableViewCell.h"

@interface FionaViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *fionaDataArray;
@end

@implementation FionaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fionaDataArray = [[NSArray alloc] init];
    
    [[HTTPService instance] getData:^(NSDictionary * _Nullable dataDict, NSString * _Nullable errMessage) {
        if (dataDict) {
            NSArray *dataArray = [dataDict objectForKey: @"results"];
            NSMutableArray *arr = [[NSMutableArray alloc] init];
            
            for (NSDictionary *dict in dataArray) {
                FionaData *fionaData = [[FionaData alloc] initWithDict:dict];
                [arr addObject:fionaData];
            }
            
            self.fionaDataArray = arr;
            [self updateTableData];
        } else if (errMessage) {
            //Alert
        }
    }];
}

// Mark: Class Methods

- (void)updateTableData {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

// Mark: UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.fionaDataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FionaData *fionaData = [self.fionaDataArray objectAtIndex:indexPath.row];
    FionaTableViewCell *cell = (FionaTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"FionaTableViewCell"];
    [cell populate:fionaData];
    return cell;
}

@end
