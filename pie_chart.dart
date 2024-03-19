import 'package:flutter/material.dart';
import 'package:easy_pie_chart/easy_pie_chart.dart';

class PieChart extends StatefulWidget {
  PieChart({super.key, required this.data});

  final List<PieData> data;
  // PieData(value: 10, color: Colors.red),
  // PieData(value: 20, color: Colors.blue),
  // PieData(value: 15, color: Colors.yellow),
  // PieData(value: 25, color: Colors.indigo),
  //PieData(value: 20, color: Colors.yellow)

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  @override
  Widget build(BuildContext context) {
    return EasyPieChart(
        gap: 0.02, //* widget.data.length
        child: Text("HI"),
        shouldAnimate: false,
        children: widget.data);
  }
}
