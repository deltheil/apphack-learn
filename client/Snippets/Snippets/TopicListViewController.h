//
//  ThemeTableViewController.h
//  Snippets
//
//  Created by James Heng on 10/12/13.
//  Copyright (c) 2013 Snippets. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WNCDatabase;

@interface TopicListViewController : UITableViewController

@property (strong, nonatomic) WNCDatabase *database;

@end
