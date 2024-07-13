import 'package:date_line/utils/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final EdgeInsets? padding;
  final double? elevation;
  final double? shadowSharpness;
  final double? borderRadius;
  final Widget? child;
  final String? text;
  final bool? isLoading;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    this.width,
    this.padding,
    this.elevation,
    this.shadowSharpness,
    this.borderRadius,
    this.text,
    this.isLoading,
    required this.onTap,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Stack(
      children: [
        Container(
          width: width,
          padding: padding ?? const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              transform: const GradientRotation(-180),
            ),
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.outline.withOpacity(shadowSharpness ?? 0.2),
                blurRadius: 6,
                offset: Offset(0, elevation ?? 3),
              ),
            ],
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
          ),
          child: Center(
            child: isLoading == true
                ? CircularProgressIndicator(
                    color: theme.colorScheme.onPrimary,
                  )
                : child ??
                    Text(
                      text ?? "সংরক্ষন করুন",
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
          ),
        ),
        Positioned.fill(
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: onTap ?? () {},
              borderRadius: BorderRadius.circular(borderRadius != null ? (borderRadius! - 1) : 7),
              splashColor: theme.colorScheme.primary.withOpacity(0.3),
              highlightColor: theme.colorScheme.primary.withOpacity(0.3),
            ),
          ),
        ),
      ],
    );
  }
}
