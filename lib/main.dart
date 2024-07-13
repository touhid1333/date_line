import 'package:date_line/presentation/providers/common_provider.dart';
import 'package:date_line/presentation/providers/home_provider.dart';
import 'package:date_line/presentation/providers/time_line_provider.dart';
import 'package:date_line/presentation/views/main/main_view.dart';
import 'package:date_line/utils/services/dependency_service.dart';
import 'package:date_line/utils/theme/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependencySetup();
  await initializeDateFormatting('bn_BN', null);
  runApp(const DateLineApp());
}

class DateLineApp extends StatelessWidget {
  const DateLineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CommonProvider>(
          create: (context) => CommonProvider(),
        ),
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider<TimeLineProvider>(
          create: (context) => TimeLineProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppThemeData.lightThemeData,
        darkTheme: AppThemeData.darkThemeData,
        home: const MainView(),
      ),
    );
  }
}
