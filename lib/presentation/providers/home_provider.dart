import 'package:date_line/data/models/dynamicMenu/dynamic_menu_model.dart';
import 'package:date_line/data/models/user/user_model.dart';
import 'package:date_line/domain/repositories/home_repo.dart';
import 'package:date_line/utils/services/dependency_service.dart';
import 'package:flutter/foundation.dart';

class HomeProvider with ChangeNotifier {
  HomeRepo get _homeRepo => di.get<HomeRepo>();

  UserModel? user;
  List<DynamicMenuModel> dynamicMenus = [];
  bool isLoading = false;

  updateLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> fetchUserInformation() async {
    user = await _homeRepo.fetchUserInformation();
  }

  Future<void> fetchDynamicMenus() async {
    dynamicMenus = await _homeRepo.fetchDynamicMenu();
  }
}
