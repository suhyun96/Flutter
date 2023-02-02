import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

//https://velog.io/@adbr/flutter-line-chart%EA%BA%BD%EC%9D%80%EC%84%A0-%EA%B7%B8%EB%9E%98%ED%94%84-%EA%B5%AC%ED%98%84%ED%95%98%EA%B8%B02-flutter-flchart-example
class FlChartPage3 extends StatefulWidget {
  @override
  _FlChartPageState createState() => _FlChartPageState();
}

class _FlChartPageState extends State<FlChartPage3> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: Text(
                showAvg ? '평균값 O' : '평균값 X',
                style: TextStyle(
                    color:
                        showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
              ),
              onPressed: () {
                print('click');
                setState(() {
                  showAvg = !showAvg;
                });
              },
            ),
            AspectRatio(
              aspectRatio: 3 / 2,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Color(0xff232d37)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: LineChart(
                   mainChart(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  LineChartData mainChart() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            getTitlesWidget: (value, meta) {
              String test = '';
              switch (value.toInt()) {
                case 2:
                  test = 'MAR';
                  break;
                case 5:
                  test = 'JUN';
                  break;
                case 8:
                  test = 'SEP';
                  break;
              }
              return Text(
                test,
                style: TextStyle(
                    color: Color(0xff68737d),
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              );
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,

            getTitlesWidget: (value, meta) {
              String test = '';
              print('leftTitles $value');
              switch (value.toInt()) {
                case 1:
                  test = '10k';
                  break;
                case 3:
                  test = '30k';
                  break;
                case 5:
                  test = '50k';
                  break;
              }
              return Text(
                test,
                style: TextStyle(
                  color: Color(0xff67727d),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              );
            },
            reservedSize: 28,
            //margin: 12,
          ),
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(4, 3),
            FlSpot(5, 6),
            FlSpot(5.4, 9),

          ],
          isCurved: true,
          gradient: LinearGradient(colors: gradientColors),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: false,
            gradient: LinearGradient(
              colors: gradientColors,
            ),
            // colors:
            //     gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  /*LineChartData avgChart() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
            sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,

          getTitlesWidget: (value, meta) {
            String text = '';
            switch (value.toInt()) {
              case 2:
                text = 'MAR';
                break;
              case 5:
                text = 'JUN';
                break;
              case 8:
                text = 'SEP';
                break;
            }
            return Text(
              text,
              style: TextStyle(
                  color: Color(0xff68737d),
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            );
          },
          //margin: 8,
        )),
        leftTitles: AxisTitles(
            sideTitles: SideTitles(
          showTitles: true,

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
            return Text(
              text,
              style: TextStyle(
                color: Color(0xff67727d),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            );
          },
          reservedSize: 28,
          //margin: 12,
        )),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          gradient: LinearGradient(colors: gradientColors),
*//*          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
          ],*//*
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(colors: gradientColors),
          ),
        ),
      ],
    );
  }*/
}
