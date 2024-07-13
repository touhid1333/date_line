import 'package:date_line/data/models/workSchedules/work_schedule_model.dart';
import 'package:date_line/presentation/providers/time_line_provider.dart';
import 'package:date_line/utils/extensions/build_context_extensions.dart';
import 'package:date_line/utils/extensions/date_time_extensions.dart';
import 'package:date_line/utils/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimeLineSchedules extends StatelessWidget {
  const TimeLineSchedules({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final timeLineProvider = Provider.of<TimeLineProvider>(context);
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: theme.colorScheme.outline.withOpacity(0.1), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "আজকের কার্যক্রম",
              style: theme.textTheme.headlineMedium,
            ).padding(bottom: 20),

            // -----------------------------------
            // List of Schedules
            // -----------------------------------
            timeLineProvider.filteredSchedules.isEmpty
                ? Center(
                    child: Text(
                      "কোন কার্যক্রম নেই !",
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.outline.withOpacity(0.4),
                      ),
                    ).padding(all: 20),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: timeLineProvider.filteredSchedules.length,
                    itemBuilder: (context, index) {
                      // -----------------------------------
                      // Schedule Item
                      // -----------------------------------
                      WorkScheduleModel schedule = timeLineProvider.filteredSchedules[index];
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // -----------------------------------
                          // Time
                          // -----------------------------------
                          SizedBox(
                            width: 70,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  schedule.date != null
                                      ? timeLineProvider.timeOfTheDay(schedule.date!)
                                      : "",
                                  style: theme.textTheme.titleMedium,
                                ),
                                Text(
                                  "${schedule.date?.formatHHmm12} মি.",
                                  style: theme.textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ).padding(right: 12),

                          // -----------------------------------
                          // Information
                          // -----------------------------------
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: index.isEven ? null : theme.colorScheme.onSurface,
                                gradient: index.isEven
                                    ? LinearGradient(
                                        colors: [
                                          theme.colorScheme.primary,
                                          theme.colorScheme.secondary
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        transform: const GradientRotation(-180),
                                      )
                                    : null,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // -----------------------------------
                                  // Time
                                  // -----------------------------------
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time_rounded,
                                        size: 14,
                                        color: theme.colorScheme.onPrimary,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        "${schedule.date?.formatHHmm12} মি.",
                                        style: theme.textTheme.titleSmall
                                            ?.copyWith(color: theme.colorScheme.onPrimary),
                                      ),
                                    ],
                                  ).padding(bottom: 8),

                                  // -----------------------------------
                                  // Description
                                  // -----------------------------------
                                  Text(
                                    schedule.name ?? "",
                                    style: theme.textTheme.titleMedium
                                        ?.copyWith(color: theme.colorScheme.onPrimary),
                                  ).padding(bottom: 8),

                                  // -----------------------------------
                                  // Category
                                  // -----------------------------------
                                  Text(
                                    schedule.category ?? "",
                                    style: theme.textTheme.titleSmall
                                        ?.copyWith(color: theme.colorScheme.onPrimary),
                                  ),

                                  // -----------------------------------
                                  // Location
                                  // -----------------------------------
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 14,
                                        color: theme.colorScheme.onPrimary,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        schedule.location ?? "",
                                        style: theme.textTheme.titleSmall
                                            ?.copyWith(color: theme.colorScheme.onPrimary),
                                      ),
                                    ],
                                  ).padding(bottom: 8),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ).padding(bottom: 16);
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
