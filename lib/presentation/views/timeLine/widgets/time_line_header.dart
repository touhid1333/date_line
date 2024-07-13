import 'package:date_line/presentation/views/addTimeLine/add_time_line_view.dart';
import 'package:date_line/utils/common/widgets/custom_button.dart';
import 'package:date_line/utils/extensions/build_context_extensions.dart';
import 'package:date_line/utils/extensions/date_time_extensions.dart';
import 'package:date_line/utils/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

class TimeLineHeader extends StatelessWidget {
  const TimeLineHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "আজ, ${DateTime.now().formatDDMMMM}",
          style: theme.textTheme.headlineMedium,
        ),
        CustomButton(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          borderRadius: 24,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddTimeLineView(),
              ),
            );
          },
          child: Text(
            "নতুন যোগ করুন",
            style: theme.textTheme.titleSmall?.copyWith(
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),
      ],
    ).padding(bottom: 20);
  }
}
