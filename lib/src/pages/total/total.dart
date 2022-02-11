import 'package:covid19_statistic_app/src/components/custom_appbar.dart';
import 'package:covid19_statistic_app/src/controllers/total_controller.dart';
import 'package:covid19_statistic_app/src/pages/total/componets/count_panel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TotalScreen extends StatelessWidget {
  const TotalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(
            title: '코로나 발생 현황',
            image: 'assets/svgs/Drcorona.svg',
          ),
          const CountPanel(),
          Wrap(
            children: [
              TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                controller: TotalController.to.controller,
                tabs: TotalController.to.myTabs,
                indicatorColor: Colors.black,
              ),
              SizedBox(
                height: Get.height * 0.4,
                child: TabBarView(
                    controller: TotalController.to.controller,
                    children: TotalController.to.myTabs
                        .map((Tab tab) =>
                            Center(child: Text('This is the ${tab.text}')))
                        .toList()),
              )
            ],
          )
        ],
      ),
    );
  }
}
