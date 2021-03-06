//
//  TopicCell.m
//  Snippets
//
//  Created by James Heng on 10/12/13.
//  Copyright (c) 2013 Snippets. All rights reserved.
//

#import "TopicCell.h"
#import "Topic.h"

#import "UIColor+Snippets.h"

@implementation TopicCell

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.isSynced = NO;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)setTopic:(Topic *)topic
{
    _topic = topic;
    
    [self.topicNameLabel setText:_topic.name];
    [self.description setText:_topic.description];
}

- (void)setPercent:(NSInteger)percent
{
    _percent = percent;

    if (_percent >= 100) {
        self.isSynced = YES;
        return;
    }
    
    [self.chooseButton setTitle:[NSString stringWithFormat:@"%ld %%", (long)_percent]
                       forState:UIControlStateNormal];
}

- (void)setIsSynced:(BOOL)isSynced
{
    _isSynced = isSynced;
    
    [self.chooseButton setHidden:_isSynced];
    self.accessoryType = (isSynced) ? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;
}

- (void)reset
{
    [self.chooseButton setTitle:((ChooseButton *) self.chooseButton).defaultTitle
                       forState:UIControlStateNormal];
}

@end

#pragma mark - Helpers Subclasses

@implementation ChooseButton

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.layer.borderWidth = 1;
        self.layer.borderColor = [[UIColor colorWithHexString:@"#f16353" alpha:1] CGColor];
        self.layer.cornerRadius = 3;
        self.defaultTitle = self.titleLabel.text;
    }
    return self;
}

@end
