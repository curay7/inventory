import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: const Color(0xFF464667),
        ),
      ),
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
