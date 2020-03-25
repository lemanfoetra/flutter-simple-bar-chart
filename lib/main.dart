import 'package:flutter/material.dart';
import 'package:testing/simple_chart.dart';
import './ordinalsales.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<OrdinalSales> data;

  int pointer = 0;

  void setPointer() {
    setState(() {
      pointer = pointer + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (pointer == 1) {
      data = [
        new OrdinalSales('2014', 10),
        new OrdinalSales('2015', 9),
        new OrdinalSales('2016', 8),
        new OrdinalSales('2017', 7),
        new OrdinalSales('2018', 5),
        new OrdinalSales('2019', 6),
      ];
    } else if (pointer == 2) {
      data = [
        new OrdinalSales('2014', 9),
        new OrdinalSales('2015', 10),
        new OrdinalSales('2016', 3),
        new OrdinalSales('2017', 9),
        new OrdinalSales('2018', 2),
        new OrdinalSales('2019', 5),
      ];
    } else if (pointer == 3) {
      data = [
        new OrdinalSales('2014', 2),
        new OrdinalSales('2015', 7),
        new OrdinalSales('2016', 3),
        new OrdinalSales('2017', 7),
        new OrdinalSales('2018', 10),
        new OrdinalSales('2019', 11),
      ];
    } else {
      data = [
        new OrdinalSales('2014', 5),
        new OrdinalSales('2015', 7),
        new OrdinalSales('2016', 3),
        new OrdinalSales('2017', 7),
        new OrdinalSales('2018', 8),
        new OrdinalSales('2019', 5),
      ];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: SimpleBarChart.createData(data),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return setPointer();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
