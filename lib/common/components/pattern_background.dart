import 'package:ejaratest/common/components/widget_wrapper.dart';
import 'package:flutter/material.dart';

class PatternBackground extends StatelessWidget {
  /// A patterned background for the onboarding and the auth screens
  ///
  /// This widget accepts a [child] property usually a view

  final Widget body;

  /// the [child] property may not be null
  const PatternBackground({
    Key? key,
    required this.body,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppWrapper(
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: OrientationBuilder(
              builder: (context, Orientation orientation) {
                return orientation == Orientation.portrait
                    ? Image.asset(
                        'assets/app_background_pattern2.png',
                        fit: BoxFit.fitWidth,
                      )
                    : const SizedBox.shrink();
              },
            ),
          ),
          SafeArea(child: body),
        ],
      ),
    );
  }
}
