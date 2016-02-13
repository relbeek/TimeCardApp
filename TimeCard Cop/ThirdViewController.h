//
//  ThirdViewController.h
//  TimeCard Cop
//
//  Created by Ryan S Truran on 11/1/15.
//  Copyright © 2015 Trü App Dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface ThirdViewController : UIViewController <ADBannerViewDelegate>{
    ADBannerView *adView;
}
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

@property (nonatomic,retain) IBOutlet ADBannerView *adView;

@end
