import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppWrapper extends StatelessWidget {
  const AppWrapper({
    Key? key,
    required this.child,
    this.bottomNavigationBar,
    this.appBar,
  }) : super(key: key);

  final Widget child;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appBar;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: Colors.white,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        bottomNavigationBar: bottomNavigationBar,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: appBar,
        body: SafeArea(
          child: child,
        ),
      ),
    );
  }
}
