import 'package:date_line/presentation/providers/home_provider.dart';
import 'package:date_line/presentation/views/home/widgets/home_date_line.dart';
import 'package:date_line/presentation/views/home/widgets/home_dynamic_menu.dart';
import 'package:date_line/presentation/views/home/widgets/home_user_information.dart';
import 'package:date_line/utils/extensions/build_context_extensions.dart';
import 'package:date_line/utils/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<HomeProvider>().isLoading = true;
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        var homeProvider = context.read<HomeProvider>();
        await homeProvider.fetchUserInformation();
        await homeProvider.fetchDynamicMenus();
        homeProvider.updateLoading();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final homeProvider = Provider.of<HomeProvider>(context);
    return homeProvider.isLoading
        ? Center(
            child: CircularProgressIndicator(
              color: theme.colorScheme.primary,
            ),
          )
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (homeProvider.user != null) ...[
                  // -----------------------------------
                  // User Information
                  // -----------------------------------
                  HomeUserInformation(user: homeProvider.user!).padding(bottom: 20),
                  // -----------------------------------
                  // Time Calculations
                  // -----------------------------------
                  const HomeDateLine(
                    timeProgress: 0.2,
                    timePassed: '৬ মাস ৬ দিন',
                  ).padding(bottom: 20),
                ],

                // -----------------------------------
                // Dynamic Menus
                // -----------------------------------
                if (homeProvider.dynamicMenus.isNotEmpty)
                  const HomeDynamicMenu().padding(bottom: 16),
              ],
            ),
          );
  }
}
