import 'package:covid19_statistic_app/src/controllers/app_controller.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          DrawerHeader(child: Image.asset("assets/images/logo.png")),
          ListTile(
            onTap: () {
              AppController.to.changeIndex(0);
            },
            title: const Text("코로나 발생 현황"),
          ),
          ListTile(
            onTap: () {
              AppController.to.changeIndex(1);
            },
            title: const Text("시·도별 발생 현황"),
          ),
        ],
      ),
    );
  }
}
