import 'package:flutter/material.dart';
import 'package:safar_store/common/widgets/custom_shapes/clipper/custom_rounded_clipper.dart';

class URoundedEdges extends StatelessWidget {
  const URoundedEdges({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: UCustomRoundedEdges(), child: child);
  }
}
