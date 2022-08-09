import 'package:daily_scrum/core/common/theme/app_theme.dart';
import 'package:daily_scrum/core/inject/inject.dart';
import 'package:daily_scrum/core/routers/app_pages.dart';
import 'package:daily_scrum/presentation/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  Inject.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      initialRoute: LoginPage.routeName,
      getPages: AppPages.routes,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
