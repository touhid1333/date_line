import 'package:date_line/data/models/dynamicMenu/dynamic_menu_model.dart';
import 'package:date_line/data/models/user/user_model.dart';

abstract class HomeRepo {
  Future<UserModel> fetchUserInformation();

  Future<List<DynamicMenuModel>> fetchDynamicMenu();
}
