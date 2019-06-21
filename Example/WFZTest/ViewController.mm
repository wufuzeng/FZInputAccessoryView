//
//  ViewController.m
//  WFZTest
//
//  Created by 吴福增 on 2018/11/8.
//  Copyright © 2018 吴福增. All rights reserved.
//

#import "ViewController.h"

//#import "Aspects.h"

@interface ViewController ()

@property (nonatomic,strong) UITextField *textField;

@end

@implementation ViewController


-(void)loadView{
    [super loadView];
    
 
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextField *textField = [UITextField new];
    self.textField = textField;
    
    textField.placeholder = @"placeholder";
    textField.backgroundColor = [UIColor yellowColor];
    textField.frame = CGRectMake(0, 0, 200, 40);
    [self.view addSubview:textField];
    textField.center = self.view.center;
    
    __weak __typeof(self) weakSelf = self;
    FZInputAccessoryView * accessoryView = [FZInputAccessoryView new];
    accessoryView.placeholer = @"请输入相关文字...";
//    accessoryView.previousTitle = @"😁";
//    accessoryView.nextTitle = @"😯";
//    accessoryView.doneTitle = @"👌";
    
    accessoryView.previousBtnClick = ^(NSInteger insex) {
        
    };
    
    accessoryView.nextBtnClick = ^(NSInteger insex) {
        
    };
    accessoryView.doneBtnClick = ^(NSInteger insex) {
        [weakSelf.textField resignFirstResponder];
    };
    
    [accessoryView update];
    textField.inputAccessoryView = accessoryView;;
    
    
}

 


@end
