import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
//https://note-tmk.hatenablog.com/entry/2022/08/15/234855
class LineChartPage extends StatefulWidget {
  const LineChartPage({Key? key}) : super(key: key);

  @override
  State<LineChartPage> createState() => _LineChartPageState();
}

class _LineChartPageState extends State<LineChartPage> {
  late FlTitlesData _titles;
  final TextStyle _labelStyle =
  const TextStyle(fontSize: 16, fontWeight: FontWeight.w800);
  final TextStyle _titleStyle =
  const TextStyle(fontSize: 24, fontWeight: FontWeight.w800);

  void _initChartTitle() {
    _titles = FlTitlesData(
      topTitles: AxisTitles(
          axisNameWidget: Text(
            "2021 Tokyo Avg Temperature",
            style: _titleStyle,
          ),
          axisNameSize: 48),
      rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          )),
      bottomTitles: AxisTitles(
        sideTitles: _bottomTitles(),
        axisNameWidget: Container(
          alignment: Alignment.centerRight,
          child: Text(
            "month",
            style: _labelStyle,
          ),
        ),
      ),
      leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) => Text(
              value.toInt().toString(),
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          axisNameWidget: Text(
            "temperature",
            style: _labelStyle,
          ),
          axisNameSize: 32),
    );
  }

  SideTitles _bottomTitles() => SideTitles(
      showTitles: true,
      reservedSize: 24,
      interval: 2,
      getTitlesWidget: (month, meta) {
        const style = TextStyle(
          color: Color(0xff72719b),
          fontWeight: FontWeight.bold,
          fontSize: 12,
        );
        String text;
        text = "${month.toInt()}";
        /*if (month.toInt() < 1 || month.toInt() > 12) {
          text = "";
        } else {
          text = "${month.toInt()}";
        }
*/
        return SideTitleWidget(
          axisSide: meta.axisSide,
          space: 10,
          child: Text(
            text,
            style: style,
          ),
        );
      });

  @override
  void initState() {
    super.initState();
    _initChartTitle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Line Chart"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 8, right: 32),
              height: 300,
              width: double.infinity,
              child: LineChart(LineChartData(
                  backgroundColor: Colors.grey[200],
                  titlesData: _titles,
                  minX: 0,
                  maxX: 24,
                  minY: 0,
                  maxY: 30,
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      color: Colors.red[400],
                      barWidth: 4,
                      dotData: FlDotData(show: true),
                      spots: const [
                        FlSpot(1, 5.4),
                        FlSpot(2, 8.5),
                        FlSpot(3, 12.8),
                        FlSpot(4, 15.1),
                        FlSpot(5, 19.6),
                        FlSpot(6, 22.7),
                        //FlSpot(7, 25.9),
                        FlSpot(8, 27.4),
                        FlSpot(9, 22.3),
                        FlSpot(10, 18.2),
                        FlSpot(23, 13.7),
                      //  FlSpot(12, 7.9),
                      ],
                    ),
                  ])),
            ),
          ],
        ),
      ),
    );
  }
}