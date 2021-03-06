//
//  TopicCellWithWebView.h
//  Ruby-China-iOS
//
//  Created by Liang Huang on 10/23/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTAttributedTextView.h"
#import "DTAttributedTextContentView.h"
#import "DTAttributedLabel.h"

@interface TopicDetailCell : UITableViewCell <UIWebViewDelegate, DTAttributedTextContentViewDelegate> {
    UIImageView *avatarImageView;
    UILabel *userNickNameLabel;
    UILabel *topicCreatedAtLabel;
    UILabel *topicTitleLabel;
    DTAttributedTextContentView *topicDetailView;
}

@property (nonatomic, assign) CGFloat cellHeight;


- (void)setupWithTopicDetail:(NSDictionary *)topicDetail;

@end


