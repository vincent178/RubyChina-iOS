//
//  TopicsCell.h
//  RubyChina-for-IOS
//
//  Created by Vincent on 13-7-29.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicsCell : UITableViewCell
{
    UILabel *nameLabel;
    UILabel *topicLabel;
    UIImageView *avatar;
}

- (void) setTopicsCell:(NSDictionary *)cellContent;
@end
