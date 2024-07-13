import 'package:date_line/presentation/providers/common_provider.dart';
import 'package:date_line/presentation/views/history/history_view.dart';
import 'package:date_line/presentation/views/home/home_view.dart';
import 'package:date_line/presentation/views/main/widgets/main_bottom_nav.dart';
import 'package:date_line/presentation/views/main/widgets/main_docked_nav.dart';
import 'package:date_line/presentation/views/profile/profile_view.dart';
import 'package:date_line/presentation/views/timeLine/time_line_view.dart';
import 'package:date_line/utils/common/widgets/app_status_bar.dart';
import 'package:date_line/utils/common/widgets/custom_app_bar.dart';
import 'package:date_line/utils/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late PageController pageController;

  final views = [
    const HomeView(),
    const TimeLineView(),
    const HistoryView(),
    const ProfileView(),
  ];

  @override
  void initState() {
    pageController = PageController(
      viewportFraction: 1,
      initialPage: context.read<CommonProvider>().bottomNavIndex,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final commonProvider = Provider.of<CommonProvider>(context);
    return AppStatusBar(
      child: Scaffold(
        // -----------------------------------
        // AppBar
        // -----------------------------------
        appBar: const CustomAppBar(
          title: "Data Line",
          centerTitle: false,
        ),
        drawer: const Drawer(),

        // -----------------------------------
        // Docked View
        // -----------------------------------
        floatingActionButton: const MainDockedNav(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        // -----------------------------------
        // Bottom Nav
        // -----------------------------------
        bottomNavigationBar: MainBottomNav(
          itemCount: views.length,
          onItemTap: (index) {
            commonProvider.updateBottomIndex(index: index);
            pageController.jumpToPage(commonProvider.bottomNavIndex);
          },
        ),

        // -----------------------------------
        // Main Body Pager
        // -----------------------------------
        body: PageView(
          clipBehavior: Clip.none,
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: views
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: e,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
