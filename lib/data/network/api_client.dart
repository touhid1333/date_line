import 'package:date_line/data/models/workSchedules/work_schedule_response.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("bc69ae1f6991da81ab9a")
  Future<WorkScheduleResponse> getWorkSchedules();
}
