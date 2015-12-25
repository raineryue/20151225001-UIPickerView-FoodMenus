//
//  ViewController.m
//  20151225001-UIPickerView-FoodMenus
//
//  Created by Rainer on 15/12/25.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *menuPickerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.menuPickerView.backgroundColor = [UIColor redColor];
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (0 == component)
        return 2;
    else
        return 3;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (0 == component) {
        if (0 == row) {
            return @"水果";
        } else {
            return @"主食";
        }
    } else {
        if (0 == row) {
            return @"西瓜";
        } else {
            return @"香蕉";
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
