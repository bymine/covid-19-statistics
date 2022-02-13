import 'package:covid19_statistic_app/src/controllers/total_controller.dart';
import 'package:covid19_statistic_app/src/utils/data_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CountPanel extends GetView<TotalController> {
  const CountPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1),
              blurRadius: 1,
              spreadRadius: 1),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "발생 현황",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.info,
                        color: Colors.black26,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Obx(
                        () => Text(
                          "기준일 " +
                              DateFormat('yyyy.MM.dd')
                                  .format(controller.stateDate.value),
                          style: const TextStyle(color: Colors.black26),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: controller.stateDate.value,
                      firstDate: DateTime(2021),
                      lastDate: DateTime.now());

                  if (selectedDate != null) {
                    controller.changeDate(selectedDate);
                  }
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.calendar_today,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("날짜 선택")
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      const Text(
                        "일일 확진자",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DataUtils.formatCountNumber(
                            controller.weeksDecideCnt.first),
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                  child: VerticalDivider(
                    color: Colors.black38,
                  ),
                ),
                Flexible(
                  child: Column(
                    children: [
                      const Text(
                        "일일 사망자",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DataUtils.formatCountNumber(
                            controller.weeksDeathCnt.first),
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                  child: VerticalDivider(
                    color: Colors.black54,
                  ),
                ),
                Flexible(
                  child: Column(
                    children: [
                      const Text(
                        "누적 확진자",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DataUtils.formatCountNumber(
                          controller.weeksData.first.decideCnt,
                        ),
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                  child: VerticalDivider(
                    color: Colors.black38,
                  ),
                ),
                Flexible(
                  child: Column(
                    children: [
                      const Text(
                        "누적 사망자",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DataUtils.formatCountNumber(
                            controller.weeksData.first.deathCnt),
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
