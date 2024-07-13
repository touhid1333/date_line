import 'package:date_line/presentation/providers/time_line_provider.dart';
import 'package:date_line/utils/extensions/build_context_extensions.dart';
import 'package:date_line/utils/extensions/date_time_extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class TimeLineCalender extends StatefulWidget {
  final ItemScrollController scrollController;

  const TimeLineCalender({super.key, required this.scrollController});

  @override
  State<TimeLineCalender> createState() => _TimeLineCalenderState();
}

class _TimeLineCalenderState extends State<TimeLineCalender> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        widget.scrollController.scrollTo(
            index: context.read<TimeLineProvider>().selectedFilterIndex,
            duration: const Duration(seconds: 1), // duration for scrolling time
            alignment: .45, // 0 mean, scroll to the top, 0.5 mean, half
            curve: Curves.easeInOutCubic);
      },
    );
    super.initState();
  }

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
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 62,

          // -----------------------------------
          // List View
          // -----------------------------------
          child: ScrollablePositionedList.builder(
            itemScrollController: widget.scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: timeLineProvider.availableDates.length,
            itemBuilder: (context, index) {
              return Container(
                width: 34,
                height: double.maxFinite,
                margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  border: timeLineProvider.selectedFilterIndex == index
                      ? Border.all(
                          color: theme.colorScheme.primary,
                          width: 1.5,
                        )
                      : null,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: InkWell(
                  onTap: () {
                    // -----------------------------------
                    // on Select Date To Filter
                    // -----------------------------------
                    timeLineProvider.updateFilterValues(
                      index: index,
                      date: timeLineProvider.availableDates[index],
                    );
                    widget.scrollController.scrollTo(
                        index: timeLineProvider.selectedFilterIndex,
                        duration: const Duration(seconds: 1), // duration for scrolling time
                        alignment: .45, // 0 mean, scroll to the top, 0.5 mean, half
                        curve: Curves.easeInOutCubic);
                  },
                  borderRadius: BorderRadius.circular(24),

                  // -----------------------------------
                  // Item Information
                  // -----------------------------------
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        timeLineProvider.availableDates[index].formatE,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.outline,
                        ),
                      ),
                      Text(
                        timeLineProvider.availableDates[index].formatD,
                        style: theme.textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
