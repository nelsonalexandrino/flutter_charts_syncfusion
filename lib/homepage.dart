import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<charts.Series<Task, String>> _seriesPieData;
  List<charts.Series<Pollution, String>> _seriesBarChart;
  List<charts.Series<Sales, int>> _seriesChartLine;

  _generateDataBarChart() {
    var data1 = [
      Pollution(1980, 'USA', 30),
      Pollution(1980, 'Asia', 40),
      Pollution(1980, 'Europe', 10),
    ];
    var data2 = [
      Pollution(1985, 'USA', 100),
      Pollution(1980, 'Asia', 150),
      Pollution(1985, 'Europe', 80),
    ];
    var data3 = [
      Pollution(1980, 'USA', 200),
      Pollution(1980, 'Asia', 300),
      Pollution(1980, 'Europe', 180),
    ];

    _seriesBarChart.add(
      charts.Series(
          domainFn: (Pollution pollution, _) => pollution.place,
          measureFn: (Pollution pollution, _) => pollution.quantity,
          id: '2017',
          data: data1,
          fillPatternFn: (Pollution pollution, _) =>
              charts.FillPatternType.solid,
          fillColorFn: (Pollution pollution, _) =>
              charts.ColorUtil.fromDartColor(
                Color(0xFFBE0028),
              ),
          colorFn: (Pollution pollution, _) =>
              charts.ColorUtil.fromDartColor(Color(0xFFBE0028)),
          areaColorFn: (Pollution pollution, _) =>
              charts.ColorUtil.fromDartColor(Color(0xFFBE0028)),
          displayName: 'Text0 kmknkn'),
    );

    _seriesBarChart.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2018',
        data: data2,
        fillPatternFn: (Pollution pollution, _) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) => charts.ColorUtil.fromDartColor(
          Color(0xFF109618),
        ),
      ),
    );

    _seriesBarChart.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2019',
        data: data3,
        fillPatternFn: (Pollution pollution, _) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) => charts.ColorUtil.fromDartColor(
          Color(0xFFFF9900),
        ),
      ),
    );
  }

  _generateDataPieData() {
    var pieData = [
      Task("Work", 34.5, Colors.amber),
      Task("Eat", 8.5, Colors.yellow),
      Task("Commit", 10.8, Colors.black),
      Task("Tv", 15.6, Colors.teal),
      Task("Sleep", 19.2, Colors.red),
      Task("Other", 10.3, Colors.grey),
      Task("Running", 6.7, Colors.green),
      Task("Ceclas", 12.9, Colors.pink),
    ];

    _seriesPieData.add(
      charts.Series(
        data: pieData,
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskValue,
        colorFn: (Task task, _) => charts.ColorUtil.fromDartColor(task.color),
        id: 'Daily task',
        labelAccessorFn: (Task task, _) => '${task.taskValue}',
      ),
    );
  }

  _generateChartLine() {
    var data1 = [
      Sales(0, 45),
      Sales(1, 56),
      Sales(2, 55),
      Sales(3, 60),
      Sales(4, 61),
      Sales(5, 70),
    ];
    var data2 = [
      Sales(0, 35),
      Sales(1, 46),
      Sales(2, 45),
      Sales(3, 50),
      Sales(4, 51),
      Sales(5, 60),
    ];
    var data3 = [
      Sales(0, 20),
      Sales(1, 24),
      Sales(2, 25),
      Sales(3, 40),
      Sales(4, 45),
      Sales(5, 60),
    ];

    _seriesChartLine.add(
      charts.Series(
        id: 'Sales 1',
        data: data1,
        colorFn: (Sales sale, _) => charts.ColorUtil.fromDartColor(Colors.red),
        domainFn: (Sales sale, _) => sale.year,
        measureFn: (Sales sale, _) => sale.sales,
      ),
    );
    _seriesChartLine.add(
      charts.Series(
        id: 'Sales 2',
        data: data2,
        colorFn: (Sales sale, _) =>
            charts.ColorUtil.fromDartColor(Colors.yellow),
        domainFn: (Sales sale, _) => sale.year,
        measureFn: (Sales sale, _) => sale.sales,
      ),
    );
    _seriesChartLine.add(
      charts.Series(
        id: 'Sales 3',
        data: data3,
        colorFn: (Sales sale, _) =>
            charts.ColorUtil.fromDartColor(Colors.brown),
        domainFn: (Sales sale, _) => sale.year,
        measureFn: (Sales sale, _) => sale.sales,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesPieData = List<charts.Series<Task, String>>();
    _seriesBarChart = List<charts.Series<Pollution, String>>();
    _seriesChartLine = List<charts.Series<Sales, int>>();
    _generateDataPieData();
    _generateDataBarChart();
    _generateChartLine();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('FLutter charts'),
          bottom: TabBar(
            indicatorColor: Color(0xFF1976D2),
            tabs: <Widget>[
              Tab(
                icon: Icon(FontAwesomeIcons.solidChartBar),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.chartPie),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.chartLine),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Emission, by world region (in million seconds)',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                      child: charts.BarChart(
                        _seriesBarChart,
                        //animate: true,
                        animationDuration: Duration(seconds: 3),
                        barGroupingType: charts.BarGroupingType.grouped,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Time spent in daily task',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                      child: charts.PieChart(
                        _seriesPieData,
                        //animate: true,
                        // animationDuration: Duration(seconds: 3),
                        behaviors: [
                          charts.DatumLegend(
                            outsideJustification:
                                charts.OutsideJustification.endDrawArea,
                            horizontalFirst: false,
                            desiredMaxRows: 2,
                            cellPadding: EdgeInsets.only(right: 4, bottom: 4),
                            entryTextStyle: charts.TextStyleSpec(
                              color: charts.MaterialPalette.purple.shadeDefault,
                              fontSize: 11,
                            ),
                          ),
                        ],
                        defaultRenderer: charts.ArcRendererConfig(
                          arcWidth: 100,
                          arcRendererDecorators: [
                            charts.ArcLabelDecorator(
                              labelPosition: charts.ArcLabelPosition.inside,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Sales for the first 5 yers',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                      child: charts.LineChart(
                        _seriesChartLine,
                        //animate: true,
                        // animationDuration: Duration(seconds: 3),
                        behaviors: [
                          charts.ChartTitle(
                            'Years',
                            behaviorPosition: charts.BehaviorPosition.bottom,
                            titleOutsideJustification:
                                charts.OutsideJustification.middleDrawArea,
                          ),
                          charts.ChartTitle(
                            'Sales',
                            behaviorPosition: charts.BehaviorPosition.start,
                            titleOutsideJustification:
                                charts.OutsideJustification.middleDrawArea,
                          ),
                          charts.ChartTitle(
                            'Departments',
                            behaviorPosition: charts.BehaviorPosition.end,
                            titleOutsideJustification:
                                charts.OutsideJustification.middleDrawArea,
                          ),
                        ],
                        defaultRenderer: charts.LineRendererConfig(
                          includeArea: true,
                          stacked: true,
                        ),
                        animate: true,
                        animationDuration: Duration(seconds: 3),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Task {
  final String task;
  double taskValue;
  final Color color;

  Task(this.task, this.taskValue, this.color);
}

class Pollution {
  final String place;
  final int year;
  final int quantity;

  Pollution(this.year, this.place, this.quantity);
}

class Sales {
  final int year, sales;

  Sales(this.year, this.sales);
}
