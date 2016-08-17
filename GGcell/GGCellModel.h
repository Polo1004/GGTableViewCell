//
//  GGCellModel.h
//  GGcell
//
//  Created by GQuEen on 16/8/17.
//  Copyright © 2016年 GegeChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GGCellModel : NSObject

@property (copy, nonatomic) NSString *contentStr;

@property (assign ,nonatomic) CGFloat cellHeigh;

@property (assign, nonatomic) CGFloat normalHeigh;
@property (assign, nonatomic) CGFloat expandHeigh;

@property (assign, nonatomic) NSInteger cellType;

- (instancetype)initWithContentString:(NSString *)string;

@end
