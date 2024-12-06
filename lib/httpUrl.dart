import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:web_socket_channel/io.dart';

import 'base.dart';

// 接口API

abstract class API {
  static const nav = '/dy/flutter/nav'; // 首页顶部导航
  static const swiper = '/dy/flutter/swiper'; // 首页轮播图
  static const broadcast = '/dy/flutter/broadcast'; // 首页推荐广播
  static const liveData = '/dy/flutter/liveData'; // 首页直播视频列表
  static const lotteryConfig = '/dy/flutter/lotteryConfig'; // 抽奖配置信息
  static const lotteryResult = '/dy/flutter/lotteryResult'; // 点击抽奖结果
  static const yubaList = '/dy/flutter/yubaList'; // 鱼吧列表
  static const areaList = '/static/areaTel.json'; // 国家地区号码静态文件
}

// http请求
final cacheOptions = CacheOptions(
  store: MemCacheStore(), // 使用内存缓存
  policy: CachePolicy.request, // 缓存策略
  hitCacheOnErrorExcept: [], // 错误时是否缓存
  maxStale: const Duration(days: 1), // 最大缓存时间
);

final httpClient = Dio(BaseOptions(
  baseUrl: DyBase.baseUrl,
  responseType: ResponseType.json,
  connectTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 3),
  validateStatus: (status) {
    return status! < 500; // 允许状态码小于500的响应
  },
))
  ..interceptors.add(DioCacheInterceptor(options: cacheOptions));

// 直播房间webSocket
class SocketClient {
  static late IOWebSocketChannel channel; // 使用late关键字

  SocketClient.create() {
    SocketClient.channel = IOWebSocketChannel.connect(
        Uri.parse('ws://${DyBase.baseHost}:${DyBase.basePort}/socket/dy/flutter'));
  }
}
