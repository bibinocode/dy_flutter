// 公共抽象类 可以存放基础配置方法和共用类
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

mixin DyBase {
  static const baseSchema = 'http';
  static const baseHost = '192.168.10.15';
  static const basePort = '1236';
  static const baseUrl = '${DyBase.baseSchema}://${DyBase.baseHost}:${DyBase.basePort}';

  // 默认主题色
  static const defaultColor = Color(0xffff5d23);

  // 设计稿尺寸
  static const double dessignWidth = 375.0;
  static const double dessignHeight = 1335.0;

  // 状态栏高度
  static double statusBarHeight(BuildContext context) {
    return ScreenUtil().statusBarHeight;
  }

  // 适配转dp
  double dp(double dessignValue) => ScreenUtil().setWidth(dessignValue).toDouble();

  // 适配字体sp
  double sp(double dessignValue) => ScreenUtil().setSp(dessignValue).toDouble();
}
