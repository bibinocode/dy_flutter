// 公共抽象类 可以存放基础配置方法和共用类
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

mixin DyBase {
  // 设计稿尺寸
  static const double dessignWidth = 375.0;
  static const double dessignHeight = 1335.0;

  // 状态栏高度
  static double statusBarHeight(BuildContext context) {
    return ScreenUtil().statusBarHeight;
  }

  static const baseSchema = 'http';

  // 适配转dp
  double dp(double dessignValue) => ScreenUtil().setWidth(dessignValue).toDouble();

  // 适配字体sp
  double sp(double dessignValue) => ScreenUtil().setSp(dessignValue).toDouble();
}
