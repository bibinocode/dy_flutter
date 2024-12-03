// 右上角倒计时组件
import 'dart:math' as Math;

import 'package:bbook/base.dart';
import 'package:bbook/routes/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class Countdown extends StatefulWidget {
  const Countdown({super.key});

  @override
  CountdownState createState() => CountdownState();
}

class CountdownState extends State<Countdown> with DyBase, SingleTickerProviderStateMixin {
  late Animation<double> _animation; // canvas转动动画函数 late 关键字表示这些变量会在使用前被初始化
  late AnimationController _controller; // canvas转动动画控制器
  final int _time = 5; // 首页载入秒数

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light, // IOS 状态栏样式
      statusBarIconBrightness: Brightness.light, // Android状态栏图标颜色
    ));

    // 创建动画控制器 vsync 参数需要实现 SingleTickerProviderStateMixin 类
    _controller = AnimationController(duration: Duration(seconds: _time), vsync: this);
    // 创建动画函数 360度旋转
    _animation = Tween(begin: 0.0, end: 360.0).animate(_controller);
    // 监听动画变化 调用setState通知Flutter重绘UI
    _controller.addListener(() {
      setState(() {});
    });
    _controller.addStatusListener((AnimationStatus a) {
      if (a == AnimationStatus.completed) {
        _jumpIndex();
      }
    });

    _controller.forward(); // 开始动画
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _jumpIndex() {
    // 倒计时结束跳转到首页 mounted 确保 widget 还在树中
    if (mounted) {
      context.go(RouterPaths.home); // go替换路由
    }
  }

  @override
  Widget build(BuildContext context) {
    // 计算倒计时数字 动画值 * 总秒数 / 360度 取整
    var countNum = _time - (_animation.value * _time / 360).round();
    return GestureDetector(
      // 手势检测器 用于检测用户在屏幕上的触摸、点击、长按等手势
      onTap: _jumpIndex,
      child: Container(
        width: dp(50),
        height: dp(50),
        decoration: ShapeDecoration(
            color: const Color.fromARGB(70, 0, 0, 0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(dp(50))))),
        child: CustomPaint(
          painter: CircleProgressBarPainter(_animation.value),
          child: Center(
            child: Text(
              '${countNum}s',
              style: TextStyle(
                color: Colors.white,
                fontSize: sp(16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// 画布绘制加载倒计时
class CircleProgressBarPainter extends CustomPainter {
  late Paint _paintFore;
  final rate;

  CircleProgressBarPainter(this.rate) {
    _paintFore = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..isAntiAlias = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    ); // 创建圆弧矩形
    canvas.drawArc(rect, 0.0, rate * Math.pi / 180, false, _paintFore); // 绘制圆弧
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
