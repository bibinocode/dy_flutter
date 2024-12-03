import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'routes/app.router.dart';

void main() {
  runApp(const DyApp());
}

class DyApp extends StatelessWidget {
  const DyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375.0, 1335.0),
      builder: (context, child) => MaterialApp.router(
        title: '斗鱼直播',
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false, // 关闭调试模式
        theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
            primaryColor: Colors.orange,
            textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.black))),
      ),
    );
  }
}
