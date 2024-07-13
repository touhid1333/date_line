import 'package:date_line/presentation/providers/time_line_provider.dart';
import 'package:date_line/presentation/views/timeLine/widgets/time_line_calender.dart';
import 'package:date_line/presentation/views/timeLine/widgets/time_line_header.dart';
import 'package:date_line/presentation/views/timeLine/widgets/time_line_schedules.dart';
import 'package:date_line/utils/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class TimeLineView extends StatefulWidget {
  const TimeLineView({super.key});

  @override
  State<TimeLineView> createState() => _TimeLineViewState();
}

class _TimeLineViewState extends State<TimeLineView> {
  final ItemScrollController _scrollController = ItemScrollController();
  late Future future;

  @override
  void initState() {
    var timeLineProvider = context.read<TimeLineProvider>();
    timeLineProvider.addAllAvailableDates();
    future = timeLineProvider.fetchWorkSchedules();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final timeLineProvider = Provider.of<TimeLineProvider>(context);
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: theme.colorScheme.primary,
            ),
          );
        } else {
          // -----------------------------------
          // All Views
          // -----------------------------------
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // -----------------------------------
                // Header
                // -----------------------------------
                const TimeLineHeader(),

                // -----------------------------------
                // Calender / Filter
                // -----------------------------------
                if (timeLineProvider.availableDates.isNotEmpty)
                  TimeLineCalender(
                    scrollController: _scrollController,
                  ),

                // -----------------------------------
                // All works
                // -----------------------------------
                const TimeLineSchedules(),
              ],
            ),
          );
        }
      },
    );
  }
}
