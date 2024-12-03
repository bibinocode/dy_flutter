// @description: APP启动页

import 'package:bbook/ui/init/countdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../base.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with DyBase {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: 1.w, // 屏幕宽度
      child: Stack(
        // 使用Stack布局，方便后续添加其他组件
        children: <Widget>[
          Positioned(
            // 倒计时组件
            top: dp(25),
            right: dp(25),
            child: const Countdown(),
          ),
          SizedBox(
            width: 1.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'images/init_logo.webp',
                  width: dp(330),
                ),
                const Text('hello'),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
