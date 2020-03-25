import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as chart;

class SimpleBarChart extends StatelessWidget {
  final List<chart.Series> seriesList;
  final bool animate;

  SimpleBarChart(this.seriesList, {this.animate});

  static List<chart.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 7),
      new OrdinalSales('2016', 3),
      new OrdinalSales('2017', 7),
      new OrdinalSales('2018', 8),
      new OrdinalSales('2019', 5),
    ];

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

  factory SimpleBarChart.withSampleData() {
    return new SimpleBarChart(
      _createSampleData(),
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

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
