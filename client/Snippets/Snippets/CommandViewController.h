//
//  CommandViewController.h
//  Snippets
//
//  Created by James Heng on 09/12/13.
//  Copyright (c) 2013 Snippets. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Command;

@interface CommandViewController : UIViewController

@property (strong, nonatomic) Command *command;
@property (strong, nonatomic) NSString *htmlDoc;

@end
