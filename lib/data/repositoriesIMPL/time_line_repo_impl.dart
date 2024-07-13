import 'package:date_line/data/models/workSchedules/work_schedule_model.dart';
import 'package:date_line/data/models/workSchedules/work_schedule_response.dart';
import 'package:date_line/data/network/api_client.dart';
import 'package:date_line/domain/repositories/time_line_repo.dart';
import 'package:date_line/utils/services/dependency_service.dart';

class TimeLineRepoImpl extends TimeLineRepo {
  RestClient get _client => di.get<RestClient>();

  @override
  Future<List<WorkScheduleModel>> fetchWorkSchedules() async {
    var response = await _client.getWorkSchedules().onError(
          (error, stackTrace) => Future.value(WorkScheduleResponse()),
        );
    return response.data ?? [];
  }
}
