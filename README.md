# 如果你有需要，而我这里正好有，请给一颗小星星.

<p align="center" >
<img src="https://raw.githubusercontent.com/wufuzeng/FZInputAccessoryView/master/Screenshots/771561095316_.pic.jpg" title="FZInputAccessoryView" float=left width = '200px'>
</p>


# FZInputAccessoryView
键盘辅助视图
1.为切换文本框输入添加自定义事件。
2.为放弃编辑添加自定义事件。





[![CI Status](https://img.shields.io/travis/wufuzeng/FZInputAccessoryView.svg?style=flat)](https://travis-ci.org/wufuzeng/FZInputAccessoryView)
[![Version](https://img.shields.io/cocoapods/v/FZInputAccessoryView.svg?style=flat)](https://cocoapods.org/pods/FZInputAccessoryView)
[![License](https://img.shields.io/cocoapods/l/FZInputAccessoryView.svg?style=flat)](https://cocoapods.org/pods/FZInputAccessoryView)
[![Platform](https://img.shields.io/cocoapods/p/FZInputAccessoryView.svg?style=flat)](https://cocoapods.org/pods/FZInputAccessoryView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

FZInputAccessoryView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

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
accessoryView.doneTitle = @"确定";

accessoryView.previousBtnClick = ^(NSInteger insex) {

};

accessoryView.nextBtnClick = ^(NSInteger insex) {

};
accessoryView.doneBtnClick = ^(NSInteger insex) {
[weakSelf.textField resignFirstResponder];
};

textField.inputAccessoryView = accessoryView;;
```

## Author

wufuzeng, wufuzeng_lucky@sina.com

## License

FZInputAccessoryView is available under the MIT license. See the LICENSE file for more info.
