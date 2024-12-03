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
