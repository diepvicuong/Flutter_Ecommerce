import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:nordic_ecommerce/bindings/home_binding.dart';
import 'package:nordic_ecommerce/bottom_bar.dart';
import 'package:nordic_ecommerce/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomBar(),
      // initialBinding: HomeBinding(),
      initialRoute: Routes.INITIAL,
      getPages: AppPages.pages,
    );
  }
}
