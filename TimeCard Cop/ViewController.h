//
//  ViewController.h
//  TimeCard Cop
//
//  Created by Ryan S Truran on 11/1/15.
//  Copyright © 2015 Trü App Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *sumLabel;
@property (strong,nonatomic) NSMutableArray *projectArray;
@property (strong,nonatomic) NSMutableArray *taskArray;
@property (strong,nonatomic) NSMutableArray *favoriteArray;
@property (strong,nonatomic) NSMutableArray *hourArray;
@property (strong,nonatomic) NSMutableArray *dateArray;
@property (strong,nonatomic) NSArray *uniqDate;
@property (weak, nonatomic) IBOutlet UILabel *displayedTitle;
- (IBAction)timeCardCop:(UIButton *)sender;

@property (strong,nonatomic) NSArray *savedProjectArray;
@property (strong,nonatomic) NSArray *savedTaskArray;
@property (strong,nonatomic) NSArray *savedFavoriteArray;
@property (strong,nonatomic) NSArray *savedHourArray;
@property (strong,nonatomic) NSArray *savedDateArray;

@property (weak, nonatomic) IBOutlet UILabel *project1;
@property (weak, nonatomic) IBOutlet UILabel *task1;
@property (weak, nonatomic) IBOutlet UILabel *hours1;

@property (weak, nonatomic) IBOutlet UILabel *project2;
@property (weak, nonatomic) IBOutlet UILabel *task2;
@property (weak, nonatomic) IBOutlet UILabel *hours2;

@property (weak, nonatomic) IBOutlet UILabel *project3;
@property (weak, nonatomic) IBOutlet UILabel *task3;
@property (weak, nonatomic) IBOutlet UILabel *hours3;

@property (weak, nonatomic) IBOutlet UILabel *project4;
@property (weak, nonatomic) IBOutlet UILabel *task4;
@property (weak, nonatomic) IBOutlet UILabel *hours4;

@property (weak, nonatomic) IBOutlet UILabel *project5;
@property (weak, nonatomic) IBOutlet UILabel *task5;
@property (weak, nonatomic) IBOutlet UILabel *hours5;

@property (weak, nonatomic) IBOutlet UILabel *project6;
@property (weak, nonatomic) IBOutlet UILabel *task6;
@property (weak, nonatomic) IBOutlet UILabel *hours6;

@property (weak, nonatomic) IBOutlet UILabel *project7;
@property (weak, nonatomic) IBOutlet UILabel *task7;
@property (weak, nonatomic) IBOutlet UILabel *hours7;

@property (weak, nonatomic) IBOutlet UILabel *project8;
@property (weak, nonatomic) IBOutlet UILabel *task8;
@property (weak, nonatomic) IBOutlet UILabel *hours8;

@property (weak, nonatomic) IBOutlet UILabel *project9;
@property (weak, nonatomic) IBOutlet UILabel *task9;
@property (weak, nonatomic) IBOutlet UILabel *hours9;

@property (weak, nonatomic) IBOutlet UILabel *project10;
@property (weak, nonatomic) IBOutlet UILabel *task10;
@property (weak, nonatomic) IBOutlet UILabel *hours10;

@property (weak, nonatomic) IBOutlet UILabel *project11;
@property (weak, nonatomic) IBOutlet UILabel *task11;
@property (weak, nonatomic) IBOutlet UILabel *hours11;

@property (weak, nonatomic) IBOutlet UILabel *project12;
@property (weak, nonatomic) IBOutlet UILabel *task12;
@property (weak, nonatomic) IBOutlet UILabel *hours12;

@property (weak, nonatomic) IBOutlet UILabel *project13;
@property (weak, nonatomic) IBOutlet UILabel *task13;
@property (weak, nonatomic) IBOutlet UILabel *hours13;

- (IBAction)Button1:(UIButton *)sender;
- (IBAction)Button2:(UIButton *)sender;
- (IBAction)Button3:(UIButton *)sender;
- (IBAction)Button4:(UIButton *)sender;
- (IBAction)Button5:(UIButton *)sender;
- (IBAction)Button6:(UIButton *)sender;
- (IBAction)Button7:(UIButton *)sender;
- (IBAction)Button8:(UIButton *)sender;
- (IBAction)Button9:(UIButton *)sender;
- (IBAction)Button10:(UIButton *)sender;
- (IBAction)Button11:(UIButton *)sender;
- (IBAction)Button12:(UIButton *)sender;
- (IBAction)Button13:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *Button1;
@property (weak, nonatomic) IBOutlet UIButton *Button2;
@property (weak, nonatomic) IBOutlet UIButton *Button3;
@property (weak, nonatomic) IBOutlet UIButton *Button4;
@property (weak, nonatomic) IBOutlet UIButton *Button5;
@property (weak, nonatomic) IBOutlet UIButton *Button6;
@property (weak, nonatomic) IBOutlet UIButton *Button7;
@property (weak, nonatomic) IBOutlet UIButton *Button8;
@property (weak, nonatomic) IBOutlet UIButton *Button9;
@property (weak, nonatomic) IBOutlet UIButton *Button10;
@property (weak, nonatomic) IBOutlet UIButton *Button11;
@property (weak, nonatomic) IBOutlet UIButton *Button12;
@property (weak, nonatomic) IBOutlet UIButton *Button13;

@end

