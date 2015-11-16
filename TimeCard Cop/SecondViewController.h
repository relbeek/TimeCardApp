//
//  SecondViewController.h
//  TimeCard Cop
//
//  Created by Ryan S Truran on 11/1/15.
//  Copyright © 2015 Trü App Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *projectCode;
@property (weak, nonatomic) IBOutlet UITextField *taskCode;
@property (weak, nonatomic) IBOutlet UITextField *favoriteCode;
@property (strong,nonatomic) NSMutableArray *projectArray;
@property (strong,nonatomic) NSMutableArray *taskArray;
@property (strong,nonatomic) NSMutableArray *favoriteArray;
@property (strong,nonatomic) NSMutableArray *hourArray;
@property (strong,nonatomic) NSMutableArray *projectMutableArray;
@property (strong,nonatomic) NSMutableArray *taskMutableArray;
@property (strong,nonatomic) NSMutableArray *favoriteMutableArray;
@property (strong,nonatomic) NSMutableArray *hourMutableArray;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *addChargeCode;
@property (weak, nonatomic) IBOutlet UISlider *hourSlider;
@property (weak, nonatomic) IBOutlet UILabel *hourLabel;
@property (strong,nonatomic) NSArray *savedProjectArray;
@property (strong,nonatomic) NSArray *savedTaskArray;
@property (strong,nonatomic) NSArray *savedFavoriteArray;
@property (strong,nonatomic) NSArray *savedHourArray;
@property (strong,nonatomic) NSArray *tempMemoryProjectArray;
@property (strong,nonatomic) NSArray *tempMemoryTaskArray;
@property (strong,nonatomic) NSArray *tempMemoryFavoriteArray;
@property (strong,nonatomic) NSArray *tempMemoryHourArray;
@property (strong, nonatomic) NSArray *uniqProject;
@property (strong, nonatomic) NSArray *uniqTask;
- (IBAction)clearTempMemory:(id)sender;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@end
