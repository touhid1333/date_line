import 'package:date_line/utils/extensions/build_context_extensions.dart';
import 'package:date_line/utils/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

class RemainingTime extends StatelessWidget {
  final String firstValue;
  final String secondValue;
  final String title;

  const RemainingTime(
      {super.key, required this.firstValue, required this.secondValue, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // -----------------------------------
            // first value
            // -----------------------------------
            Container(
              height: 24,
              width: 24,
              margin: const EdgeInsets.only(right: 4),
              decoration: BoxDecoration(
                border: Border.all(color: theme.colorScheme.tertiary),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text(
                  firstValue,
                  style: theme.textTheme.titleSmall,
                ),
              ),
            ),
            // -----------------------------------
            // second value
            // -----------------------------------
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                border: Border.all(color: theme.colorScheme.tertiary),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text(
                  secondValue,
                  style: theme.textTheme.titleSmall,
                ),
              ),
            ),
          ],
        ),

        // -----------------------------------
        // title
        // -----------------------------------
        Text(
          title,
          style: theme.textTheme.titleSmall,
        ).padding(top: 4),
      ],
    );
  }
}
