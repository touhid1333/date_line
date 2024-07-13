import 'dart:async';

import 'package:date_line/data/repositoriesIMPL/home_repo_impl.dart';
import 'package:date_line/domain/repositories/home_repo.dart';
import 'package:get_it/get_it.dart';

// -----------------------------------
// Global Dependency Instance
// -----------------------------------
GetIt di = GetIt.instance;

// -----------------------------------
// All Dependencies
// -----------------------------------
Future<void> dependencySetup() async {
  di.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(),
  );
}
