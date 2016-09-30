//
//  customCheckShow.h
//  YXQ
//
//  Created by 袁野 on 16/9/30.
//  Copyright © 2016年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger,customCheckType){
    customCheckTypeComein = 0,
    customCheckTypeGohome,
};
@interface customCheckShow : UIView

- (instancetype)initWithState:(customCheckType)type time:(NSString *)timestr iflate:(NSString *)late;


@end
