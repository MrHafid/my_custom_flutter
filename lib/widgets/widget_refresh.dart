import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// -----------------------------------
/// Develop by Mr Hafid - MIT Licensed
/// Licensed : https://raw.githubusercontent.com/MrHafid/my_custom_flutter/main/LICENSE
/// Website : https://mrhafid.my.id
/// Github : https://github.com/mrhafid
/// ------------------------------------

// final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
//     new GlobalKey<RefreshIndicatorState>();

class WidgetRefresh extends StatefulWidget {
  final bool appBar;
  final SliverAppBar? sliverAppBar;
  final Future Function() onRefresh;
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey;
  final Widget childAdapter;
  final bool isIos;
  const WidgetRefresh(
      {super.key,
      this.appBar = false,
      this.sliverAppBar,
      required this.refreshIndicatorKey,
      required this.onRefresh,
      required this.childAdapter,
      this.isIos = true});

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
}
