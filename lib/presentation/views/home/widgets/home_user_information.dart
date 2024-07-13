import 'package:date_line/data/models/user/user_model.dart';
import 'package:date_line/utils/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

class HomeUserInformation extends StatelessWidget {
  final UserModel user;

  const HomeUserInformation({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: theme.colorScheme.outline.withOpacity(0.1), width: 1),
        borderRadius: BorderRadius.circular(9),
      ),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // -----------------------------------
            // User Profile Image
            // -----------------------------------
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(
                  "assets/icons/ic_user.png",
                  height: 60,
                  width: 60,
                ),
              ),
            ),
            const SizedBox(width: 16),

            // -----------------------------------
            // User Name and Other Information
            // -----------------------------------
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name ?? "",
                  style: theme.textTheme.headlineLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  user.company ?? "",
                  style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.outline),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 13,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      user.location ?? "",
                      style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.outline),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
