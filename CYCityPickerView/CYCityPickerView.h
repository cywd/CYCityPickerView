//
//  CYCityPickerView.h
//  CYCityPickerViewDemo
//
//  Created by Cyrill on 2016/12/8.
//  Copyright © 2016年 Cyrill. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CYCityPickerView;

NS_ASSUME_NONNULL_BEGIN

@protocol CYCityPickerViewDelegate <NSObject>

/**
 告诉代理，用户选择了省市区

 @param picker   CYCityPickerView
 @param province 省
 @param city     市
 @param district 区
 */
- (void)cityPickerView:(CYCityPickerView *)picker
    finishPickProvince:(NSString *)province
                  city:(NSString *)city
              district:(NSString *)district;

@end

@interface CYCityPickerView : UIPickerView

@property (nonatomic, weak, nullable) id<CYCityPickerViewDelegate> cityPickerDelegate;


/**
 如果你希望使用自己的plist请设置这个路径（默认使用CYCityPickerView.bundle里的city.plist）
 */
@property (nonatomic, copy, readwrite) NSString *cy_plistPath;

@end

NS_ASSUME_NONNULL_END
