import 'package:flutter/material.dart';
import 'curved_edges.dart';

class AQGMCurvedEdgesWidget extends StatelessWidget {
  const AQGMCurvedEdgesWidget({
    super.key,
   required this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: AQGMCustomCurvedEdges(), child: child);
  }
}
