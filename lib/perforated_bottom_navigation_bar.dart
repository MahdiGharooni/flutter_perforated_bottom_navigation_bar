import 'package:flutter/material.dart';

class PerforatedBottomNavigationBar extends StatefulWidget {

  /// scaffold body
  final List<Widget> body;

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

  /// first of all this index selected for buttonNavigationBar
  final int initialIndex;

  /// button navigation bar elevation
  final double buttonBarElevation;

  /// color of icon except main big button
  final Color iconColor;

  /// color of icon when selected
  final Color selectedIconColor;

  /// color of main button icon
  final Color buttonIconColor;

  /// size of main button icon
  final double buttonIconSize;

  /// button bare key
  final Key bottomBarKey;

  /// button bar color
  final Color bottomBarColor;

  /// tabs titles
  final List<Widget> appBarTitles;

  /// app bar elevation
  final List<Widget> appBarElevation;

  /// appbar background color
  final Color appBarBackgroundColor;

  /// appbar center title
  final bool appBarCenterTitle;

  /// button background color
  final Color buttonBackgroundColor ;

  PerforatedBottomNavigationBar({
    @required this.body,
    @required this.icons,
    @required this.initialIndex,
    this.drawer,
    this.scaffoldKey,
    this.selectedIconSize,
    this.unSelectedIconSize,
    this.iconsTooltips,
    this.buttonBarElevation,
    this.iconColor,
    this.buttonIconColor,
    this.buttonIconSize,
    this.bottomBarKey,
    this.bottomBarColor,
    this.appBarTitles,
    this.appBar,
    this.appBarElevation,
    this.appBarBackgroundColor,
    this.appBarCenterTitle, this.selectedIconColor, this.buttonBackgroundColor,
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
      appBar: widget.appBar ??
          AppBar(
            title: widget.appBarTitles[_index],
            elevation: widget.appBarElevation ?? 0,
            backgroundColor: widget.appBarBackgroundColor ?? Colors.transparent,
            centerTitle: widget.appBarCenterTitle ?? true,
          ),
      drawer: widget.drawer ?? null,
      body: widget.body[_index] ?? Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _tabSelected(2),
        tooltip: widget.iconsTooltips[2] ?? '',
        child: Icon(
          widget.icons[2],
          color: widget.buttonIconColor,
          size: widget.buttonIconSize ?? 35,
        ),
        elevation: widget.buttonBarElevation ?? 2.0,
        backgroundColor: widget.buttonBackgroundColor??null,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  widget.icons[4],
                  color: (widget.selectedIconColor != null && _index == 4)?widget.selectedIconColor  : widget.iconColor,
                ),
                onPressed: () => _tabSelected(4),
                padding: EdgeInsets.all(0.0),
                tooltip: widget.iconsTooltips[4] ?? '',
                iconSize: _index == 4
                    ? (widget.selectedIconSize ?? 30)
                    : (widget.unSelectedIconSize ?? 25),
              ),
              IconButton(
                icon: Icon(
                  widget.icons[3],
                  color: (widget.selectedIconColor != null && _index == 3)?widget.selectedIconColor  : widget.iconColor,
                ),
                onPressed: () => _tabSelected(3),
                padding: EdgeInsets.all(0.0),
                tooltip: widget.iconsTooltips[3] ?? '',
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
                  color: (widget.selectedIconColor != null && _index == 1)?widget.selectedIconColor  : widget.iconColor,
                ),
                onPressed: () => _tabSelected(1),
                padding: EdgeInsets.all(0.0),
                tooltip: widget.iconsTooltips[1] ?? '',
                iconSize: _index == 1
                    ? (widget.selectedIconSize ?? 30)
                    : (widget.unSelectedIconSize ?? 25),
              ),
              IconButton(
                icon: Icon(
                  widget.icons[0],
                  color: (widget.selectedIconColor != null && _index == 0)?widget.selectedIconColor  : widget.iconColor,
                ),
                onPressed: () => _tabSelected(0),
                padding: EdgeInsets.all(0.0),
                tooltip: widget.iconsTooltips[0] ?? '',
                iconSize: _index == 0
                    ? (widget.selectedIconSize ?? 30)
                    : (widget.unSelectedIconSize ?? 25),
              ),
            ],
          ),
        ),
        shape: CircularNotchedRectangle(),
        elevation: widget.buttonBarElevation ?? 15.0,
        color: widget.bottomBarColor,
        key: widget.bottomBarKey ?? Key('buttonNavigationBarKey'),
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
