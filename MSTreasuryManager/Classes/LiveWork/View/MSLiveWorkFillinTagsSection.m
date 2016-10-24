//
//  MSLiveWorkFillinTagsSection.m
//  MSTreasuryManager
//
//  Created by 邓利文 on 2016/10/22.
//  Copyright © 2016年 邓利文. All rights reserved.
//

#import "MSLiveWorkFillinTagsSection.h"
#import "YZTagList.h"

@interface MSLiveWorkFillinTagsSection ()

@property (nonatomic, strong) YZTagList *tagList;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *placeholder;

@end

@implementation MSLiveWorkFillinTagsSection

- (instancetype)initWithTitle:(NSString *)title placeholder:(NSString *)placeholder {
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        _title = title;
        _placeholder = placeholder;
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    
    UILabel *titleLabel1 = ({
        UILabel *label = [[UILabel alloc]init];
        [self addSubview:label];
        label.text = self.title;
        [label sizeToFit];
        
        label;
    });
    
    UIView *line1 = ({
        UIView *view = [[UIView alloc]init];
        [self addSubview:view];
        view.backgroundColor = kBackgroundColor;
        view;
    });
    
    _addBtn = ({
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeContactAdd)];
        [btn setTintColor:kTitleColor];
        [self addSubview:btn];
        btn;
    });
    
    [titleLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(40);
        make.width.mas_lessThanOrEqualTo(kSCREEN_WIDTH);
    }];
    
    [_addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-15);
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.centerY.equalTo(titleLabel1);
    }];
    
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(kSCREEN_WIDTH);
        make.top.equalTo(titleLabel1.mas_bottom).offset(0);
        make.left.mas_equalTo(15);
        make.height.mas_equalTo(1);
    }];
    
    // 创建标签列表
    YZTagList *tagList = [[YZTagList alloc] init];
    _tagList = tagList;
    
    // 点击标签，就会调用,点击标签，删除标签
    __weak typeof(_tagList) weakTagList = _tagList;
    _tagList.clickTagBlock = ^(NSString *tag){
        [weakTagList deleteTag:tag];
    };
    
    // 设置标签背景色
    tagList.tagBackgroundColor = kTitleColor;
    // 设置标签颜色
    tagList.tagColor = [UIColor whiteColor];
    // 设置标签删除图片
    tagList.tagDeleteimage = [UIImage imageNamed:@"chose_tag_close_icon"];
    [self addSubview:tagList];
    
    [tagList mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLabel1);
        make.right.equalTo(self).offset(-20);
        make.top.equalTo(line1.mas_bottom).offset(8);
        make.height.mas_greaterThanOrEqualTo(40);
    }];
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(tagList.mas_bottom).offset(8);
    }];
    
}

- (void)addUser:(NSString *)user {
    [self.tagList addTag:user];
    CGFloat height = self.tagList.height;
    [self.tagList mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(height);
    }];
}

- (NSArray *)users {
    return self.tagList.tagArray;
}

@end