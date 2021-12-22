import 'package:flutter/material.dart';

class VerticalSpacing extends StatelessWidget {
  /// This is used to give spaces in between widgets vertically
  ///
  /// It accepts an [height] as a property which specifies the amount of space vertically

  final double? height;

  /// The [height] property cannot be null
  const VerticalSpacing(this.height, {Key? key})
      : assert(height != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
