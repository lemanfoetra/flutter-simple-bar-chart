import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as chart;

import './ordinalsales.dart';

class SimpleBarChart extends StatelessWidget {

  final List<chart.Series> seriesList;
  final bool animate;
  final List<OrdinalSales> data;

  SimpleBarChart(this.seriesList,  {this.animate, this.data});



  static List<chart.Series<OrdinalSales, String>> _createSampleData(List<OrdinalSales> data) {

    return [
      chart.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => chart.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  factory SimpleBarChart.createData(List<OrdinalSales> data){
    return SimpleBarChart(
      _createSampleData(data),
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new chart.BarChart(
      seriesList,
      animate: animate,
    );
  }
}