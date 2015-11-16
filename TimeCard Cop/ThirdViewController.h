//
//  ThirdViewController.h
//  TimeCard Cop
//
//  Created by Ryan S Truran on 11/1/15.
//  Copyright © 2015 Trü App Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController

- (IBAction)deleteAction:(UIBarButtonItem *)sender;
- (IBAction)updateAction:(UIBarButtonItem *)sender;

@property (weak, nonatomic) IBOutlet UITextField *projectCodeUpdate;
@property (weak, nonatomic) IBOutlet UITextField *taskCodeUpdate;
@property (weak, nonatomic) IBOutlet UITextField *favoriteCodeUpdate;
@property (weak, nonatomic) IBOutlet UILabel *hourUpdate;
@property (weak, nonatomic) IBOutlet UISlider *hourSliderUpdate;

@property (strong,nonatomic) NSMutableArray *projectArray;
@property (strong,nonatomic) NSMutableArray *taskArray;
@property (strong,nonatomic) NSMutableArray *favoriteArray;
@property (strong,nonatomic) NSMutableArray *hourArray;

@property (strong,nonatomic) NSArray *savedProjectArray;
@property (strong,nonatomic) NSArray *savedTaskArray;
@property (strong,nonatomic) NSArray *savedFavoriteArray;
@property (strong,nonatomic) NSArray *savedHourArray;

@end
