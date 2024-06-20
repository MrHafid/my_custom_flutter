import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_refresh/liquid_pull_refresh.dart';

/// Key Liquid Ex
/// final GlobalKey<LiquidPullRefreshState> refreshIndicatorKey = GlobalKey<LiquidPullRefreshState>();
/// Package - https://pub.dev/packages/liquid_pull_refresh

class WidgetRefresh extends StatelessWidget {
  const WidgetRefresh(
      {super.key,
      this.appBar = false,
      this.sliverAppBar,
      required this.refreshIndicatorKey,
      required this.onRefresh,
      this.childAdapter,
      this.isIos = true,
      this.wSliverList = false,
      this.builderSliverlist,
      this.childCountSliverList,
      // Liquid
      this.isLiquid = false,
      this.isShadow = false,
      this.loaderColor = Colors.white,
      this.backgroundColor = Colors.blue,
      this.heightLoader,
      this.loaderWidget,
      this.refreshIndicatorLiquidKey});
  final bool isIos;
  final bool appBar;
  final SliverAppBar? sliverAppBar;
  final Future Function() onRefresh;
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey;
  final Widget? childAdapter;
  final bool wSliverList;
  final Widget? Function(BuildContext, int)? builderSliverlist;
  final int? childCountSliverList;

  // Liquid Refresh Pull
  final bool isLiquid;
  final bool isShadow;
  final Widget? loaderWidget;
  final Color backgroundColor;
  final Color loaderColor;
  final double? heightLoader;
  final GlobalKey<LiquidPullRefreshState>? refreshIndicatorLiquidKey;

  @override
  Widget build(BuildContext context) => isLiquid
      ? buildLiquidWidget()
      : (isIos ? buildIosWidget() : buildAndroidWidget());

  Widget buildAndroidWidget() => RefreshIndicator(
      key: refreshIndicatorKey, onRefresh: onRefresh, child: childAdapter!);

  Widget buildIosWidget() => CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: appBar
            ? [
                sliverAppBar!,
                CupertinoSliverRefreshControl(
                  onRefresh: onRefresh,
                  key: refreshIndicatorKey,
                ),
                wSliverList
                    ? SliverList(
                        delegate: SliverChildBuilderDelegate(builderSliverlist!,
                            childCount: childCountSliverList))
                    : SliverToBoxAdapter(
                        child: childAdapter,
                      )
              ]
            : [
                CupertinoSliverRefreshControl(
                  onRefresh: onRefresh,
                  key: refreshIndicatorKey,
                ),
                wSliverList
                    ? SliverList(
                        delegate: SliverChildBuilderDelegate(builderSliverlist!,
                            childCount: childCountSliverList))
                    : SliverToBoxAdapter(
                        child: childAdapter,
                      )
              ],
      );

   Widget buildLiquidWidget() => LiquidPullRefresh(
        backgroundColor: loaderColor,
        // animSpeedFactor: 2.0,
        color: backgroundColor,
        heightLoader: 150,
        height: heightLoader,
        bottomShaddow: isShadow,
        // showDroplet: true,
        loaderWidget: loaderWidget,
        springAnimationDurationInMilliseconds: 400,
        showChildOpacityTransition: false,
        key: refreshIndicatorLiquidKey, // key if you want to add
        onRefresh: onRefresh, // refresh callback
        child: childAdapter!, // scroll view
      );
}
