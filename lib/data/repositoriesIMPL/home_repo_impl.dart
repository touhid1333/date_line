import 'package:date_line/data/models/dynamicMenu/dynamic_menu_model.dart';
import 'package:date_line/data/models/user/user_model.dart';
import 'package:date_line/data/network/demoJsons/dynamic_menu_demo_data.dart';
import 'package:date_line/data/network/demoJsons/user_demo_data.dart';
import 'package:date_line/domain/repositories/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<UserModel> fetchUserInformation() async {
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );
    return UserModel.fromJson(userDemoDataJson);
  }

  @override
  Future<List<DynamicMenuModel>> fetchDynamicMenu() async {
    return dynamicMenuDemoData
        .map(
          (e) => DynamicMenuModel.fromJson(e),
        )
        .toList();
  }
}
