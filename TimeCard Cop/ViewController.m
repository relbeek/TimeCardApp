//
//  ViewController.m
//  TimeCard Cop
//
//  Created by Ryan S Truran on 11/1/15.
//  Copyright © 2015 Trü App Dev. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.Button1.enabled = NO;
    self.Button2.enabled = NO;
    self.Button3.enabled = NO;
    self.Button4.enabled = NO;
    self.Button5.enabled = NO;
    self.Button6.enabled = NO;
    self.Button7.enabled = NO;
    self.Button8.enabled = NO;
    self.Button9.enabled = NO;
    self.Button10.enabled = NO;
    self.Button11.enabled = NO;
    self.Button12.enabled = NO;
    self.Button13.enabled = NO;
    
    NSInteger buttonPress = 0;

    NSLocale *en_US_POSIX = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    assert(en_US_POSIX != nil);
    
    // Set The Date and display on dateLabel
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:en_US_POSIX];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSDate *dateFromString = [[NSDate alloc] init];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM/d/yy"];
    NSString *theDate = [dateFormat stringFromDate:dateFromString];
    self.dateLabel.text = theDate;
    
    
    // Do any additional setup after loading the view, typically from a nib.
    //NSDate *today = [NSDate date];
    //self.dateLabel = (@"%i.d / %i.d / %i.d",[today day],[today month], [today year]);
    //dateLabel.text =
    //    NSDateComponents
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *savedProjectArray = [userDefaults objectForKey:@"projectArray"];
    NSArray *savedTaskArray = [userDefaults objectForKey:@"taskArray"];
    NSArray *savedFavoriteArray = [userDefaults objectForKey:@"favoriteArray"];
    NSArray *savedHourArray = [userDefaults objectForKey:@"hourArray"];
 //NSArray *savedProjectArray = [[NSArray alloc] initWithObjects:@"", nil];
    
    if(_projectArray ==nil){
        _projectArray = [[NSMutableArray alloc] initWithArray:savedProjectArray];
    }
    
    if(_taskArray ==nil){
        _taskArray = [[NSMutableArray alloc] initWithArray:savedTaskArray];
    }
    
    if(_favoriteArray ==nil){
        _favoriteArray = [[NSMutableArray alloc] initWithArray:savedFavoriteArray];
    }
    
    if(_hourArray ==nil){
        _hourArray = [[NSMutableArray alloc] initWithArray:savedHourArray];
    }
    
    if (savedProjectArray.count > 0) {
        if ([self.savedProjectArray[0]  isEqual: @""]) {
        self.project1.text=savedProjectArray[1];
        self.task1.text=savedTaskArray[1];
        self.hours1.text=savedHourArray[1];
            self.Button1.enabled = YES;
    }
        else{
            self.project1.text=savedProjectArray[0];
            self.task1.text=savedTaskArray[0];
            self.hours1.text=savedHourArray[0];
            self.Button1.enabled = YES;
        }
    }
    
    if (savedProjectArray.count > 1) {
        self.project1.text=savedProjectArray[1];
        self.task1.text=savedTaskArray[1];
        self.hours1.text=savedHourArray[1];
        self.Button2.enabled = YES;
    }
    
    if (savedProjectArray.count > 2) {
        self.project2.text=savedProjectArray[2];
        self.task2.text=savedTaskArray[2];
        self.hours2.text=savedHourArray[2];
    }
    if (savedProjectArray.count > 3) {
        self.project3.text=savedProjectArray[3];
        self.task3.text=savedTaskArray[3];
        self.hours3.text=savedHourArray[3];
    }
    if (savedProjectArray.count > 4) {
        self.project4.text=savedProjectArray[4];
        self.task4.text=savedTaskArray[4];
        self.hours4.text=savedHourArray[4];
    }
    if (savedProjectArray.count > 5) {
        self.project5.text=savedProjectArray[5];
        self.task5.text=savedTaskArray[5];
        self.hours5.text=savedHourArray[5];
    }
    if (savedProjectArray.count > 6) {
        self.project6.text=savedProjectArray[6];
        self.task6.text=savedTaskArray[6];
        self.hours6.text=savedHourArray[6];
    }
    if (savedProjectArray.count > 7) {
        self.project7.text=savedProjectArray[7];
        self.task7.text=savedTaskArray[7];
        self.hours7.text=savedHourArray[7];
    }
    if (savedProjectArray.count > 8) {
        self.project8.text=savedProjectArray[8];
        self.task8.text=savedTaskArray[8];
        self.hours8.text=savedHourArray[8];
    }
    if (savedProjectArray.count > 9) {
        self.project9.text=savedProjectArray[9];
        self.task9.text=savedTaskArray[9];
        self.hours9.text=savedHourArray[9];
    }
    if (savedProjectArray.count > 10) {
        self.project10.text=savedProjectArray[10];
        self.task10.text=savedTaskArray[10];
        self.hours10.text=savedHourArray[10];
    }
    if (savedProjectArray.count > 11) {
        self.project11.text=savedProjectArray[11];
        self.task11.text=savedTaskArray[11];
        self.hours11.text=savedHourArray[11];
    }
    if (savedProjectArray.count > 12) {
        self.project12.text=savedProjectArray[12];
        self.task12.text=savedTaskArray[12];
        self.hours12.text=savedHourArray[12];
    }
    if (savedProjectArray.count > 13) {
        self.project13.text=savedProjectArray[13];
        self.task13.text=savedTaskArray[13];
        self.hours13.text=savedHourArray[13];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clearArray:(id)sender {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Clear All Charge Codes" message:@"Are you sure you want to clear all charge codes from this screen?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* yes = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
        
        [_projectArray removeAllObjects];
        [_taskArray removeAllObjects];
        [_favoriteArray removeAllObjects];
        [_hourArray removeAllObjects];
        
        NSArray *savedProjectArray = [[NSArray alloc] initWithArray:_projectArray];
        NSArray *savedTaskArray = [[NSArray alloc] initWithArray:_taskArray];
        NSArray *savedFavoriteArray = [[NSArray alloc] initWithArray:_favoriteArray];
        NSArray *savedHourArray = [[NSArray alloc] initWithArray:_hourArray];
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:savedProjectArray forKey:@"projectArray"];
        [userDefaults setObject:savedTaskArray forKey:@"taskArray"];
        [userDefaults setObject:savedFavoriteArray forKey:@"favoriteArray"];
        [userDefaults setObject:savedHourArray forKey:@"hourArray"];
        [userDefaults synchronize];
        
        self.project1.text=@"";
        self.task1.text=@"";
        self.hours1.text=@"";
        self.project2.text=@"";
        self.task2.text=@"";
        self.hours2.text=@"";
        self.project3.text=@"";
        self.task3.text=@"";
        self.hours3.text=@"";
        self.project4.text=@"";
        self.task4.text=@"";
        self.hours4.text=@"";
        self.project5.text=@"";
        self.task5.text=@"";
        self.hours5.text=@"";
        self.project6.text=@"";
        self.task6.text=@"";
        self.hours6.text=@"";
        self.project7.text=@"";
        self.task7.text=@"";
        self.hours7.text=@"";
        self.project8.text=@"";
        self.task8.text=@"";
        self.hours8.text=@"";
        self.project9.text=@"";
        self.task9.text=@"";
        self.hours9.text=@"";
        self.project10.text=@"";
        self.task10.text=@"";
        self.hours10.text=@"";
        self.project11.text=@"";
        self.task11.text=@"";
        self.hours11.text=@"";
        self.project12.text=@"";
        self.task12.text=@"";
        self.hours12.text=@"";
        self.project13.text=@"";
        self.task13.text=@"";
        self.hours13.text=@"";
        
        
        
    }];
    UIAlertAction* no = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:no];
    [alertController addAction:yes];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (IBAction)Button1:(UIButton *)sender {

self.project12.text=@"Button Pressed";
    NSInteger buttonPress = 1;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:buttonPress forKey:@"buttonPress"];
    if(self.savedProjectArray>0){
    }
}

- (IBAction)Button2:(UIButton *)sender {
    NSInteger buttonPress = 2;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:buttonPress forKey:@"buttonPress"];
}

- (IBAction)Button3:(UIButton *)sender {
    NSInteger buttonPress = 3;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:buttonPress forKey:@"buttonPress"];
}

- (IBAction)Button4:(UIButton *)sender {
    NSInteger buttonPress = 4;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:buttonPress forKey:@"buttonPress"];
}

- (IBAction)Button5:(UIButton *)sender {
    NSInteger buttonPress = 5;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:buttonPress forKey:@"buttonPress"];
}

- (IBAction)Button6:(UIButton *)sender {
    NSInteger buttonPress = 6;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:buttonPress forKey:@"buttonPress"];
}

- (IBAction)Button7:(UIButton *)sender {
    NSInteger buttonPress = 7;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:buttonPress forKey:@"buttonPress"];
}

- (IBAction)Button8:(UIButton *)sender {
    NSInteger buttonPress = 8;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:buttonPress forKey:@"buttonPress"];
}

- (IBAction)Button9:(UIButton *)sender {
    NSInteger buttonPress = 9;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:buttonPress forKey:@"buttonPress"];
}

- (IBAction)Button10:(UIButton *)sender {
    NSInteger buttonPress = 10;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:buttonPress forKey:@"buttonPress"];
}

- (IBAction)Button11:(UIButton *)sender {
    NSInteger buttonPress = 11;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:buttonPress forKey:@"buttonPress"];
}

- (IBAction)Button12:(UIButton *)sender {
    NSInteger buttonPress = 12;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:buttonPress forKey:@"buttonPress"];
}

- (IBAction)Button13:(UIButton *)sender {
    NSInteger buttonPress = 13;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:buttonPress forKey:@"buttonPress"];
}


@end
