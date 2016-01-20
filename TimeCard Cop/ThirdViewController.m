//
//  ThirdViewController.m
//  TimeCard Cop
//
//  Created by Ryan S Truran on 11/1/15.
//  Copyright © 2015 Trü App Dev. All rights reserved.
//

#import "ThirdViewController.h"

@implementation ThirdViewController
//Dismisses the keyboard after editiing the EndProjectCode
- (IBAction)EndProjectCode:(id)sender {
    [sender resignFirstResponder];
}
//--------------------------------------------------------------------
//Dismisses the keyboard after editiing the EndTaskCode
- (IBAction)EndTaskCode:(id)sender {
    [sender resignFirstResponder];
}
//--------------------------------------------------------------------
//Dismisses the keyboard after editiing the EndFavoriteCode
- (IBAction)EndFavoriteCode:(id)sender {
    [sender resignFirstResponder];
}
-(void)bannerViewDidLoadAd:(ADBannerView *)banner{
    
    [_adView setHidden:NO];
}
-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{
    
    [_adView setHidden:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _adView.delegate = self;
    [_adView setHidden:YES];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *savedProjectArray = [userDefaults objectForKey:@"projectArray"];
    NSArray *savedTaskArray = [userDefaults objectForKey:@"taskArray"];
    NSArray *savedFavoriteArray = [userDefaults objectForKey:@"favoriteArray"];
    NSArray *savedHourArray = [userDefaults objectForKey:@"hourArray"];
//  Need to add mutable arrays and set them equal to saved Project Array
    NSInteger buttonPress = [userDefaults integerForKey:@"buttonPress"];

    self.projectCodeUpdate.text = savedProjectArray[buttonPress];
    self.taskCodeUpdate.text = savedTaskArray[buttonPress];
    self.hourUpdate.text = savedHourArray[buttonPress];
    self.favoriteCodeUpdate.text = savedFavoriteArray[buttonPress];

    if(self.projectArray ==nil){
        self.projectArray = [[NSMutableArray alloc] initWithArray:savedProjectArray];
    }
    //Fill task Array with the data of the savedArray
    if(self.taskArray ==nil){
        self.taskArray = [[NSMutableArray alloc] initWithArray:savedTaskArray];
    }
    //Fill favorite Array with the data of the savedArray
    if(self.favoriteArray ==nil){
        self.favoriteArray = [[NSMutableArray alloc] initWithArray:savedFavoriteArray];
    }
    //Fill hour Array with the data of the savedArray
    if(self.hourArray ==nil){
        self.hourArray = [[NSMutableArray alloc] initWithArray:savedHourArray];
    }

    NSLog(@"%@",self.projectArray);
    NSInteger value = [self.hourUpdate.text intValue];
    
    self.hourSliderUpdate.value = value;

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)hourSlider:(UISlider *)sender {
    float value = round(4.0f*self.hourSliderUpdate.value)/4.0f;
    _hourUpdate.text = [NSString stringWithFormat:@"%0.2f",(float) value];
    
}

- (IBAction)updateAction:(UIBarButtonItem *)sender {

 //Need to replace the saved data into the buttonPressConvert slot of the mutable array then save over the savedProjectArray ... then save to userDefaults.
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger buttonPress = [userDefaults integerForKey:@"buttonPress"];
    NSLog(@"%@",self.projectArray);
    NSLog(@"%@",self.taskArray);
    NSLog(@"%@",self.favoriteArray);
    NSLog(@"%@",self.hourArray);
    [_projectArray replaceObjectAtIndex:buttonPress withObject:self.projectCodeUpdate.text];
    [_taskArray replaceObjectAtIndex:buttonPress withObject:self.taskCodeUpdate.text];
    [_favoriteArray replaceObjectAtIndex:buttonPress withObject: self.favoriteCodeUpdate.text];
    [_hourArray replaceObjectAtIndex:buttonPress withObject: self.hourUpdate.text];
    
    NSLog(@"%@",self.projectArray);
    NSLog(@"%@",self.taskArray);
    NSLog(@"%@",self.favoriteArray);
    NSLog(@"%@",self.hourArray);
    
    self.savedProjectArray = [[NSArray alloc] initWithArray:_projectArray];
    self.savedTaskArray = [[NSArray alloc] initWithArray:_taskArray];
    self.savedFavoriteArray = [[NSArray alloc] initWithArray:_favoriteArray];
    self.savedHourArray = [[NSArray alloc] initWithArray:_hourArray];
    
    [userDefaults setObject:self.savedProjectArray forKey:@"projectArray"];
    [userDefaults setObject:self.savedTaskArray forKey:@"taskArray"];
    [userDefaults setObject:self.savedFavoriteArray forKey:@"favoriteArray"];
    [userDefaults setObject:self.savedHourArray forKey:@"hourArray"];

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Update Complete" message:@"Your update has been successfully saved" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    [self presentViewController:alertController animated:YES completion:nil];
}
@end
