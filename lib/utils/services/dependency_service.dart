import 'dart:async';

import 'package:date_line/data/network/api_client.dart';
import 'package:date_line/data/repositoriesIMPL/home_repo_impl.dart';
import 'package:date_line/data/repositoriesIMPL/time_line_repo_impl.dart';
import 'package:date_line/domain/repositories/home_repo.dart';
import 'package:date_line/domain/repositories/time_line_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

// -----------------------------------
// Global Dependency Instance
// -----------------------------------
GetIt di = GetIt.instance;

// -----------------------------------
// All Dependencies
// -----------------------------------
Future<void> dependencySetup() async {
  // Rest Client
  di.registerLazySingleton<RestClient>(
    () => RestClient(Dio(
      BaseOptions(
        contentType: "application/json",
        baseUrl: "https://api.npoint.io/",
      ),
    )),
  );

  // Home Repo
  di.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(),
  );

  // Time Line Repo
  di.registerLazySingleton<TimeLineRepo>(
    () => TimeLineRepoImpl(),
  );
}
