//
//  FZInputAccessoryView.m
//  FZOCProject
//
//  Created by 吴福增 on 2018/10/27.
//  Copyright © 2018 wufuzeng. All rights reserved.
//

#import "FZInputAccessoryView.h"

@interface FZInputAccessoryView ()

/** 上一个 */
@property (nonatomic,strong) UIButton *btn_previous;
/** 下一个 */
@property (nonatomic,strong) UIButton *btn_next;
/** 占位 */
@property (nonatomic,strong) UILabel *lbl_placeholder;
/** 完成 */
@property (nonatomic,strong) UIButton *btn_done;


@end

@implementation FZInputAccessoryView

-(BOOL)canBecomeFirstResponder{
    return YES;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40);
        
    }
    return self;
}


-(void)update{
    
    NSMutableArray *items = [NSMutableArray arrayWithArray:@[self.btn_previous,self.btn_next,self.lbl_placeholder,self.btn_done]];
    CGFloat margin = 10;
    CGFloat width = self.frame.size.width - self.btn_done.frame.size.width - 5 * margin;
    CGRect nrect = CGRectMake(self.lbl_placeholder.frame.origin.x, self.lbl_placeholder.frame.origin.y, width, self.lbl_placeholder.frame.size.height);
    self.lbl_placeholder.frame = nrect;
    if (self.previousBtnClick) {
        CGFloat width =self.lbl_placeholder.frame.size.width - self.btn_previous.frame.size.width;
        CGRect nrect = CGRectMake(self.lbl_placeholder.frame.origin.x, self.lbl_placeholder.frame.origin.y, width, self.lbl_placeholder.frame.size.height);
        self.lbl_placeholder.frame = nrect;
        //self.lbl_placeholder.width -= self.btn_previous.width;
    }else{
        [items removeObject:self.btn_previous];
        //self.lbl_placeholder.width += margin;
        
        CGFloat width = self.lbl_placeholder.frame.size.width + margin;
        CGRect nrect = CGRectMake(self.lbl_placeholder.frame.origin.x, self.lbl_placeholder.frame.origin.y, width, self.lbl_placeholder.frame.size.height);
        self.lbl_placeholder.frame = nrect;
        
    }
    
    if (self.nextBtnClick){
        //self.lbl_placeholder.width -= self.btn_next.width;
        CGFloat width = self.lbl_placeholder.frame.size.width - self.btn_next.frame.size.width;
        CGRect nrect = CGRectMake(self.lbl_placeholder.frame.origin.x, self.lbl_placeholder.frame.origin.y, width, self.lbl_placeholder.frame.size.height);
        self.lbl_placeholder.frame = nrect;
    }else{
        [items removeObject:self.btn_next];
        //self.lbl_placeholder.width += margin;
        CGFloat width = self.lbl_placeholder.frame.size.width + margin;
        CGRect nrect = CGRectMake(self.lbl_placeholder.frame.origin.x, self.lbl_placeholder.frame.origin.y, width, self.lbl_placeholder.frame.size.height);
        self.lbl_placeholder.frame = nrect;
    }
    
    [self addItems:items];
}


/** 添加barItem */
-(void)addItems:(NSArray *)items{
    NSMutableArray* temp = [NSMutableArray array];
    for (int i = 0; i < items.count; i++) {
        UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:items[i]];
        [temp addObject:item];
        [temp addObject:[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:NULL]];
        
        if (i == items.count -1) {
            [temp removeLastObject];
        }
    }
    self.items = temp;
}


#pragma mark -- Set Func ------------

-(void)setPlaceholer:(NSString *)placeholer{
    _placeholer = placeholer;
    self.lbl_placeholder.text = placeholer;
    [self.lbl_placeholder sizeToFit];
    [self update];
}

-(void)setPreviousTitle:(NSString *)previousTitle{
    _previousTitle = previousTitle;
    [self.btn_previous setTitle:previousTitle forState:UIControlStateNormal];
    [self.btn_previous sizeToFit];
    [self update];
}

-(void)setNextTitle:(NSString *)nextTitle{
    _nextTitle = nextTitle;
    [self.btn_next setTitle:nextTitle forState:UIControlStateNormal];
    [self.btn_next sizeToFit];
    [self update];
}

-(void)setDoneTitle:(NSString *)doneTitle{
    _doneTitle = doneTitle;
    [self.btn_done setTitle:doneTitle forState:UIControlStateNormal];
    [self.btn_done sizeToFit];
}


#pragma mark -- Action Func --

-(void)previous{
    if (self.previousBtnClick) {
        
        self.previousBtnClick(self.index);
    }
}
-(void)next{
    if (self.nextBtnClick) {
        
        self.nextBtnClick(self.index);
    }
}
-(void)done{
    if (self.doneBtnClick) {
        
        self.doneBtnClick(self.index);
    }
}



#pragma mark -- Lazy Func ------


-(UIButton *)btn_previous{
    if (_btn_previous == nil) {
        _btn_previous = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn_previous setTitle:@"上一个" forState:UIControlStateNormal];
        [_btn_previous setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_btn_previous addTarget:self action:@selector(previous) forControlEvents:UIControlEventTouchUpInside];
        _btn_previous.titleLabel.font = [UIFont systemFontOfSize:12];
        [_btn_previous sizeToFit];
    }
    return _btn_previous;
}


-(UIButton *)btn_next{
    if (_btn_next == nil) {
        _btn_next = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn_next setTitle:@"下一个" forState:UIControlStateNormal];
        [_btn_next setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_btn_next addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
        _btn_next.titleLabel.font = [UIFont systemFontOfSize:12];
        [_btn_next sizeToFit];
    }
    return _btn_next;
}

-(UILabel *)lbl_placeholder{
    if (_lbl_placeholder == nil) {
        _lbl_placeholder = [[UILabel alloc]init];
        _lbl_placeholder.font = [UIFont systemFontOfSize:14];
        _lbl_placeholder.text = @"";
        _lbl_placeholder.textColor = [UIColor grayColor];//[UIColor colorWithRed:10 green:10 blue:10 alpha:1];//#afafaf;
        _lbl_placeholder.textAlignment = NSTextAlignmentCenter;
    }
    return _lbl_placeholder;
}


-(UIButton *)btn_done{
    if (_btn_done == nil) {
        _btn_done = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn_done setTitle:@"完成" forState:UIControlStateNormal];
        [_btn_done setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_btn_done addTarget:self action:@selector(done) forControlEvents:UIControlEventTouchUpInside];
        _btn_done.titleLabel.font = [UIFont systemFontOfSize:14];
        [_btn_done sizeToFit];
    }
    return _btn_done;
}


@end
