import 'package:flutter/material.dart';
import 'package:wechat_flutter/ui/w_pop/menu_popup_widget.dart';

/// 1.长按  2.单击
enum PressType { longPress, singleClick }

class PopupMenuRoute extends PopupRoute {
  final BuildContext btnContext;
  late double _height;
  late double _width;
  final List<Map<String, String>> actions;
  final int _pageMaxChildCount;
  final Color backgroundColor;
  final double menuWidth;
  final double menuHeight;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final ValueChanged<String> onValueChanged;

  PopupMenuRoute(
      this.btnContext,
      this.actions,
      this._pageMaxChildCount,
      this.backgroundColor,
      this.menuWidth,
      this.menuHeight,
      this.padding,
      this.margin,
      this.onValueChanged,
      ) {
    _height = btnContext.size!.height -
        (padding == null
            ? margin == null
            ? 0
            : margin.vertical
            : padding.vertical);
    _width = btnContext.size!.width -
        (padding == null
            ? margin == null
            ? 0
            : margin.horizontal
            : padding.horizontal);
  }

  @override
  Animation<double> createAnimation() {
    return CurvedAnimation(
      parent: super.createAnimation(),
      curve: Curves.linear,
      reverseCurve: const Interval(0.0, 2.0 / 3.0),
    );
  }

  @override
  Color? get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return MenuPopWidget(
      btnContext: btnContext,
      height: _height,
      width: _width,
      actions: actions,
      pageMaxChildCount: _pageMaxChildCount,
      backgroundColor: backgroundColor,
      menuWidth: menuWidth,
      menuHeight: menuHeight,
      padding: padding,
      margin: margin,
    );
  }

  @override
  Duration get transitionDuration => Duration(milliseconds: 300);
}