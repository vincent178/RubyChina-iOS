//
//  RCTopicCell.m
//  RubyChina-iOS
//
//  Created by Liang Huang on 6/28/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import "RCTopicCell.h"
#import "NSString+DynamicHeight.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "NSDate+DateTools.h"

@interface RCTopicCell()

@property (nonatomic, strong) NSDateFormatter *dateFormatter;

@property (nonatomic, strong) UIImageView *avatarView;
@property (nonatomic, strong) UILabel *replyNumberLabel;
@property (nonatomic, strong) UILabel *usernameLabel;

@end

@implementation RCTopicCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.dateFormatter = [[NSDateFormatter alloc] init];
        self.dateFormatter.dateFormat = @"yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSSZZZ";
        
        
        self.frame = CGRectMake(0, 0, _size.width, _size.height);
        self.layer.opacity = 1.0;
        
        // 1. avatar image view
        self.avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 18.5, 30, 30)];
        self.avatarView.layer.opacity = 1.0;
        self.avatarView.layer.cornerRadius = 5.0;
        self.avatarView.clipsToBounds = YES;
        [self addSubview:self.avatarView];
        
        
        // 2. reply number view
        UIImageView *replyLabelBackgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(273, 25.5, 37.5, 15)];
        replyLabelBackgroundView.layer.opacity = 1.0;
        self.replyNumberLabel = [[UILabel alloc] initWithFrame:replyLabelBackgroundView.frame];
        self.replyNumberLabel.layer.opacity = 1.0;
        replyLabelBackgroundView.image = [UIImage imageNamed:@"reply_number_bg.png"];
        self.replyNumberLabel.textAlignment = NSTextAlignmentCenter;
        self.replyNumberLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:12];
        self.replyNumberLabel.backgroundColor = [UIColor clearColor];
        self.replyNumberLabel.textColor = [UIColor whiteColor];
        [self addSubview:replyLabelBackgroundView];
        [self addSubview:self.replyNumberLabel];
        
        
        // 3. username view
        self.usernameLabel = [[UILabel alloc] initWithFrame:CGRectMake(48, 14, 100, 18)];
        self.usernameLabel.layer.opacity = 1.0;
        self.usernameLabel.font =[UIFont fontWithName:@"Helvetica Neue" size:16];
        self.usernameLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.usernameLabel];
        
    }
    return self;
}

- (void)setup {
    

    

    [self.avatarView setImageWithURL:[NSURL URLWithString:self.avatarURL] placeholderImage:[UIImage imageNamed:@"nobody.png"]];
    
    self.replyNumberLabel.text = self.replyNumber;
    self.usernameLabel.text = self.username;


    //TODO: 4. category view
    UILabel *nodenameLabel = [[UILabel alloc] initWithFrame:CGRectMake(48, 37.5, 0, 15)];
    nodenameLabel.text = self.nodeName;
    nodenameLabel.font = [UIFont systemFontOfSize:9];
    nodenameLabel.layer.opacity = 1.0;
    [nodenameLabel sizeToFit];
    [self addSubview:nodenameLabel];
    
    
    //TODO: 5. replied time ago
    if ([self.replyNumber intValue] > 0) {
        CGRect lastRepliedFrame = CGRectMake(nodenameLabel.frame.origin.x + nodenameLabel.frame.size.width + 6, 37.5, 0, 15);
        UILabel *repliedTimeAgoLabel = [[UILabel alloc] initWithFrame:lastRepliedFrame];
        repliedTimeAgoLabel.layer.opacity = 1.0;
        NSDate *lastRepliedDate = [[NSDate alloc] init];
        lastRepliedDate = [self.dateFormatter dateFromString:self.lastRepliedDate];
        NSString *timeAgoString = [lastRepliedDate timeAgoSinceNow];
        NSString *userRepiedTimeAgo = [NSString stringWithFormat:@"%@ replied in %@", self.lastRepliedUsername, timeAgoString];
        repliedTimeAgoLabel.text = userRepiedTimeAgo;
        repliedTimeAgoLabel.font = [UIFont systemFontOfSize:9];
        [repliedTimeAgoLabel sizeToFit];
        [self addSubview:repliedTimeAgoLabel];
    }

    
    // 6. topic title view
    UILabel *topicTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 58.5, 302.5, self.titleHeight)];
    topicTitleLabel.layer.opacity = 1.0;
    topicTitleLabel.text = self.topicTitle;
    topicTitleLabel.font = [UIFont systemFontOfSize:14];
    topicTitleLabel.textAlignment = NSTextAlignmentLeft;
    topicTitleLabel.numberOfLines = 0;
    topicTitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [topicTitleLabel sizeToFit];
    [self addSubview:topicTitleLabel];
    
}

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
