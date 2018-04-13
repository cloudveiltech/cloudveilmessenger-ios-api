//
//  ViewController.m
//  test
//
//  Created by Dima Virych on 02.04.2018.
//  Copyright © 2018 Requestum. All rights reserved.
//

#import "ViewController.h"

#import <SecurityManager/SecurityManager.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _bot = [TGRow alloc];
    _bot.objectID = 12;
    _bot.title = @"Bot";
    _bot.userName = @"Bot";
    _botTwo = [TGRow alloc];
    _botTwo.objectID = 13;
    _botTwo.title = @"Bot";
    _botTwo.userName = @"Bot";
    NSArray* bots = [NSArray arrayWithObjects:_bot, _botTwo, nil];
    
    [[MainController shared] getSettingsWithGroups:bots bots:bots channels:bots];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
