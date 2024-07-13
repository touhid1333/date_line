import 'package:date_line/utils/extensions/build_context_extensions.dart';
import 'package:date_line/utils/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final bool automaticallyImplyLeading;
  final bool showAppLogo;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.centerTitle = true,
    this.automaticallyImplyLeading = true,
    this.showAppLogo = true,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      centerTitle: centerTitle,

      // title
      title: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (showAppLogo)
            Image.asset(
              "assets/icons/ic_app_icon.png",
              height: 35,
              width: 35,
              color: theme.colorScheme.onSurface,
            ).padding(right: 8),
          Text(
            title,
            style: theme.textTheme.headlineMedium,
          ),
        ],
      ),

      // actions
      actions: actions ??
          [
            Container(
              height: 35,
              width: 35,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: theme.colorScheme.outline.withOpacity(0.05),
                borderRadius: BorderRadius.circular(35),
              ),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(35),
                  child: Center(
                    child: Stack(
                      children: [
                        Image.asset(
                          "assets/icons/ic_notification.png",
                          height: 24,
                          width: 24,
                        ),
                        Positioned(
                          top: 2,
                          right: 3,
                          child: Container(
                            height: 6,
                            width: 6,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.tertiary,
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
