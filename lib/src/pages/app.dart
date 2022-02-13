import 'package:covid19_statistic_app/src/components/custom_drawer.dart';
import 'package:covid19_statistic_app/src/controllers/app_controller.dart';
import 'package:covid19_statistic_app/src/pages/city/city.dart';
import 'package:covid19_statistic_app/src/pages/total/total.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomDrawer(),
        body: Obx(() {
          switch (AppController.to.currentIndex.value) {
            case 0:
              return const TotalScreen();
            case 1:
              return const CityScreen();
            default:
              return Container();
          }
        }));
  }
}
