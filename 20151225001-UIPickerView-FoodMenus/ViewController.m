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

@property (strong, nonatomic) NSArray *foodArray;
@property (strong, nonatomic) IBOutlet UILabel *fruitLabel;
@property (strong, nonatomic) IBOutlet UILabel *footLabel;
@property (strong, nonatomic) IBOutlet UILabel *drinkLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

/**
 *  返回数据选择器的总列数
 */
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return self.foodArray.count;
}

/**
 *  返回当前列的总行书
 */
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSArray *foods = self.foodArray[component];
    
    return foods.count;
}

/**
 *  返回当前列的当前行的数据信息
 */
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSArray *foods = self.foodArray[component];

    return foods[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"行：%ld;列：%ld", component, row);
    
    NSArray *foods = self.foodArray[component];
    
    if (0 == component) {
        self.fruitLabel.text = foods[row];
    } else if (1 == component) {
        self.footLabel.text = foods[row];
    } else {
        self.drinkLabel.text = foods[row];
    }
}

/**
 *  返回当前列的宽度
 */
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    if (0 == component) {
        return self.view.bounds.size.width / 3;
    } else if (1 == component) {
        return self.view.bounds.size.width / 3;
    } else {
        return self.view.bounds.size.width / 3;
    }
}

/**
 *  随机按钮点击事件
 */
- (IBAction)randomClickAction:(id)sender {
    // 1.获取当前的列数
    NSInteger component = self.foodArray.count;
    
    // 2.从列数中循环出行数
    for (int i = 0; i < component; i++) {
        // 2.1.获取当前列的行数
        NSArray *foods = self.foodArray[i];
        
        NSInteger allCount = foods.count;
        
        // 2.2.获取当前列选择的旧的行数
        NSInteger oldRow = [self.menuPickerView selectedRowInComponent:i];
        
        // 2.3.随机一个新的行
        NSInteger newRow = arc4random_uniform((int)allCount);
        
        // 2.4.判断旧的行与新随机的行是否相同
        while (oldRow == newRow) {
            // 如果不同就随机一个新的行
            newRow = arc4random_uniform((int)allCount);
        }
        
        // 2.5.让当前的选择器控件的列选择一个新的行数
        [self.menuPickerView selectRow:newRow inComponent:i animated:YES];
        
        // 2.6.调用当前选择器控件的以选择的行的代理方法，给显示信息复制
        [self pickerView:self.menuPickerView didSelectRow:newRow inComponent:i];
    }
}

/**
 *  懒加载返回数据信息
 */
- (NSArray *)foodArray {
    if (nil == _foodArray) {
        _foodArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"foods" ofType:@"plist"]];
    }
    
    return _foodArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
