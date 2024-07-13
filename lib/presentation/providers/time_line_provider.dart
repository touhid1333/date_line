import 'package:date_line/data/models/workSchedules/work_schedule_model.dart';
import 'package:date_line/domain/repositories/time_line_repo.dart';
import 'package:date_line/utils/extensions/date_time_extensions.dart';
import 'package:date_line/utils/services/dependency_service.dart';
import 'package:flutter/foundation.dart';

class TimeLineProvider with ChangeNotifier {
  List<DateTime> availableDates = [];
  List<WorkScheduleModel> schedules = [];
  List<WorkScheduleModel> filteredSchedules = [];
  int selectedFilterIndex = -1;
  DateTime? selectedFilterDate;

  // repo
  TimeLineRepo get _repo => di.get<TimeLineRepo>();

  // -----------------------------------
  // Functions
  // -----------------------------------
  void addAllAvailableDates() {
    DateTime today = DateTime.now();
    availableDates.clear();
    for (int i = 7; i > 0; i--) {
      availableDates.add(today.add(Duration(days: -i)));
    }
    availableDates.add(today);
    for (int i = 1; i <= 7; i++) {
      availableDates.add(today.add(Duration(days: i)));
    }
    selectedFilterDate = today;
    selectedFilterIndex = availableDates.length > 8 ? 7 : 0;
  }

  String timeOfTheDay(DateTime dateTime) {
    var hour = dateTime.hour;
    if (hour < 5) {
      return 'রাত';
    }
    if (hour < 12) {
      return 'সকাল';
    }
    if (hour < 15) {
      return 'দুপুর';
    }
    if (hour < 18) {
      return 'বিকেল';
    }
    return 'সন্ধ্যা';
  }

  void updateFilterValues({required int index, required DateTime date}) {
    selectedFilterDate = date;
    selectedFilterIndex = index;
    filterSchedules();
  }

  void filterSchedules({bool notify = true}) {
    filteredSchedules.clear();
    if (schedules.isNotEmpty && selectedFilterDate != null) {
      for (WorkScheduleModel scheduleModel in schedules) {
        if (scheduleModel.date != null &&
            scheduleModel.date!.isSameDate(selectedFilterDate!) == true) {
          filteredSchedules.add(scheduleModel);
        }
      }
    }
    if (notify) {
      notifyListeners();
    }
  }

  // -----------------------------------
  // Data From Network
  // -----------------------------------
  Future<void> fetchWorkSchedules() async {
    schedules = await _repo.fetchWorkSchedules();
    filterSchedules(notify: false);
  }
}
