import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// -----------------------------------
/// Develop by Mr Hafid - MIT Licensed
/// Licensed : https://go.mrhafid.my.id/mrlicense
/// Website : https://mrhafid.my.id
/// Github : https://github.com/mrhafid
/// ------------------------------------

// final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
//     new GlobalKey<RefreshIndicatorState>();

class WidgetRefresh extends StatefulWidget {
  final bool appBar;
  final SliverAppBar? sliverAppBar;
  final Future Function() onRefresh;
  final GlobalKey<RefreshIndicatorState>? refreshIndicatorKey;
  // final GlobalKey<LiquidPullToRefreshState>? refreshIndicatorLiquidKey;
  final Color backgroundColor;
  final Widget childAdapter;
  final bool isIos;
  final bool isLiquid;
  const WidgetRefresh(
      {super.key,
      this.appBar = false,
      this.sliverAppBar,
      this.refreshIndicatorKey,
      // this.refreshIndicatorLiquidKey,
      this.backgroundColor = Colors.blue,
      required this.onRefresh,
      required this.childAdapter,
      this.isIos = true,
      this.isLiquid = false});

  @override
  _WidgetRefreshState createState() => _WidgetRefreshState();
}

class _WidgetRefreshState extends State<WidgetRefresh> {
  @override
  Widget build(BuildContext context) =>
      widget.isIos ? buildIosWidget() : buildAndroidWidget();

  Widget buildAndroidWidget() => RefreshIndicator(
      key: widget.refreshIndicatorKey,
      onRefresh: widget.onRefresh,
      child: widget.childAdapter);

  Widget buildIosWidget() => CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: widget.appBar
            ? [
                widget.sliverAppBar!,
                CupertinoSliverRefreshControl(
                  onRefresh: widget.onRefresh,
                  key: widget.refreshIndicatorKey,
                ),
                SliverToBoxAdapter(
                  child: widget.childAdapter,
                )
              ]
            : [
                CupertinoSliverRefreshControl(
                  onRefresh: widget.onRefresh,
                  key: widget.refreshIndicatorKey,
                ),
                SliverToBoxAdapter(
                  child: widget.childAdapter,
                )
              ],
      );

    // Widget buildLiquidWidtet() => LiquidPullToRefresh(
    //     // backgroundColor: widget.backgroundColor,
    //     color: widget.backgroundColor,
    //     springAnimationDurationInMilliseconds: 400,
    //     animSpeedFactor: 2.0,
    //     key: widget.refreshIndicatorLiquidKey, // key if you want to add
    //     onRefresh: widget.onRefresh, // refresh callback
    //     showChildOpacityTransition: false,
    //     child: widget.childAdapter, // scroll view
    //   );
}
