import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
      this.childCountSliverList});
  final bool isIos;
  final bool appBar;
  final SliverAppBar? sliverAppBar;
  final Future Function() onRefresh;
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey;
  final Widget? childAdapter;
  final bool wSliverList;
  final Widget? Function(BuildContext, int)? builderSliverlist;
  final int? childCountSliverList;

  @override
  Widget build(BuildContext context) =>
      isIos ? buildIosWidget() : buildAndroidWidget();

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
}
