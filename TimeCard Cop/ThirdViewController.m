//
//  ThirdViewController.m
//  TimeCard Cop
//
//  Created by Ryan S Truran on 11/1/15.
//  Copyright © 2015 Trü App Dev. All rights reserved.
//

#import "ThirdViewController.h"

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *savedProjectArray = [userDefaults objectForKey:@"projectArray"];
    NSArray *savedTaskArray = [userDefaults objectForKey:@"taskArray"];
    NSArray *savedFavoriteArray = [userDefaults objectForKey:@"favoriteArray"];
    NSArray *savedHourArray = [userDefaults objectForKey:@"hourArray"];
    NSInteger buttonPress = [userDefaults integerForKey:@"buttonPress"];
    NSLog(@"%li",(long)buttonPress);
    NSLog(@"%@",savedProjectArray[buttonPress-1]);
    
    NSString *projectCode = ("%@",self.savedProjectArray[buttonPress-1]);
    
    self.projectCodeUpdate.text = self.savedProjectArray[buttonPress-1];
    self.taskCodeUpdate.text = self.savedTaskArray[buttonPress-1];
    self.hourUpdate.text = self.savedHourArray[buttonPress-1];
    self.favoriteCodeUpdate.text = self.savedFavoriteArray[buttonPress-1];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)deleteAction:(UIBarButtonItem *)sender {
    
    
}

- (IBAction)updateAction:(UIBarButtonItem *)sender {



}

@end
