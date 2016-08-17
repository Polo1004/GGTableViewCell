//
//  GGTableCell.m
//  GGcell
//
//  Created by GQuEen on 16/8/17.
//  Copyright © 2016年 GegeChen. All rights reserved.
//

#import "GGTableCell.h"

@interface GGTableCell ()

@property (strong, nonatomic) UILabel *normalLabel;
@property (strong, nonatomic) UILabel *expandLabel;
@property (strong, nonatomic) UITableView *superTableView;

@end


@implementation GGTableCell

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupContentView];
    }
    return self;

}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *identify = @"cell";
    GGTableCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[GGTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        cell.superTableView = tableView;
    }
    return cell;
}

- (void)setupContentView {
    _normalLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 375-20, 0)];
    _expandLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 375-20, 0)];
    
    
    _normalLabel.textColor = [UIColor grayColor];
    _expandLabel.textColor = [UIColor blackColor];
    
    _normalLabel.font = [UIFont systemFontOfSize:14];
    _expandLabel.font = [UIFont systemFontOfSize:14];
    
    _normalLabel.numberOfLines = 4;
    _expandLabel.numberOfLines = 0;
    
    _normalLabel.alpha = 1;
    _expandLabel.alpha = 0;
    
    [self.contentView addSubview:_normalLabel];
    [self.contentView addSubview:_expandLabel];
    
}

- (void)setModel:(GGCellModel *)model {
    _model = model;
    [self setupData];
}

- (void)setupData {
    self.cellType = self.model.cellType;
    
    if (self.cellType) {
        _normalLabel.alpha = 0;
        _expandLabel.alpha = 1;
        _normalLabel.frame = CGRectMake(10, 10, 375-20, 10);
        _expandLabel.frame = CGRectMake(10, 10, 375-20, 10);
    }else {
        _normalLabel.alpha = 1;
        _expandLabel.alpha = 0;
        _normalLabel.frame = CGRectMake(10, 10, 375-20, 10);
        _expandLabel.frame = CGRectMake(10, 10, 375-20, 10);

    }
    
    _normalLabel.text = self.model.contentStr;
    _expandLabel.text = self.model.contentStr;
    
    [_normalLabel sizeToFit];
    [_expandLabel sizeToFit];
    
}

- (void)clickCell {
    switch (self.cellType) {
        case GGShowCellTextTypeNormal:
            
            self.cellType = GGShowCellTextTypeExpend;
            self.model.cellType = GGShowCellTextTypeExpend;
            self.model.cellHeigh = self.model.expandHeigh;
            [self cellAnimate:0];
            
            [self.superTableView beginUpdates];
            [self.superTableView endUpdates];
            
            break;
        case GGShowCellTextTypeExpend:
            self.cellType = GGShowCellTextTypeNormal;
            self.model.cellType = GGShowCellTextTypeNormal;
            
            self.model.cellHeigh = self.model.normalHeigh;
            [self cellAnimate:1];
            [self.superTableView beginUpdates];
            [self.superTableView endUpdates];
            break;
        default:
            break;
    }
}

- (void)cellAnimate:(NSInteger)cellType {
    if (cellType == 0) {
        [UIView animateWithDuration:0.35f animations:^{
            _expandLabel.alpha = 1;
            _normalLabel.alpha = 0;
        } completion:^(BOOL finished) {
            
        }];
    }else if (cellType == 1) {
        [UIView animateWithDuration:0.35f animations:^{
            _expandLabel.alpha = 0;
            _normalLabel.alpha = 1;
        } completion:^(BOOL finished) {
            
        }];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
