import 'package:covid19_statistic_app/src/controllers/total_controller.dart';
import 'package:covid19_statistic_app/src/utils/data_utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';

class _BarChart extends GetView<TotalController> {
  final bool type;
  const _BarChart({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: type
            ? controller.weeksDecideCnt.average.toDouble() + 20000
            : controller.weeksDeathCnt.average.toDouble() + 50,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: const EdgeInsets.all(0),
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              DataUtils.formatCountNumber(rod.y.round()),
              const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          margin: 20,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return DataUtils.formatChartDateTime(
                    controller.weeksData[6].stateDate);
              case 1:
                return DataUtils.formatChartDateTime(
                    controller.weeksData[5].stateDate);
              case 2:
                return DataUtils.formatChartDateTime(
                    controller.weeksData[4].stateDate);
              case 3:
                return DataUtils.formatChartDateTime(
                    controller.weeksData[3].stateDate);
              case 4:
                return DataUtils.formatChartDateTime(
                    controller.weeksData[2].stateDate);
              case 5:
                return DataUtils.formatChartDateTime(
                    controller.weeksData[1].stateDate);
              case 6:
                return DataUtils.formatChartDateTime(
                    controller.weeksData[0].stateDate);
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        rightTitles: SideTitles(showTitles: false),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
                y: type
                    ? controller.weeksDecideCnt.last.toDouble()
                    : controller.weeksDeathCnt.last.toDouble(),
                colors: [Colors.lightBlueAccent, Colors.greenAccent])
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
                y: type
                    ? controller.weeksDecideCnt[5].toDouble()
                    : controller.weeksDeathCnt[5].toDouble(),
                colors: [Colors.lightBlueAccent, Colors.greenAccent])
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
                y: type
                    ? controller.weeksDecideCnt[4].toDouble()
                    : controller.weeksDeathCnt[4].toDouble(),
                colors: [Colors.lightBlueAccent, Colors.greenAccent])
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
                y: type
                    ? controller.weeksDecideCnt[3].toDouble()
                    : controller.weeksDeathCnt[3].toDouble(),
                colors: [Colors.lightBlueAccent, Colors.greenAccent])
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
                y: type
                    ? controller.weeksDecideCnt[2].toDouble()
                    : controller.weeksDeathCnt[2].toDouble(),
                colors: [Colors.lightBlueAccent, Colors.greenAccent])
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
                y: type
                    ? controller.weeksDecideCnt[1].toDouble()
                    : controller.weeksDeathCnt[1].toDouble(),
                colors: [Colors.lightBlueAccent, Colors.greenAccent])
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 6,
          barRods: [
            BarChartRodData(
                y: type
                    ? controller.weeksDecideCnt[0].toDouble()
                    : controller.weeksDeathCnt[0].toDouble(),
                colors: [Colors.lightBlueAccent, Colors.greenAccent])
          ],
          showingTooltipIndicators: [0],
        ),
      ];
}

class Covid19Chart extends GetView<TotalController> {
  final bool type; // true 확진자 false 사망자
  const Covid19Chart({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: RichText(
                text: TextSpan(
                  text: "7일 평균  ",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  children: [
                    TextSpan(
                      text: type == true
                          ? DataUtils.formatCountNumber(
                              controller.weeksDecideCnt.average.toInt())
                          : DataUtils.formatCountNumber(
                              controller.weeksDeathCnt.average.toInt()),
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent),
                    )
                  ],
                ),
              ),
            ),
            Expanded(child: _BarChart(type: type)),
          ],
        ),
      ),
    );
  }
}
