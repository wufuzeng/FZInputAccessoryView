# 你刚好需要，我刚好出现，请赏一颗小星星吧.

<p align="center" >
<img src="https://raw.githubusercontent.com/wufuzeng/FZInputAccessoryView/master/Screenshots/771561095316_.pic.jpg" title="FZInputAccessoryView" width = '200px'>
</p>


# FZInputAccessoryView
- 键盘辅助视图 
- [x]  1.为切换文本框输入添加自定义事件。
- [x]  2.提供文本框占位文字显示。
- [x]  3.为放弃编辑添加自定义事件。
 

[![CI Status](https://img.shields.io/travis/wufuzeng/FZInputAccessoryView.svg?style=flat)](https://travis-ci.org/wufuzeng/FZInputAccessoryView)
[![Version](https://img.shields.io/cocoapods/v/FZInputAccessoryView.svg?style=flat)](https://cocoapods.org/pods/FZInputAccessoryView)
[![License](https://img.shields.io/cocoapods/l/FZInputAccessoryView.svg?style=flat)](https://cocoapods.org/pods/FZInputAccessoryView)
[![Platform](https://img.shields.io/cocoapods/p/FZInputAccessoryView.svg?style=flat)](https://cocoapods.org/pods/FZInputAccessoryView)

## 例

要运行示例项目，请克隆repo，然后从Example目录运行 ”pod install“。

## 说明
轻量级键盘辅助视图，API简单，使用方便。
- 事件响应自行定义，
- 事件按钮是否呈现与事件回调是否存在直接相关。

## 安装

FZInputAccessoryView 可通过[CocoaPods](https://cocoapods.org)获得. 要安装它，只需将以下行添加到Podfile文件

```ruby
pod 'FZInputAccessoryView'
```

## How To Use

* Objective-C

```objective-c

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
accessoryView.previousTitle = @"上一个";
accessoryView.nextTitle = @"下一个";
accessoryView.doneTitle = @"完成";

accessoryView.previousBtnClick = ^(NSInteger insex) {

};
accessoryView.nextBtnClick = ^(NSInteger insex) {

};
accessoryView.doneBtnClick = ^(NSInteger insex) {
    [weakSelf.textField resignFirstResponder];
};

textField.inputAccessoryView = accessoryView;
```

## 作者

wufuzeng, wufuzeng_lucky@sina.com

#### 纵有疾风起，人生不言弃

## 许可证

FZInputAccessoryView is available under the MIT license. See the LICENSE file for more info.


