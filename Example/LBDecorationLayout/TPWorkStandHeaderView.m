//
//  TPWorkStandHeaderView.m
//  ThePaperSpcsc
//
//  Created by liubo on 2023/5/17.
//

#import "TPWorkStandHeaderView.h"
#import <Masonry/Masonry.h>

@interface TPWorkStandHeaderView ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation TPWorkStandHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.centerY.mas_equalTo(0);
    }];
}

#pragma mark - lazy load

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.numberOfLines = 0;
        _titleLabel.text = @"代表履职";
    }
    return _titleLabel;
}

@end
