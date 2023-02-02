import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FlChartPage2 extends StatelessWidget {
  FlChartPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: LineChart(
                  // chart options data
                  mainData(),
                  swapAnimationCurve: Curves.easeInOutCubic,
                  swapAnimationDuration: Duration(milliseconds: 1000),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // monthly data
  List<FlSpot> _monthlySpots = [
    FlSpot(0, 110.0),

    FlSpot(8, 170.0),
    FlSpot(9, 180.0),
    FlSpot(10, 140.0),
    FlSpot(11, 150.0),
  ];

  LineChartData mainData() {
    return LineChartData(
      borderData: FlBorderData(
        show: false, // to remove border around chart
      ),
      gridData: FlGridData(
          show: false, // to remove grids
          horizontalInterval: 1.6,
          drawVerticalLine: false // or just remove vertical lines
          ),
      titlesData: FlTitlesData(
        show: false, // for hide charts titles

        rightTitles: AxisTitles(
            sideTitles:
                SideTitles(showTitles: false)), // for hide right side titles
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
            sideTitles: SideTitles(
                showTitles: false,
                reservedSize: 22,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  String text = '';
                  switch (value.toInt()) {
                    case 0:
                      text = '0H';
                      break;
                    case 24:
                      text = '24H';
                      break;
                  }
                  return Text(text);
                })),
        leftTitles: AxisTitles(
            sideTitles: SideTitles(
                showTitles: false,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  String text = '';
                  switch (value.toInt()) {
                    case 1:
                      text = '10k';
                      break;
                    case 3:
                      text = '30k';
                      break;
                    case 5:
                      text = '50k';
                      break;
                  }
                  return Text(text);
                })),
      ),
      minX: 0,
      maxX: _monthlySpots.length.toDouble(),
      minY: 0,
      maxY: 200,
      lineTouchData: LineTouchData(
        getTouchedSpotIndicator:
            (LineChartBarData barData, List<int> spotIndexes) {
          return spotIndexes.map((index) {
            return TouchedSpotIndicatorData(
              FlLine(
                color: Colors.white.withOpacity(0.1),
                strokeWidth: 2,
                dashArray: [3, 3],
              ),
              FlDotData(
                show: false,
                getDotPainter: (spot, percent, barData, index) =>
                    FlDotCirclePainter(
                  radius: 8,
                  color: [
                    Colors.black,
                    Colors.black,
                  ][index],
                  strokeWidth: 2,
                  strokeColor: Colors.black,
                ),
              ),
            );
          }).toList();
        },
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          // customize tooltip
          tooltipPadding: const EdgeInsets.all(8),
          tooltipBgColor: Color(0xff2e3747).withOpacity(0.8),
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((touchedSpot) {
              return LineTooltipItem(
                '\$${touchedSpot.y.round()}.00',
                const TextStyle(color: Colors.white, fontSize: 12.0),
              );
            }).toList();
          },
        ),
        handleBuiltInTouches: true,
      ),
      lineBarsData: [
        LineChartBarData(
          // draw line chart
          spots: _monthlySpots,
          isCurved: true,
          color: Colors.red,
          barWidth: 2,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(colors: [Colors.red,Colors.blue]

              ),
            /*  gradientFrom: Offset(0, 0),
              gradientTo: Offset(0, 1),
              colors: [
                Colors.black.withOpacity(0.1),
                Colors.black.withOpacity(0),
              ]*/),
        )
      ],
    );
  }
}
