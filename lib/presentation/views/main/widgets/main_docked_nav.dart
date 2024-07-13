import 'package:date_line/utils/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

class MainDockedNav extends StatelessWidget {
  const MainDockedNav({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      height: 56,
      width: 56,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 3),
            blurRadius: 6,
          ),
        ],
        gradient: LinearGradient(
            colors: [theme.colorScheme.secondary, theme.colorScheme.primary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: FloatingActionButton(
        backgroundColor: Colors.transparent,
        shape: const CircleBorder(),
        elevation: 0,
        onPressed: () {},
        child: Image.asset(
          "assets/icons/ic_camera.png",
          height: 32,
          width: 32,
          color: theme.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
