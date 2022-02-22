import 'package:daily_scrum/core/common/constants/app_pages_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'core/routers/app_pages.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      getPages: AppPages.pages,
      initialRoute: AppPagesConstant.INITIAL_PAGE,
    );
  }
}