import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:date_line/presentation/providers/common_provider.dart';
import 'package:date_line/utils/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainBottomNav extends StatefulWidget {
  final int itemCount;
  final Function(int) onItemTap;

  const MainBottomNav({super.key, required this.itemCount, required this.onItemTap});

  @override
  State<MainBottomNav> createState() => _MainBottomNavState();
}

class _MainBottomNavState extends State<MainBottomNav> {
  final iconPaths = <String>[
    "assets/icons/ic_home.png",
    "assets/icons/ic_calender.png",
    "assets/icons/ic_history.png",
    "assets/icons/ic_person.png",
  ];

  final iconPathsSelected = <String>[
    "assets/icons/ic_home_filled.png",
    "assets/icons/ic_calender_filled.png",
    "assets/icons/ic_history.png",
    "assets/icons/ic_person.png",
  ];

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final commonProvider = Provider.of<CommonProvider>(context);
    return AnimatedBottomNavigationBar.builder(
      itemCount: widget.itemCount,
      tabBuilder: (int index, bool isActive) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                index == commonProvider.bottomNavIndex
                    ? iconPathsSelected[index]
                    : iconPaths[index],
                height: 24,
                width: 24,
                color: Colors.black,
              ),
              if (index == commonProvider.bottomNavIndex)
                Container(
                  height: 4,
                  width: 4,
                  margin: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: LinearGradient(
                        colors: [theme.colorScheme.secondary, theme.colorScheme.primary],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                  ),
                ),
            ],
          ),
        );
      },
      activeIndex: commonProvider.bottomNavIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.defaultEdge,
      leftCornerRadius: 25,
      rightCornerRadius: 25,
      onTap: widget.onItemTap,
      //other params
    );
  }
}
