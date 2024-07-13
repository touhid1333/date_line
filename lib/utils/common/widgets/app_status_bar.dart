import 'package:date_line/utils/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppStatusBar extends StatelessWidget {
  final Widget child;

  const AppStatusBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return SafeArea(
      child: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: theme.scaffoldBackgroundColor,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: child,
      ),
    );
  }
}
