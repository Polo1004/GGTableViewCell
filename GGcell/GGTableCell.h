//
//  GGTableCell.h
//  GGcell
//
//  Created by GQuEen on 16/8/17.
//  Copyright © 2016年 GegeChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "GGCellModel.h"

typedef NS_ENUM(NSInteger, GGShowCellTextType) {
    GGShowCellTextTypeNormal,
    GGShowCellTextTypeExpend,
};

@interface GGTableCell : UITableViewCell

@property (strong, nonatomic) GGCellModel *model;

@property (assign, nonatomic) GGShowCellTextType cellType;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
- (void)clickCell;

@end
