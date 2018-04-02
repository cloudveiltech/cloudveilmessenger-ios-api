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
    
    NSInteger* userID = 304115087;
    
    [[TGUserController shared] setWithUserID:userID];
    [[TGUserController shared] setWithUserName:@"damienissa"];
    [[TGUserController shared] setWithUserPhoneNumber:@"380994502491"];
    
    [[MainController shared] getSettings];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
