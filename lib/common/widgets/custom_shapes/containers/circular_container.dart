import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class AQGMCircularContainer extends StatelessWidget {
  const AQGMCircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.child,
    this.backgroundColor,
  });

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final Widget? child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: AQGMColors.textWhite.withOpacity(0.1)),
      child: child,
    );
  }
}
