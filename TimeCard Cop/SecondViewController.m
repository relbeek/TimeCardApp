//
//  SecondViewController.m
//  TimeCard Cop
//
//  Created by Ryan S Truran on 11/1/15.
//  Copyright © 2015 Trü App Dev. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController () <UIPickerViewDelegate,UIPickerViewDataSource>

@end


@implementation SecondViewController

//Getter

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
//--------------------------------------------------------------------
//Round the slider value to the nearest 1/2
- (IBAction)hourSlider:(UISlider *)sender {
    float value = round(2.0f*self.hourSlider.value)/2.0f;
    _hourLabel.text = [NSString stringWithFormat:@"%0.1f",(float) value];
}
//---------------------------------------------------------------------
//Add Charge Code Button
- (IBAction)addChargeCode:(UIBarButtonItem *)sender {
    //Alert to ensure the text fields have the required data.
    if (([_projectCode.text isEqual:@""]) || ([_taskCode.text isEqual:@""])){
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Insufficent Information" message:@"Project Data and Task Data are required." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    else
    {
        
        NSLog(@"tempProject:%@ tempTask:%@",self.tempMemoryProjectArray,self.tempMemoryTaskArray);
    //add data from the project, task, and description text fields and the hour slider /label value.
    [_projectArray addObject:_projectCode.text];
    [_taskArray addObject:_taskCode.text];
    [_favoriteArray addObject: _favoriteCode.text];
    [_hourArray addObject: _hourLabel.text];
    
        NSLog(@"%@",_projectArray);
        NSLog(@"%@",self.tempMemoryProjectArray);
        
    /*copy the mutable project,task,favorites, and hour arrays to savedArrays and tempMemoryArrays. saved Project Arrays are the arrays that are saved for use on ViewController.m as label data. tempMemoryArrays are used to store temporarily for use in the pickerView. */
        

        
        self.projectMutableArray = [[NSMutableArray alloc] initWithObjects:@"", nil];
        self.taskMutableArray = [[NSMutableArray alloc] initWithObjects:@"", nil];
        [self.projectMutableArray addObjectsFromArray:_projectArray];
        [self.taskMutableArray addObjectsFromArray:_taskArray];
        [self.projectMutableArray addObjectsFromArray:self.tempMemoryProjectArray];
        [self.taskMutableArray addObjectsFromArray:self.tempMemoryTaskArray];


        NSLog(@"Project:%@ Task:%@",_projectArray,_taskArray);
        NSLog(@"tempProject:%@ tempTask:%@",self.tempMemoryProjectArray,self.tempMemoryTaskArray);
        
        NSDictionary *uniqp = [NSDictionary dictionaryWithObjects:self.projectMutableArray forKeys:self.projectMutableArray];
        _uniqProject = [[NSMutableArray alloc] initWithArray:uniqp.allKeys];
  
        NSDictionary *uniqt = [NSDictionary dictionaryWithObjects:self.taskMutableArray forKeys:self.taskMutableArray];
        _uniqTask = [[NSMutableArray alloc] initWithArray:uniqt.allKeys];

        
        
    self.savedProjectArray = [[NSArray alloc] initWithArray:_projectArray];
    self.savedTaskArray = [[NSArray alloc] initWithArray:_taskArray];
    self.savedFavoriteArray = [[NSArray alloc] initWithArray:_favoriteArray];
    self.savedHourArray = [[NSArray alloc] initWithArray:_hourArray];
    self.tempMemoryProjectArray = [[NSArray alloc] initWithArray:self.uniqProject];
    self.tempMemoryTaskArray = [[NSArray alloc] initWithArray:self.uniqTask];
    self.tempMemoryFavoriteArray = [[NSArray alloc] initWithArray:_favoriteArray];
    self.tempMemoryHourArray = [[NSArray alloc] initWithArray:_hourArray];
       
    NSLog(@"%@ ",self.tempMemoryProjectArray);

        //Save Data In User Defaults Database
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:self.savedProjectArray forKey:@"projectArray"];
    [userDefaults setObject:self.savedTaskArray forKey:@"taskArray"];
    [userDefaults setObject:self.savedFavoriteArray forKey:@"favoriteArray"];
    [userDefaults setObject:self.savedHourArray forKey:@"hourArray"];
    [userDefaults setObject:self.tempMemoryProjectArray forKey:@"tempMemoryProjectArray"];
    [userDefaults setObject:self.tempMemoryTaskArray forKey:@"tempMemoryTaskArray"];
    [userDefaults setObject:self.tempMemoryFavoriteArray forKey:@"tempMemoryFavoriteArray"];
    [userDefaults setObject:self.tempMemoryHourArray forKey:@"tempMemoryHourArray"];
    [userDefaults synchronize];
        
        [self.pickerView reloadAllComponents];
        self.hourSlider.value = 0;
        _hourLabel.text = [NSString stringWithFormat:@"%0.1f",(float) _hourSlider.value];
        [self.view reloadInputViews];
        self.projectCode.text= @"";
        self.taskCode.text=@"";
        self.favoriteCode.text=@"";


    //Alert that notifies the user that the charge code has posted.
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Charge Code Added" message:@"Add more charge codes or press the back button" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    [self presentViewController:alertController animated:YES completion:nil];
         }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
       // Do any additional setup after loading the view, typically from a nib.
 //Load savedArray's and tempMemoryArrays after loading the view
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    self.savedProjectArray = [userDefaults objectForKey:@"projectArray"];
    self.savedTaskArray = [userDefaults objectForKey:@"taskArray"];
    self.savedFavoriteArray = [userDefaults objectForKey:@"favoriteArray"];
    self.savedHourArray = [userDefaults objectForKey:@"hourArray"];
    self.tempMemoryProjectArray = [userDefaults objectForKey:@"tempMemoryProjectArray"];
    self.tempMemoryTaskArray = [userDefaults objectForKey:@"tempMemoryTaskArray"];
    self.tempMemoryFavoriteArray = [userDefaults objectForKey:@"tempMemoryFavoriteArray"];
    self.tempMemoryHourArray = [userDefaults objectForKey:@"tempMemoryHourArray"];
    
    //Fill project Array with the data of the savedArray
    if(_projectArray ==nil){
       _projectArray = [[NSMutableArray alloc] initWithArray:self.savedProjectArray];

    }
    //Fill task Array with the data of the savedArray
    if(_taskArray ==nil){
       _taskArray = [[NSMutableArray alloc] initWithArray:self.savedTaskArray];
    }
    //Fill favorite Array with the data of the savedArray
    if(_favoriteArray ==nil){
       _favoriteArray = [[NSMutableArray alloc] initWithArray:self.savedFavoriteArray];
    }
    //Fill hour Array with the data of the savedArray
    if(_hourArray ==nil){
        _hourArray = [[NSMutableArray alloc] initWithArray:self.savedHourArray];
    }
    

    
    if (self.projectArray.count>0){
        if(![self.projectArray[0]  isEqual: @""]) {
        [self.projectArray insertObject:@"" atIndex:0];
    }
    }
    if (self.taskArray.count>0){
        if(![self.taskArray[0]  isEqual: @""]) {
            [self.taskArray insertObject:@"" atIndex:0];
        }
    }
    if (self.favoriteArray.count>0){
        if(![self.favoriteArray[0]  isEqual: @""]) {
            [self.favoriteArray insertObject:@"" atIndex:0];
        }
    }
    if (self.hourArray.count>0){
        if(![self.hourArray[0]  isEqual: @""]) {
            [self.hourArray insertObject:@"" atIndex:0];
        }
    }

    NSLog(@"Project:%@ Task:%@",_projectArray,_taskArray);
    NSLog(@"tempProject:%@ tempTask:%@",self.tempMemoryProjectArray,self.tempMemoryTaskArray);
    
/* I'm not sure why i put these here. they can probably be erased as the
tempMemoryProjectArray and tempMemoryTaskArray are loaded at the start of this function
  */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 2;
    
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    //set number of rows
    if(component== 0)
    {
        return [self.tempMemoryProjectArray count];
        
    }
    else
    {
         return [self.tempMemoryTaskArray count];
    }
   

}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
  

    
    if(component== 0)
    {
        return [self.tempMemoryProjectArray objectAtIndex:row];
    }
    else
    {
        return [self.tempMemoryTaskArray objectAtIndex:row];
    }
 
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSInteger firstComponentRow = [self.pickerView selectedRowInComponent:0];
    NSInteger secondComponentRow = [self.pickerView selectedRowInComponent:1];
    if (self.tempMemoryProjectArray.count>0) {
        
        self.projectCode.text = self.tempMemoryProjectArray[firstComponentRow];
        self.taskCode.text = self.tempMemoryTaskArray[secondComponentRow];
    
    }
}

- (IBAction)clearTempMemory:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Clear All Charge Codes" message:@"Are you sure you want to clear all charge codes from this screen?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* yes = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
        //prepare for erasing tempMemoryProjectArray
        [_projectArray removeAllObjects];
        [_taskArray removeAllObjects];
        [_favoriteArray removeAllObjects];
        [_hourArray removeAllObjects];
        
        //redefine tempMemoryArray's as empty Arrays
        self.tempMemoryProjectArray = [[NSArray alloc] initWithArray:_projectArray];
        self.tempMemoryTaskArray = [[NSArray alloc] initWithArray:_taskArray];
        self.tempMemoryFavoriteArray = [[NSArray alloc] initWithArray:_favoriteArray];
        self.tempMemoryHourArray = [[NSArray alloc] initWithArray:_hourArray];
        
        // Save empty tempMemoryArray to userDefaults
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:self.tempMemoryProjectArray forKey:@"tempMemoryProjectArray"];
        [userDefaults setObject:self.tempMemoryTaskArray forKey:@"tempMemoryTaskArray"];
        [userDefaults setObject:self.tempMemoryFavoriteArray forKey:@"tempMemoryFavoriteArray"];
        [userDefaults setObject:self.tempMemoryHourArray forKey:@"tempMemoryHourArray"];
        [userDefaults synchronize];

        [self.pickerView reloadAllComponents];
        
    }];

    UIAlertAction* no = [UIAlertAction actionWithTitle:@"No" style: UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:no];
    [alertController addAction:yes];
    [self presentViewController:alertController animated:YES completion:nil];
    
}
@end
