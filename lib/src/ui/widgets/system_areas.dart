import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:free_gpt/src/core/core.dart';

class SystemAreas extends StatelessWidget {
  const SystemAreas({super.key, required this.child, this.systemNavigationBarColor});
  final Widget child;
  final Color? systemNavigationBarColor;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: KTheme.sysBrightness(context),
        statusBarIconBrightness: KTheme.sysBrightness(context),
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: systemNavigationBarColor,
      ),
      child: child,
    );
  }
}
