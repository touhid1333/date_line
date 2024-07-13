import 'package:date_line/data/models/dynamicMenu/dynamic_menu_model.dart';
import 'package:date_line/presentation/providers/home_provider.dart';
import 'package:date_line/utils/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeDynamicMenu extends StatelessWidget {
  const HomeDynamicMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final homeProvider = Provider.of<HomeProvider>(context);
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.9),
      itemCount: homeProvider.dynamicMenus.length,
      itemBuilder: (context, index) {
        // -----------------------------------
        // Menu item
        // -----------------------------------
        DynamicMenuModel menuItem = homeProvider.dynamicMenus[index];
        return InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.outline.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 8),
                child: Image.asset(
                  menuItem.fileUrl ?? "",
                  height: 33,
                ),
              ),
              Text(
                "মেনু নং",
                style: theme.textTheme.headlineSmall,
              ),
              Text(
                menuItem.name ?? "",
                style: theme.textTheme.headlineSmall,
              ),
            ],
          ),
        );
        // ---------------------
      },
    );
  }
}
