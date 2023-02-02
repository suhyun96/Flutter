import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyChart extends StatelessWidget {
  const MyChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Code Sample'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.red,
                )),
            Expanded(
              flex: 1,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(spots: const [
                      FlSpot(0, 98),
                      FlSpot(6, 98),
                      FlSpot(6.2, 98),
                      FlSpot(6.4, 98),
                      FlSpot(6.6, 98),
                      FlSpot(6.8, 98),
                      FlSpot(7.0, 98),

                      /*FlSpot(1, 99),
                      FlSpot(2, 99),
                      FlSpot(3, 98),
                      FlSpot(4, 97),
                      FlSpot(5, 97),
                      FlSpot(5, 96),
                      FlSpot(5, 98),
                      FlSpot(6, 99),
                      FlSpot(7, 97),
                      FlSpot(8, 99),
                      FlSpot(9, 97),
                      FlSpot(10, 99),
                      FlSpot(12.10, 90),
                      FlSpot(12.20, 99),
                      FlSpot(12.30, 98),
                      FlSpot(13, 96),
                      FlSpot(14, 95),
                      FlSpot(15, 97),
                      FlSpot(16, 99),
                      FlSpot(18, 99),
                      FlSpot(19, 97),
                      FlSpot(20, 96),
                      FlSpot(22, 99),
                      FlSpot(24, 98),*/
                    ])
                  ],
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: _bottomTitles,
                    ),
                    leftTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  maxY: 100,
                  minY: 60,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

SideTitles get _bottomTitles => SideTitles(
      showTitles: true,
      interval: 1,
      getTitlesWidget: (value, meta) {
        String text = '';
        switch (value.toInt()) {
          case 0:
            text = '0H';
            break;
          case 1:
            text = '1H';
            break;
          case 2:
            text = '2H';
            break;
          case 3:
            text = '3H';
            break;
          case 4:
            text = '4H';
            break;
          case 5:
            text = '5H';
            break;
          case 6:
            text = '6H';
            break;
          case 7:
            text = '7H';
            break;
          case 8:
            text = '8H';
            break;
          case 9:
            text = '9H';
            break;
          case 10:
            text = '10H';
            break;
          case 11:
            text = '11H';
            break;
          case 12:
            text = '12H';
            break;
          case 13:
            text = '13H';
            break;
          case 14:
            text = '14H';
            break;
          case 15:
            text = '15H';
            break;
          case 16:
            text = '16H';
            break;
          case 17:
            text = '17H';
            break;
          case 18:
            text = '18H';
            break;
          case 19:
            text = '19H';
            break;
          case 20:
            text = '20H';
            break;
          case 21:
            text = '21H';
            break;
          case 22:
            text = '22H';
            break;
          case 23:
            text = '23H';
            break;
          case 24:
            text = '24H';
            break;
        }

        return Text(
          text,
          style: TextStyle(fontSize: 5.0),
        );
      },
    );
/*
class FlChartPage extends StatefulWidget {
  @override
  _FlChartPageState createState() => _FlChartPageState();
}

class _FlChartPageState extends State<FlChartPage> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  showAvg ? avgChart() : mainChart(),
                ),
              ),
            ),
          ),
        ],
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

          textStyle: const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            print('bottomTitles $value');
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
        )),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            print('leftTitles $value');
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
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
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  LineChartData avgChart() {
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
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle: const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
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
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
          ],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                ?.withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                ?.withOpacity(0.1),
          ]),
        ),
      ],
    );
  }
}
*/
