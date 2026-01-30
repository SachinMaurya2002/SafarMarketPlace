import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_store/bindings/bindings.dart';
import 'package:safar_store/routes/app_routes.dart';
import 'package:safar_store/utils/constants/colors.dart';
import 'package:safar_store/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: UAppTheme.lightTheme,
      darkTheme: UAppTheme.darkTheme,

      getPages: UAppRoutes.screens,

      initialBinding: UBindings(),
      home: Scaffold(
        backgroundColor: UColors.primary,
        body: Center(child: CircularProgressIndicator(color: UColors.white)),
      ),
    );
  }
}
