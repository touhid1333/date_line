import 'package:date_line/presentation/views/home/widgets/remaining_time.dart';
import 'package:date_line/utils/extensions/build_context_extensions.dart';
import 'package:date_line/utils/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

class HomeDateLine extends StatelessWidget {
  final double timeProgress;
  final String timePassed;

  const HomeDateLine({super.key, required this.timeProgress, required this.timePassed});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // -----------------------------------
        // Left Side Information
        // -----------------------------------
        SizedBox(
          width: 105,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 105,
                width: 105,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // -----------------------------------
                    // Progress
                    // -----------------------------------
                    Positioned.fill(
                      child: RotatedBox(
                        quarterTurns: 2,
                        child: CircularProgressIndicator(
                          value: timeProgress,
                          strokeWidth: 10,
                          backgroundColor: theme.colorScheme.outline.withOpacity(0.05),
                          valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
                          strokeAlign: CircularProgressIndicator.strokeAlignInside,
                        ),
                      ),
                    ),
                    Text(
                      timePassed,
                      style: theme.textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              Text(
                'সময় অতিবাহিত',
                style: theme.textTheme.headlineMedium,
              ).padding(top: 8),
            ],
          ),
        ),

        const SizedBox(width: 20),

        // -----------------------------------
        // Right Side Information
        // -----------------------------------
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // -----------------------------------
              // Total Duration
              // -----------------------------------
              Text(
                'মেয়াদকাল',
                style: theme.textTheme.headlineMedium,
              ).padding(bottom: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: Colors.grey.shade600,
                  ).padding(right: 6),
                  Expanded(
                    child: Text(
                      '১ই জানুয়ারি ২০২৪ - ৩১শে জানুয়ারি ২০৩০',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ],
              ),

              // -----------------------------------
              // Remaining
              // -----------------------------------
              Text(
                'আরও বাকি',
                style: theme.textTheme.headlineMedium?.copyWith(color: theme.colorScheme.tertiary),
              ).padding(top: 12, bottom: 4),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RemainingTime(
                    firstValue: '০',
                    secondValue: '৫',
                    title: 'বছর',
                  ),
                  RemainingTime(
                    firstValue: '০',
                    secondValue: '৬',
                    title: 'মাস',
                  ),
                  RemainingTime(
                    firstValue: '০',
                    secondValue: '০',
                    title: 'দিন',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
