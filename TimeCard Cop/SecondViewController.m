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

- (IBAction)ActiveProjectCode:(id)sender {
 //   if (self.tempMemoryProjectArray.count>0 || ![_pickerView selectedRowInComponent:0]) {
//        [_pickerView selectRow:0 inComponent:0 animated:YES];
//        self.projectCode.text = self.tempMemoryProjectArray[0];
 //       self.taskCode.text = self.tempMemoryTaskArray[0];
//    }
}
- (IBAction)ActiveTaskCode:(id)sender {
//    if (self.tempMemoryProjectArray.count>0) {
 //       [_pickerView selectRow:0 inComponent:0 animated:YES];
 //       self.projectCode.text = self.tempMemoryProjectArray[0];
 //       self.taskCode.text = self.tempMemoryTaskArray[0];
   
//    }
}


//--------------------------------------------------------------------
//Dismisses the keyboard after editiing the EndTaskCode
- (IBAction)EndTaskCode:(id)sender {
    [sender resignFirstResponder];}

//--------------------------------------------------------------------
//Dismisses the keyboard after editiing the EndFavoriteCode
- (IBAction)EndFavoriteCode:(id)sender {
    [sender resignFirstResponder];
}
//--------------------------------------------------------------------
//Round the slider value to the nearest 1/2
- (IBAction)hourSlider:(UISlider *)sender {
    float value = round(4.0f*self.hourSlider.value)/4.0f;
    _hourLabel.text = [NSString stringWithFormat:@"%0.2f",(float) value];
}
//---------------------------------------------------------------------
//Add Charge Code Button
- (IBAction)addChargeCode:(UIBarButtonItem *)sender {
    
            int process=1;
    //Alert to ensure the text fields have the required data.
    if (([_projectCode.text isEqual:@""]) || ([_taskCode.text isEqual:@""])){
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Insufficent Information" message:@"Project Data and a nickname are both required." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    else
    {
        int i;
        NSLog(@"%lu",_tempMemoryProjectArray.count);
        if (_tempMemoryProjectArray.count>1) {
        
            for (i=1; i<_tempMemoryProjectArray.count; i++) {
            
                if ([_tempMemoryProjectArray[i] isEqualToString:_projectCode.text] && ![_tempMemoryTaskArray[i] isEqualToString:_taskCode.text]) {
                
                    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Input Error" message:@"Project Code has already been used." preferredStyle:UIAlertControllerStyleAlert];
                
                    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                
                    [alertController addAction:ok];
                
                    [self presentViewController:alertController animated:YES completion:nil];
                
                    process=0;
            
                }
            
                if ([_tempMemoryTaskArray[i] isEqualToString:_taskCode.text] && ![_tempMemoryProjectArray[i] isEqualToString:_projectCode.text]) {
                    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Input Error" message:@"That nickname has already been used." preferredStyle:UIAlertControllerStyleAlert];
                
                    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                
                    [alertController addAction:ok];
                
                    [self presentViewController:alertController animated:YES completion:nil];
                
                    process=0;
        
                }
        
            }
        }
        if (process==1) {
            
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
            
            NSLog(@"tempProject:%@ tempTask:%@",self.tempMemoryProjectArray,self.tempMemoryTaskArray);
            //add data from the project, task, and description text fields and the hour slider /label value.
            [_projectArray addObject:_projectCode.text];
            [_taskArray addObject:_taskCode.text];
            [_favoriteArray addObject: _favoriteCode.text];
            [_hourArray addObject: _hourLabel.text];
            [_dateArray addObject: theDate];
            
            
            NSLog(@"%@",_projectArray);
            NSLog(@"%@",self.tempMemoryProjectArray);
            
            /*copy the mutable project,task,favorites, and hour arrays to savedArrays and tempMemoryArrays. saved Project Arrays are the arrays that are saved for use on ViewController.m as label data. tempMemoryArrays are used to store temporarily for use in the pickerView. */
            
            
            
            self.projectMutableArray = [[NSMutableArray alloc] initWithObjects:@"", nil];
            self.taskMutableArray = [[NSMutableArray alloc] initWithObjects:@"", nil];
            self.dateMutableArray = [[NSMutableArray alloc] initWithObjects:@"",nil];
            [self.projectMutableArray addObjectsFromArray:_projectArray];
            [self.taskMutableArray addObjectsFromArray:_taskArray];
            [self.dateMutableArray addObjectsFromArray:_dateArray];
            [self.projectMutableArray addObjectsFromArray:_tempMemoryProjectArray];
            [self.taskMutableArray addObjectsFromArray:_tempMemoryTaskArray];
            [self.dateMutableArray addObjectsFromArray:_tempMemoryDateArray];
            
            NSLog(@"%@",_dateArray);
            NSLog(@"Project:%@ Task:%@",_projectArray,_taskArray);
            NSLog(@"tempProject:%@ tempTask:%@",self.tempMemoryProjectArray,self.tempMemoryTaskArray);
            
            NSDictionary *uniqp = [NSDictionary dictionaryWithObjects:self.projectMutableArray forKeys:self.projectMutableArray];
            _uniqProject = [[NSMutableArray alloc] initWithArray:uniqp.allKeys];
            
            NSDictionary *uniqt = [NSDictionary dictionaryWithObjects:self.taskMutableArray forKeys:self.taskMutableArray];
            _uniqTask = [[NSMutableArray alloc] initWithArray:uniqt.allKeys];
            
            if (self.projectArray.count>0){
                if(![self.projectArray[0]  isEqual: @""]) {
                    [self.projectArray insertObject:@"" atIndex:0];
                    [self.favoriteArray insertObject:@"" atIndex:0];
                    
                }
            }
            if (self.taskArray.count>0){
                if(![self.taskArray[0]  isEqual: @""]) {
                    [self.taskArray insertObject:@"" atIndex:0];
                }
            }
            if (self.hourArray.count>0){
                if(![self.hourArray[0]  isEqual: @""]) {
                    [self.hourArray insertObject:@"" atIndex:0];
                }
            }
            if (self.dateArray.count>0){
                if(![self.dateArray[0]  isEqual: @""]) {
                    [self.dateArray insertObject:@"" atIndex:0];
                }
            }
            
            self.savedProjectArray = [[NSArray alloc] initWithArray:_projectArray];
            self.savedTaskArray = [[NSArray alloc] initWithArray:_taskArray];
            self.savedFavoriteArray = [[NSArray alloc] initWithArray:_favoriteArray];
            self.savedHourArray = [[NSArray alloc] initWithArray:_hourArray];
            self.savedDateArray = [[NSArray alloc] initWithArray:_dateArray];
            self.tempMemoryProjectArray = [[NSArray alloc] initWithArray:self.uniqProject];
            self.tempMemoryTaskArray = [[NSArray alloc] initWithArray:self.uniqTask];
            self.tempMemoryFavoriteArray = [[NSArray alloc] initWithArray:_favoriteArray];
            self.tempMemoryHourArray = [[NSArray alloc] initWithArray:_hourArray];
            self.tempMemoryDateArray = [[NSArray alloc] initWithArray:_dateArray];
            
            NSLog(@"%@ ",self.tempMemoryProjectArray);
            
            //Save Data In User Defaults Database
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            [userDefaults setObject:self.savedProjectArray forKey:@"projectArray"];
            [userDefaults setObject:self.savedTaskArray forKey:@"taskArray"];
            [userDefaults setObject:self.savedFavoriteArray forKey:@"favoriteArray"];
            [userDefaults setObject:self.savedHourArray forKey:@"hourArray"];
            [userDefaults setObject:self.savedDateArray forKey:@"dateArray"];
            [userDefaults setObject:self.tempMemoryProjectArray forKey:@"tempMemoryProjectArray"];
            [userDefaults setObject:self.tempMemoryTaskArray forKey:@"tempMemoryTaskArray"];
            [userDefaults setObject:self.tempMemoryFavoriteArray forKey:@"tempMemoryFavoriteArray"];
            [userDefaults setObject:self.tempMemoryHourArray forKey:@"tempMemoryHourArray"];
            [userDefaults setObject:self.tempMemoryDateArray forKey:@"tempMemoryDateArray"];
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
    self.savedDateArray = [userDefaults objectForKey:@"dateArray"];
    self.tempMemoryProjectArray = [userDefaults objectForKey:@"tempMemoryProjectArray"];
    self.tempMemoryTaskArray = [userDefaults objectForKey:@"tempMemoryTaskArray"];
    self.tempMemoryFavoriteArray = [userDefaults objectForKey:@"tempMemoryFavoriteArray"];
    self.tempMemoryHourArray = [userDefaults objectForKey:@"tempMemoryHourArray"];
    self.tempMemoryDateArray = [userDefaults objectForKey:@"tempMemoryDateArray"];

    NSLog(@"Temp Memory Array:%@",_tempMemoryDateArray);
    NSLog(@"Saved Array:%@",_savedDateArray);
    
    self.hourSlider.value = 0.00;

    //Fill project Array with the data of the savedArray
    if(_projectArray ==nil){
       _projectArray = [[NSMutableArray alloc] initWithArray:self.savedProjectArray];
    }
    
    //Fill project Array with the data of the savedArray

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
    
    if(_dateArray ==nil){
        _dateArray = [[NSMutableArray alloc] initWithArray:self.savedDateArray];
    }
    

    
    if (self.projectArray.count>0){
        if(![self.projectArray[0]  isEqual: @""]) {
        [self.projectArray insertObject:@"" atIndex:0];
        [self.favoriteArray insertObject:@"" atIndex:0];

    }
    }
    if (self.taskArray.count>0){
        if(![self.taskArray[0]  isEqual: @""]) {
            [self.taskArray insertObject:@"" atIndex:0];
        }
    }
    if (self.hourArray.count>0){
        if(![self.hourArray[0]  isEqual: @""]) {
            [self.hourArray insertObject:@"" atIndex:0];
        }
    }
    if (self.dateArray.count>0){
        if(![self.dateArray[0]  isEqual: @""]) {
            [self.dateArray insertObject:@"" atIndex:0];
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
    
    return 1;
    
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    //set number of rows
         return [self.tempMemoryTaskArray count];
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
        return [self.tempMemoryTaskArray objectAtIndex:row];
    
 
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (self.tempMemoryProjectArray.count>0) {
        self.projectCode.text = self.tempMemoryProjectArray[row];
        self.taskCode.text = self.tempMemoryTaskArray[row];
    
    }
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *title = [self.tempMemoryTaskArray objectAtIndex:row];
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    return attString;
    
}

- (IBAction)clearTempMemory:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Clear All Charge Codes" message:@"Are you sure you want to clear all charge codes from this screen?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* yes = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
        //prepare for erasing tempMemoryProjectArray
        [_projectArray removeAllObjects];
        [_taskArray removeAllObjects];
        [_favoriteArray removeAllObjects];
        [_hourArray removeAllObjects];
        [_dateArray removeAllObjects];
        
        //redefine tempMemoryArray's as empty Arrays
        self.tempMemoryProjectArray = [[NSArray alloc] initWithArray:_projectArray];
        self.tempMemoryTaskArray = [[NSArray alloc] initWithArray:_taskArray];
        self.tempMemoryFavoriteArray = [[NSArray alloc] initWithArray:_favoriteArray];
        self.tempMemoryHourArray = [[NSArray alloc] initWithArray:_hourArray];
        self.tempMemoryDateArray = [[NSArray alloc] initWithArray:_dateArray];
        
        // Save empty tempMemoryArray to userDefaults
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:self.tempMemoryProjectArray forKey:@"tempMemoryProjectArray"];
        [userDefaults setObject:self.tempMemoryTaskArray forKey:@"tempMemoryTaskArray"];
        [userDefaults setObject:self.tempMemoryFavoriteArray forKey:@"tempMemoryFavoriteArray"];
        [userDefaults setObject:self.tempMemoryHourArray forKey:@"tempMemoryHourArray"];
        [userDefaults setObject:self.tempMemoryDateArray forKey:@"tempMemoryDateArray"];
        [userDefaults synchronize];

        [self.pickerView reloadAllComponents];
        
    }];

    UIAlertAction* no = [UIAlertAction actionWithTitle:@"No" style: UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:no];
    [alertController addAction:yes];
    [self presentViewController:alertController animated:YES completion:nil];
    
}
@end
