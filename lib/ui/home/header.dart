import 'dart:io';

import 'package:bbook/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DyHeader extends StatefulWidget {
  final double? height;
  final double opacity;
  final BoxDecoration? decoration;

  const DyHeader({super.key, this.height, this.opacity = 1.0, this.decoration});

  @override
  DyHeaderState createState() => DyHeaderState();
}

class DyHeaderState extends State<DyHeader> with DyBase {
  final TextEditingController _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? DyBase.statusBarHeight(context) + dp(55),
      width: 1.sw,
      decoration: widget.decoration ??
          const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xffff8633),
                Color(0xffff6634),
              ],
            ),
          ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Positioned(
            bottom: dp(10.0),
            child: Opacity(
              opacity: widget.opacity,
              child: SizedBox(
                width: 1.sw - dp(30),
                height: dp(40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    // 头像
                    ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(dp(20)),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          //TODO: 显示login
                        },
                        child: Image.asset(
                          'images/default-avatar.webp',
                          width: dp(40),
                          height: dp(40),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: dp(35),
                        margin: EdgeInsets.only(left: dp(15)),
                        padding: EdgeInsets.only(left: dp(5), right: dp(5)),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(dp(35 / 2)),
                          ),
                        ),
                        child: Row(
                          children: [
                            // 搜索Icon
                            Image.asset(
                              'images/head/search.webp',
                              width: dp(25),
                              height: dp(15),
                            ),
                            // 输入框
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: _search,
                                      cursorColor: DyBase.defaultColor,
                                      cursorWidth: 1.5,
                                      style: TextStyle(
                                        color: DyBase.defaultColor,
                                        fontSize: sp(14.0),
                                      ),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        contentPadding: EdgeInsets.all(0),
                                        hintText: '搜你喜欢的内容吧~',
                                      ),
                                    ),
                                  ),
                                  // 是安卓的话就扫一扫显示
                                  if (Platform.isAndroid)
                                    GestureDetector(
                                      onTap: () {}, // TODO: 扫一扫
                                      child: Image.asset(
                                        'images/head/camera.webp',
                                        width: dp(20),
                                        height: dp(15),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // 三个图标
                    Padding(
                      padding: EdgeInsets.only(
                        left: dp(10),
                      ),
                      child: Image.asset(
                        'images/head/history.webp',
                        width: dp(25),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: dp(10),
                      ),
                      child: Image.asset(
                        'images/head/game.webp',
                        width: dp(25),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: dp(10),
                      ),
                      child: Image.asset(
                        'images/head/chat.webp',
                        width: dp(25),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
