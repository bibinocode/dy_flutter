# 某些 API 的作用

## SystemChrome.setSystemUIOverlayStyle

- 用来设置 Android/iOS 系统状态栏样式的
  1. 设置状态栏的外观样式
  2. 控制状态栏图标(时间、电池、信号等)的颜色

```dart
SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  statusBarBrightness: Brightness.light,      // iOS状态栏样式 表示浅色背景下的深色文字
  statusBarIconBrightness: Brightness.light,  // Android状态栏图标颜色
));
```

## FractionalOffset

- 用于设置偏移量 相对于父组件的位置
- 常用属性

  - begin: 起始偏移量
  - end: 结束偏移量

- 示例网站:
  - https://api.flutter.dev/flutter/painting/FractionalOffset-class.html

```dart
FractionalOffset(0.5, 0.5); // 表示偏移量为50%
FractionalOffset.center; // 表示偏移量为50%
FractionalOffset.bottomCenter; // 表示偏移量为底部中心
FractionalOffset.bottomRight; // 表示偏移量为底部右方
FractionalOffset.topLeft; // 表示偏移量为顶部左方
FractionalOffset.topRight; // 表示偏移量为顶部右方
FractionalOffset.centerLeft; // 表示偏移量为中心左方
FractionalOffset.centerRight; // 表示偏移量为中心右方
FractionalOffset.topCenter; // 表示偏移量为顶部中心
FractionalOffset.bottomCenter; // 表示偏移量为底部中心
FractionalOffset.bottomLeft; // 表示偏移量为底部左方
```
