import 'package:bbook/base.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with DyBase {
  // 底部导航栏
  final _bottomNavigationBarList = ["推荐", "娱乐", "鱼吧", "关注", "发现"];
//上次点击返回按钮时间
  late DateTime _lastCloseApp;
  int _currentIndex = 0; // 当前选中项
  final ScrollController _scrollController = ScrollController(); // 首页整体滚动控制器
  final PageController _pageController = PageController(); // 首页页面控制器

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // 回到顶部
  void _indexPageScrollTop() {
    _scrollController.animateTo(
      .0,
      duration: const Duration(
        milliseconds: 300,
      ),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        child: Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed, // 类型固定底部
        selectedItemColor: DyBase.defaultColor, // 选中颜色
        unselectedItemColor: const Color(0xff333333), // 未选中颜色
        selectedFontSize: sp(12), // 选中字体大小
        unselectedFontSize: sp(12), // 未选中字体大小
        onTap: (index) {
          if (mounted) {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        items: [
          BottomNavigationBarItem(
              label: _bottomNavigationBarList[0],
              icon: _currentIndex == 0
                  ? _bottomIcon('images/nav/nav-12.jpg')
                  : _bottomIcon('images/nav/nav-11.jpg')),
          BottomNavigationBarItem(
              label: _bottomNavigationBarList[1],
              icon: _currentIndex == 1
                  ? _bottomIcon('images/nav/nav-22.jpg')
                  : _bottomIcon('images/nav/nav-21.jpg')),
          BottomNavigationBarItem(
              label: _bottomNavigationBarList[2],
              icon: _currentIndex == 2
                  ? _bottomIcon('images/nav/nav-42.jpg')
                  : _bottomIcon('images/nav/nav-41.jpg')),
          BottomNavigationBarItem(
              label: _bottomNavigationBarList[3],
              icon: _currentIndex == 3
                  ? _bottomIcon('images/nav/nav-32.jpg')
                  : _bottomIcon('images/nav/nav-31.jpg')),
          BottomNavigationBarItem(
              label: _bottomNavigationBarList[4],
              icon: _currentIndex == 4
                  ? _bottomIcon('images/nav/nav-52.jpg')
                  : _bottomIcon('images/nav/nav-51.jpg')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent, // 悬浮按钮背景颜色
        foregroundColor: DyBase.defaultColor, // 悬浮按钮文字颜色
        tooltip: 'Increment', // 悬浮按钮提示文字
        onPressed: () {},
        child: Image.asset(
          'images/float-icon.webp',
          width: dp(100),
          height: dp(100),
          fit: BoxFit.contain,
        ),
      ),
      resizeToAvoidBottomInset: false, // 如果为ture，当键盘弹出时，页面会自动调整，避免被键盘遮挡
    ));
  }

  Widget _bottomIcon(String path) {
    return Padding(
      padding: EdgeInsets.only(bottom: dp(4)),
      child: Image.asset(
        path,
        width: dp(25),
        height: dp(25),
        repeat: ImageRepeat.noRepeat,
        fit: BoxFit.contain,
        alignment: Alignment.center,
      ),
    );
  }
}
