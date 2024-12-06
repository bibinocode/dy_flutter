// 去除安卓滚动视图水波纹
import 'dart:io';
import 'dart:math';

import 'package:bbook/blocs/common/counter_bloc.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../httpUrl.dart';

class DyBehaviorNull extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    if (Platform.isAndroid || Platform.isFuchsia) {
      return child;
    }
    return super.buildOverscrollIndicator(context, child, details);
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}

abstract class DYservice {
  // 获取直播间列表
  static Future<List> getLiveData(context, [pageIndex]) async {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    int livePageIndex = counterBloc.state;

    var res = await httpClient.get(
      API.liveData,
      queryParameters: {'page': pageIndex ?? livePageIndex},
      options: livePageIndex == 1
          ? cacheOptions.copyWith(maxStale: const Nullable(Duration(minutes: 30))).toOptions()
          : null,
    );

    counterBloc.add(CounterEvent.increment);
    return res.data['data']['list'];
  }

  // 格式化数值
  static String formatNum(int number) {
    if (number > 10000) {
      var str = DYservice._formatNum(number / 10000, 1);
      if (str.split('.')[1] == '0') {
        str = str.split('.')[0];
      }
      return '$str万';
    }
    return number.toString();
  }

  static String _formatNum(double number, int postion) {
    if ((number.toString().length - number.toString().lastIndexOf(".") - 1) < postion) {
      // 小数点后有几位小数
      return (number
          .toStringAsFixed(postion)
          .substring(0, number.toString().lastIndexOf(".") + postion + 1)
          .toString());
    } else {
      return (number
          .toString()
          .substring(0, number.toString().lastIndexOf(".") + postion + 1)
          .toString());
    }
  }

  // 格式化时间
  static String formatTime(int timeSec) {
    var date = DateTime.fromMillisecondsSinceEpoch(timeSec * 1000);
    var now = DateTime.now();
    var yesterday =
        DateTime.fromMillisecondsSinceEpoch(now.millisecondsSinceEpoch - 24 * 60 * 60 * 1000);

    if (date.year == now.year && date.month == now.month && date.day == now.day) {
      return '今天${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
    } else if (date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day) {
      return '昨天${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
    }
    return '${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  // 生成随机串
  static dynamic randomBit(int len, {required String type}) {
    String character =
        type == 'num' ? '0123456789' : 'qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM';
    String left = '';
    for (var i = 0; i < len; i++) {
      left = left + character[Random().nextInt(character.length)];
    }
    return type == 'num' ? int.parse(left) : left;
  }
}
