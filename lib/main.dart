import 'package:covid19_statistic_app/src/controllers/app_controller.dart';
import 'package:covid19_statistic_app/src/controllers/city_controller.dart';
import 'package:covid19_statistic_app/src/controllers/total_controller.dart';
import 'package:covid19_statistic_app/src/pages/app.dart';
import 'package:covid19_statistic_app/src/repository/covid_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid19 통계 앱',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[200],
        primarySwatch: Colors.blue,
      ),
      initialBinding: InitBindings(),
      home: const App(),
    );
  }
}

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
    Get.put(Covid19Repository());
    Get.put(TotalController());
    Get.put(CityController());
  }
}
