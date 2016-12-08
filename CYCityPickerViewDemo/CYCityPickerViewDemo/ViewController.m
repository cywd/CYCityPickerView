//
//  ViewController.m
//  CYCityPickerViewDemo
//
//  Created by Cyrill on 2016/12/8.
//  Copyright © 2016年 Cyrill. All rights reserved.
//

#import "ViewController.h"
#import "CYCityPickerView.h"

@interface ViewController () <CYCityPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) CYCityPickerView *cityPicker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textField.inputView = self.cityPicker;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.textField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CYCityPickerViewDelegate
- (void)cityPickerView:(CYCityPickerView *)picker
    finishPickProvince:(NSString *)province
                  city:(NSString *)city
              district:(NSString *)district
{
    [self.textField setText:[NSString stringWithFormat:@"%@ %@ %@",province,city,district]];
}

#pragma mark - Getter and Setter
- (CYCityPickerView *)cityPicker {
    if (!_cityPicker) {
        _cityPicker = [[CYCityPickerView alloc] init];
        NSBundle *cityBundle = [NSBundle mainBundle];
        NSString *path = [cityBundle pathForResource:@"1" ofType:@"plist"];
        _cityPicker.cy_plistPath = path;
        _cityPicker.cityPickerDelegate = self;
    }
    return _cityPicker;
}

@end
