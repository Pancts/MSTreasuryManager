//
//  MSBaseButton.m
//  MSTreasuryManager
//
//  Created by apple on 16/10/12.
//  Copyright © 2016年 邓利文. All rights reserved.
//

#import "MSBaseButton.h"

@implementation MSBaseButton

- (instancetype)initWithTitle:(NSString *)title {
    if (self = [super init]) {
        [self setTitle:title forState:(UIControlStateNormal)];
        [self.titleLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
        [self setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [self setBackgroundColor:kTitleColor];
        self.layer.cornerRadius = 8;
    }
    return self;
}

@end
