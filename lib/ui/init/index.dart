// @description: APP启动页

import 'package:bbook/blocs/home/home_bloc.dart';
import 'package:bbook/services/index.dart';
import 'package:bbook/ui/init/countdown.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../base.dart';
import '../../httpUrl.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> with DyBase {
  SharedPreferences? prefs; // 共享参数

  @override
  void initState() {
    super.initState();
    _initAsync();
    _getNav();
    _getSwiper();
    _initLiveData();
  }

  void _initAsync() async {
    // App启动时读取Sp数据，需要异步等待Sp初始化完成。
    try {
      prefs = await SharedPreferences.getInstance();
    } catch (e) {
      debugPrint('SharedPreferences error: $e');
    }
  }

  // 获取导航列表
  void _getNav() {
    final homeBloc = BlocProvider.of<HomeBloc>(context);

    httpClient.get(API.nav).then((res) {
      var navList = res.data['data'];
      homeBloc.add(UpdateTab(navList));
    });
  }

  // 获取轮播图列表
  void _getSwiper() {
    final homeBloc = BlocProvider.of<HomeBloc>(context);

    httpClient
        .post(
      API.swiper,
      data: FormData.fromMap({'num': 4}),
      options: cacheOptions
          .copyWith(
            policy: CachePolicy.forceCache,
            maxStale: const Nullable(Duration(minutes: 30)),
            // keyBuilder: (request) => '${request.method}_${request.uri}_swiper',  // 可选：自定义缓存key
          )
          .toOptions(),
    )
        .then((res) {
      var swiper = res.data['data'];
      homeBloc.add(UpdateSwiper(swiper));
    }).catchError((err) {
      homeBloc.add(UpdateSwiper([]));
    });
  }

  void _initLiveData() async {
    final homeBloc = BlocProvider.of<HomeBloc>(context);

    var liveList = await DYservice.getLiveData(context);
    homeBloc.add(UpdateLiveData(liveList));
  }

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
