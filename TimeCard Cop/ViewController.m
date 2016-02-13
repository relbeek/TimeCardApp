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

int option = 0;
int offset = 0;
int dataDisplay;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UISwipeGestureRecognizer * swipeleft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeleft:)];
    swipeleft.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeleft];
    
    
    UISwipeGestureRecognizer * swiperight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperight:)];
    swiperight.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swiperight];
    
    
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
  
    NSInteger option = 0;
    
    //NSInteger buttonPress = 0;

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
    NSArray *savedDateArray = [userDefaults objectForKey:@"dateArray"];
    [userDefaults setInteger:option forKey:@"viewLoader"];
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
    
    if(_dateArray ==nil){
        _dateArray = [[NSMutableArray alloc] initWithArray:savedDateArray];
    }
    NSDictionary *uniqd = [NSDictionary dictionaryWithObjects:self.dateArray forKeys:self.dateArray];
    _uniqDate = [[NSMutableArray alloc] initWithArray:uniqd.allKeys];
    
    NSLog(@"Dates:%@",_uniqDate);
   
    int i=0;
    int k=0;
    int j=0;
    
    NSMutableArray *dateDataset = [NSMutableArray array];
    for (i=0; i<savedDateArray.count; i++) {
        if (k<_uniqDate.count) {
            if (savedDateArray[i]==_uniqDate[k]) {
                j++;
            }
            if (savedDateArray.count-1 == i){
                [dateDataset addObject:[NSNumber numberWithInteger:j]];
                j=0;
                k++;
                i=0;
            }
        }
    }
    
    dataDisplay = _uniqDate.count-offset;
    
    int t =0;
    int displayIndexStart=0;
    int displayIndexStop;
    
    for (t=0; t<dataDisplay-1; t++) {
        displayIndexStart = displayIndexStart + [dateDataset[t] intValue];
        displayIndexStop = displayIndexStart + [dateDataset[t+1] intValue];
    }
    
    displayIndexStart = displayIndexStart;
    displayIndexStop = displayIndexStop;
    
    NSMutableArray *displaySavedTaskArray = [[NSMutableArray alloc] init];
    NSMutableArray *displaySavedProjectArray = [[NSMutableArray alloc] init];
    NSMutableArray *displaySavedHourArray = [[NSMutableArray alloc] init];


    
    int t_data;
    
    for (t_data=0; t_data<displayIndexStop - displayIndexStart; t_data++) {
        [displaySavedTaskArray insertObject:savedTaskArray[displayIndexStart+t_data] atIndex:t_data];
        [displaySavedProjectArray insertObject:savedProjectArray[displayIndexStart+t_data] atIndex:t_data];
        [displaySavedHourArray insertObject:savedHourArray[displayIndexStart+t_data] atIndex:t_data];
        
    }
    
    if (displaySavedTaskArray.count>0){
        if(![displaySavedTaskArray[0]  isEqual: @""]) {
            [displaySavedTaskArray insertObject:@"" atIndex:0];
        }
    }
    if (displaySavedProjectArray.count>0){
        if(![displaySavedProjectArray[0]  isEqual: @""]) {
            [displaySavedProjectArray insertObject:@"" atIndex:0];
        }
    }
    if (displaySavedHourArray.count>0){
        if(![displaySavedHourArray[0]  isEqual: @""]) {
            [displaySavedHourArray insertObject:@"" atIndex:0];
        }
    }

    
    NSLog(@"datasets: %@",dateDataset);
    NSLog(@"index Starts at: %i",displayIndexStop);
    
    NSLog(@"VALUES for today%@",displaySavedTaskArray);
    if (savedProjectArray.count > 0) {
  //      if ([self.savedProjectArray[0]  isEqual: @" "]) {
  //      self.project1.text=savedProjectArray[1];
  //      self.task1.text=savedTaskArray[1];
  //      self.hours1.text=savedHourArray[1];
  //          self.Button1.enabled = NO;
  //  }
  //      else{
        //self.project1.text=savedProjectArray[0];
    //        self.task1.text=savedTaskArray[0];
   //         self.hours1.text=savedHourArray[0];
   //         self.Button1.enabled = YES;
    //}
    }
    
    if (displaySavedProjectArray.count > 1) {
        self.project1.text=displaySavedTaskArray[1];
        self.hours1.text=displaySavedHourArray[1];
        self.Button1.enabled = YES;
    }
    
    if (displaySavedProjectArray.count > 2) {
        self.project2.text=displaySavedTaskArray[2];
        self.hours2.text=displaySavedHourArray[2];
        self.Button2.enabled = YES;
    }
    if (displaySavedProjectArray.count > 3) {

        self.project3.text=displaySavedTaskArray[3];
        self.hours3.text=displaySavedHourArray[3];
        self.Button3.enabled = YES;
    }
    if (displaySavedProjectArray.count > 4) {

        self.project4.text=displaySavedTaskArray[4];
        self.hours4.text=displaySavedHourArray[4];
        self.Button4.enabled = YES;
    }
    if (displaySavedProjectArray.count > 5) {

        self.project5.text=displaySavedTaskArray[5];
        self.hours5.text=displaySavedHourArray[5];
        self.Button5.enabled = YES;
    }
    if (displaySavedProjectArray.count > 6) {

        self.project6.text=displaySavedTaskArray[6];
        self.hours6.text=displaySavedHourArray[6];
        self.Button6.enabled = YES;
    }
    if (displaySavedProjectArray.count > 7) {

        self.project7.text=displaySavedTaskArray[7];
        self.hours7.text=displaySavedHourArray[7];
        self.Button7.enabled = YES;
    }
    if (displaySavedProjectArray.count > 8) {

        self.project8.text=displaySavedTaskArray[8];
        self.hours8.text=displaySavedHourArray[8];
        self.Button8.enabled = YES;
    }
    if (displaySavedProjectArray.count > 9) {

        self.project9.text=displaySavedTaskArray[9];
        self.hours9.text=displaySavedHourArray[9];
        self.Button9.enabled = YES;
    }
    if (displaySavedProjectArray.count > 10) {

        self.project10.text=displaySavedTaskArray[10];
        self.hours10.text=displaySavedHourArray[10];
        self.Button10.enabled = YES;

    }
    if (displaySavedProjectArray.count > 11) {

        self.project11.text=displaySavedTaskArray[11];
        self.hours11.text=displaySavedHourArray[11];
        self.Button11.enabled = YES;
    }
    if (displaySavedProjectArray.count > 12) {

        self.project12.text=displaySavedTaskArray[12];
        self.hours12.text=displaySavedHourArray[12];
        self.Button12.enabled = YES;
    }
    if (displaySavedProjectArray.count > 13) {

        self.project13.text=displaySavedTaskArray[13];
        self.hours13.text=displaySavedHourArray[13];
        self.Button13.enabled = YES;
    }
    
    double sumHours = 0;
    
    for (i = 0; i< displaySavedHourArray.count; i++) {
        double value = [displaySavedHourArray[i] doubleValue];
        sumHours += value;
        NSLog(@"Hours: %@",displaySavedHourArray[i]);
    }
    NSString *hours = [NSString stringWithFormat: @"%.2f",sumHours];
    self.sumLabel.text =  hours;

    
    
    
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
        self.sumLabel.text=@"0.00";
        
        
        
    }];
    UIAlertAction* no = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:no];
    [alertController addAction:yes];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (IBAction)Button1:(UIButton *)sender {
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


- (IBAction)timeCardCop:(UIButton *)sender {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //NSInteger option = [userDefaults integerForKey:@"viewLoader"];
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

  if (option==0) {
        option=1;
 //     [userDefaults setInteger:option forKey:@"viewLoader"];
  }
    else{
        option=0;
   //     [userDefaults setInteger:option forKey:@"viewLoader"];
    }
    
    NSLog(@"%li",(long)option);
    switch (option) {
        case 0:
            self.displayedTitle.text = @"Nickname";
            if (savedProjectArray.count > 1) {
                self.project1.text=savedTaskArray[1];
                self.hours1.text=savedHourArray[1];
                self.Button1.enabled = YES;
            }
            
            if (savedProjectArray.count > 2) {
                self.project2.text=savedTaskArray[2];
                self.hours2.text=savedHourArray[2];
                self.Button2.enabled = YES;
            }
            if (savedProjectArray.count > 3) {
                self.project3.text=savedTaskArray[3];
                self.hours3.text=savedHourArray[3];
                self.Button3.enabled = YES;
            }
            if (savedProjectArray.count > 4) {
                
                self.project4.text=savedTaskArray[4];
                self.hours4.text=savedHourArray[4];
                self.Button4.enabled = YES;
            }
            if (savedProjectArray.count > 5) {
                
                self.project5.text=savedTaskArray[5];
                self.hours5.text=savedHourArray[5];
                self.Button5.enabled = YES;
            }
            if (savedProjectArray.count > 6) {
                
                self.project6.text=savedTaskArray[6];
                self.hours6.text=savedHourArray[6];
                self.Button6.enabled = YES;
            }
            if (savedProjectArray.count > 7) {
                
                self.project7.text=savedTaskArray[7];
                self.hours7.text=savedHourArray[7];
                self.Button7.enabled = YES;
            }
            if (savedProjectArray.count > 8) {
                
                self.project8.text=savedTaskArray[8];
                self.hours8.text=savedHourArray[8];
                self.Button8.enabled = YES;
            }
            if (savedProjectArray.count > 9) {
                
                self.project9.text=savedTaskArray[9];
                self.hours9.text=savedHourArray[9];
                self.Button9.enabled = YES;
            }
            if (savedProjectArray.count > 10) {
                
                self.project10.text=savedTaskArray[10];
                self.hours10.text=savedHourArray[10];
                self.Button10.enabled = YES;
                
            }
            if (savedProjectArray.count > 11) {
                
                self.project11.text=savedTaskArray[11];
                self.hours11.text=savedHourArray[11];
                self.Button11.enabled = YES;
            }
            if (savedProjectArray.count > 12) {
                
                self.project12.text=savedTaskArray[12];
                self.hours12.text=savedHourArray[12];
                self.Button12.enabled = YES;
            }
            if (savedProjectArray.count > 13) {
                
                self.project13.text=savedTaskArray[13];
                self.hours13.text=savedHourArray[13];
                self.Button13.enabled = YES;
            }

            break;
            
        default:
            self.displayedTitle.text = @"Charge Code";
            if (savedProjectArray.count > 1) {
                self.project1.text=savedProjectArray[1];
                self.hours1.text=savedHourArray[1];
                self.Button1.enabled = YES;
 
            }
            
            if (savedProjectArray.count > 2) {
                self.project2.text=savedProjectArray[2];
                self.hours2.text=savedHourArray[2];
                self.Button2.enabled = YES;
            }
            if (savedProjectArray.count > 3) {
                
                self.project3.text=savedProjectArray[3];
                self.hours3.text=savedHourArray[3];
                self.Button3.enabled = YES;
            }
            if (savedProjectArray.count > 4) {
                
                self.project4.text=savedProjectArray[4];
                self.hours4.text=savedHourArray[4];
                self.Button4.enabled = YES;
            }
            if (savedProjectArray.count > 5) {
                
                self.project5.text=savedProjectArray[5];
                self.hours5.text=savedHourArray[5];
                self.Button5.enabled = YES;
            }
            if (savedProjectArray.count > 6) {
                
                self.project6.text=savedProjectArray[6];
                self.hours6.text=savedHourArray[6];
                self.Button6.enabled = YES;
            }
            if (savedProjectArray.count > 7) {
                
                self.project7.text=savedProjectArray[7];
                self.hours7.text=savedHourArray[7];
                self.Button7.enabled = YES;
            }
            if (savedProjectArray.count > 8) {
                
                self.project8.text=savedProjectArray[8];
                self.hours8.text=savedHourArray[8];
                self.Button8.enabled = YES;
            }
            if (savedProjectArray
                .count > 9) {
                
                self.project9.text=savedProjectArray[9];
                self.hours9.text=savedHourArray[9];
                self.Button9.enabled = YES;
            }
            if (savedProjectArray.count > 10) {
                
                self.project10.text=savedProjectArray[10];
                self.hours10.text=savedHourArray[10];
                self.Button10.enabled = YES;
                
            }
            if (savedProjectArray.count > 11) {
                
                self.project11.text=savedProjectArray[11];
                self.hours11.text=savedHourArray[11];
                self.Button11.enabled = YES;
            }
            if (savedProjectArray.count > 12) {
                
                self.project12.text=savedProjectArray[12];
                self.hours12.text=savedHourArray[12];
                self.Button12.enabled = YES;
            }
            if (savedProjectArray.count > 13) {
                
                self.project13.text=savedProjectArray[13];
                self.hours13.text=savedHourArray[13];
                self.Button13.enabled = YES;
            }

            break;
    }
}

-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer
{


}

-(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer
{
    offset =offset -1;
    int current = _uniqDate.count;
    
    self.dateLabel.text = _uniqDate[current-offset];
    
}

@end
