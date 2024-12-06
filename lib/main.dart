import 'package:bbook/blocs/common/counter_bloc.dart';
import 'package:bbook/blocs/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'routes/app.router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 添加这一行 确保初始化
  await SharedPreferences.getInstance(); // 确保在运行应用前初始化
  runApp(const DyApp());
}

class DyApp extends StatelessWidget {
  const DyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375.0, 1335.0),
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CounterBloc()),
          BlocProvider(create: (context) => HomeBloc())
        ],
        child: MaterialApp.router(
          title: '斗鱼直播',
          routerConfig: appRouter,
          debugShowCheckedModeBanner: false, // 关闭调试模式
          theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
            primaryColor: Colors.orange,
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
