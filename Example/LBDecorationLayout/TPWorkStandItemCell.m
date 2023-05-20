//
//  TPWorkStandItemCell.m
//  ThePaperSpcsc
//
//  Created by liubo on 2023/5/17.
//

#import "TPWorkStandItemCell.h"
#import <Masonry/Masonry.h>

@interface TPWorkStandItemCell ()

@property (nonatomic, strong) UIImageView *imgView;

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation TPWorkStandItemCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
        [self setUpContraints];
    }
    return self;
}

- (void)setUpUI
{
    [self.contentView addSubview:self.imgView];
    [self.contentView addSubview:self.titleLabel];
    self.contentView.backgroundColor = [UIColor greenColor];
}

- (void)setUpContraints
{
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.width.height.mas_equalTo(48);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.equalTo(self.imgView.mas_bottom).with.offset(8);
        make.left.right.mas_equalTo(0);
    }];
}

#pragma mark - lazy load

- (UIImageView *)imgView
{
    if (!_imgView) {
        _imgView = [[UIImageView alloc] init];
    }
    return _imgView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.numberOfLines = 0;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"在线参与监督";
    }
    return _titleLabel;
}

@end
