import 'package:date_line/data/models/workSchedules/work_schedule_model.dart';

abstract class TimeLineRepo {
  Future<List<WorkScheduleModel>> fetchWorkSchedules();
}
