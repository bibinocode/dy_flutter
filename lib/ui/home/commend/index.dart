import 'package:bbook/base.dart';
import 'package:bbook/blocs/home/home_bloc.dart';
import 'package:bbook/services/index.dart';
import 'package:bbook/ui/home/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommendPage extends StatefulWidget {
  final _scrollController;
  const CommendPage(this._scrollController, {super.key});

  @override
  _CommendPageState createState() => _CommendPageState();
}

class _CommendPageState extends State<CommendPage> with DyBase, AutomaticKeepAliveClientMixin {
  ScrollController get _scrollController => widget._scrollController;

  _CommendPageState();

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<HomeBloc, Map>(builder: (context, indexState) {
      List navList = indexState['nav'];
      return Scaffold(
        body: navList.isEmpty
            ? null
            : DefaultTabController(
                length: navList.length,
                child: NestedScrollView(
                  controller: _scrollController,
                  headerSliverBuilder: (context, innerScrolled) => <Widget>[
                    // 使用[SliverAppBar]组件实现下拉收起头部效果
                    SliverAppBar(
                      backgroundColor: const Color(0xffff6634),
                      systemOverlayStyle: SystemUiOverlayStyle.dark,
                      pinned: true,
                      floating: true,
                      expandedHeight: dp(55) + 49,
                      actions: const <Widget>[
                        DyHeader(
                          decoration: BoxDecoration(color: Colors.transparent),
                        ),
                      ],
                      flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: FractionalOffset.centerLeft,
                              end: FractionalOffset.centerRight,
                              colors: <Color>[Color(0xffff8633), Color(0xffff6634)],
                            ),
                          ),
                        ),
                      ),
                      bottom: TabBar(
                        indicator: const BoxDecoration(),
                        isScrollable: true,
                        unselectedLabelStyle: TextStyle(fontSize: sp(15)),
                        labelStyle: TextStyle(fontSize: sp(18)),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white70,
                        indicatorWeight: 3,
                        tabs: navList.map((e) => Tab(text: e)).toList(),
                      ),
                      forceElevated: innerScrolled,
                    )
                  ],
                  body: TabBarView(
                    children: navList
                        .asMap()
                        .map(
                          (i, tab) => MapEntry(
                            i,
                            Builder(
                              builder: (context) => Container(
                                color: Colors.white,
                                child: ScrollConfiguration(
                                  behavior: DyBehaviorNull(),
                                  child: Text(tab),
                                ),
                              ),
                            ),
                          ),
                        )
                        .values
                        .toList(),
                  ),
                ),
              ),
      );
    });
  }
}
