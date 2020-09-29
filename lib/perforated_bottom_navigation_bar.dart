import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PerforatedBottomNavigationBar extends StatefulWidget {
  static const MethodChannel _channel =
      const MethodChannel('perforated_bottom_navigation_bar');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  /// scaffold body
  final Widget body;

  /// scaffold drawer
  final Widget drawer;

  /// scaffold appBar
  final PreferredSizeWidget appBar;

  /// scaffold key
  final Key scaffoldKey;

  /// icons list
  final List<IconData> icons;

  /// when icon selected this size will used
  final double selectedIconSize;

  /// when icon is unSelected this size will used
  final double unSelectedIconSize;

  /// icons tooltips
  final List<String> iconsTooltips;

  /// first of all this index selected for bottomNavigationBar
  final int initialIndex;

  /// bottom navigation bar elevation
  final double bottomBarElevation;

  /// color of icon except main big bottom
  final Color iconColor;

  /// color of main bottom icon
  final Color bottomIconColor;

  /// size of main bottom icon
  final double bottomIconSize;

  /// bottom bare key
  final Key bottomBarKey;

  /// bottom bar color
  final Color bottomBarColor;

  PerforatedBottomNavigationBar({
    @required this.body,
    @required this.icons,
    @required this.initialIndex,
    this.appBar,
    this.drawer,
    this.scaffoldKey,
    this.selectedIconSize,
    this.unSelectedIconSize,
    this.iconsTooltips,
    this.bottomBarElevation,
    this.iconColor,
    this.bottomIconColor,
    this.bottomIconSize,
    this.bottomBarKey,
    this.bottomBarColor,
  });

  @override
  State<StatefulWidget> createState() => _PerforatedBottomNavigationBarState();
}

class _PerforatedBottomNavigationBarState
    extends State<PerforatedBottomNavigationBar> {
  int _index;

  @override
  void initState() {
    super.initState();
    setState(() {
      _index = widget.initialIndex ?? 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar ?? Container(),
      drawer: widget.drawer ?? Container(),
      body: widget.appBar ?? Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _tabSelected(2),
        tooltip: widget.iconsTooltips[2],
        child: Icon(
          widget.icons[2],
          color: widget.bottomIconColor,
          size: widget.bottomIconSize ?? 35,
        ),
        elevation: widget.bottomBarElevation ?? 2.0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  widget.icons[4],
                  color: widget.iconColor,
                ),
                onPressed: () => _tabSelected(4),
                padding: EdgeInsets.all(0.0),
                tooltip: widget.iconsTooltips[4],
                iconSize: _index == 4
                    ? (widget.selectedIconSize ?? 30)
                    : (widget.unSelectedIconSize ?? 25),
              ),
              IconButton(
                icon: Icon(
                  widget.icons[3],
                  color: widget.iconColor,
                ),
                onPressed: () => _tabSelected(3),
                padding: EdgeInsets.all(0.0),
                tooltip: widget.iconsTooltips[3],
                iconSize: _index == 3
                    ? (widget.selectedIconSize ?? 30)
                    : (widget.unSelectedIconSize ?? 25),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 5,
              ),
              IconButton(
                icon: Icon(
                  widget.icons[1],
                  color: widget.iconColor,
                ),
                onPressed: () => _tabSelected(1),
                padding: EdgeInsets.all(0.0),
                tooltip: widget.iconsTooltips[1],
                iconSize: _index == 1
                    ? (widget.selectedIconSize ?? 30)
                    : (widget.unSelectedIconSize ?? 25),
              ),
              IconButton(
                icon: Icon(
                  widget.icons[0],
                  color: widget.iconColor,
                ),
                onPressed: () => _tabSelected(0),
                padding: EdgeInsets.all(0.0),
                tooltip: widget.iconsTooltips[0],
                iconSize: _index == 0
                    ? (widget.selectedIconSize ?? 30)
                    : (widget.unSelectedIconSize ?? 25),
              ),
            ],
          ),
        ),
        shape: CircularNotchedRectangle(),
        elevation: widget.bottomBarElevation ?? 15.0,
        color: widget.bottomBarColor,
        key: widget.bottomBarKey ?? Key('bottomNavigationBarKey'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      key: widget.scaffoldKey ?? Key('PerforatedBottomNavigationBarKey'),
    );
  }

  _tabSelected(int index) {
    setState(() {
      _index = index;
    });
  }
}
