// @description: APP启动页

import 'package:bbook/ui/init/countdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../base.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> with DyBase {
  // TODO  initState 的时候需要做数据请求

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: 1.sw, // 使用屏幕宽度
      height: 1.sh, // 使用屏幕高度
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 25.w,
            right: 25.w,
            child: const Countdown(),
          ),
          SizedBox(
            width: 1.sw,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // 垂直居中
              children: <Widget>[
                Image.asset(
                  'images/init_logo.webp',
                  width: 330.w,
                  // 添加错误处理
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox();
                  },
                ),
                Padding(padding: EdgeInsets.only(top: dp(70))),
                Image.asset(
                  'images/init_icon.png',
                  width: dp(90),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
