import 'package:flutter/material.dart';
import 'package:shopify_merchant/core/settings/custom_theme.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;
  final List<Color> colors;
  final List<double> stops;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;

  const BackgroundWidget({
    super.key,
    required this.child,
    this.colors = const [
      CustomTheme.primary,
      CustomTheme.orange,
    ],
    this.stops = const [.5, .8],
    this.end = Alignment.bottomRight,
    this.begin = Alignment.centerLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: colors,
            begin: begin,
            end: end,
            stops: stops,
            transform: const GradientRotation(.0)),
      ),
      child: child,
    );
  }
}
