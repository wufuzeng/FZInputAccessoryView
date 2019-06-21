//
//  FZInputAccessoryView.h
//  FZOCProject
//
//  Created by 吴福增 on 2018/10/27.
//  Copyright © 2018 wufuzeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
/***
 1.自定义的Item 宽度会随内容变化
 2.自定义的Label textColor 颜色设置无效。
 
 */

typedef void(^ButtonClick)(NSInteger index);

@interface FZInputAccessoryView : UIToolbar

@property (nonatomic,assign) NSInteger index;
@property (nonatomic,copy)   NSString *placeholer;
@property (nonatomic,strong) NSString *previousTitle;
@property (nonatomic,strong) NSString *nextTitle;
@property (nonatomic,strong) NSString *doneTitle;

-(void)update;

//前一个输入框
@property(nonatomic,copy) ButtonClick previousBtnClick;
//下一个输入框
@property(nonatomic,copy) ButtonClick nextBtnClick;
//完成输入框
@property(nonatomic,copy) ButtonClick doneBtnClick;




@end

