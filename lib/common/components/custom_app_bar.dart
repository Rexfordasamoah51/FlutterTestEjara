import 'package:ejaratest/common/values/color.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends AppBar implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    Widget? title,
    WillPopCallback? onWillPop,
    Widget? leading,
    Brightness? brightness,
    Color? backgroundColor,
    List<Widget>? actions,
    bool centerTitle = false,
    double? elevation,
    BuildContext? context,
  }) : super(
          key: key,
          title: title,
          centerTitle: centerTitle,
          backgroundColor: backgroundColor ?? kPrimaryColor,
          actions: actions,
          elevation: elevation ?? 1,
        );
  @override
  get preferredSize => const Size.fromHeight(55);
}
