
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:health_app/Model/chartModel.dart';

class ChartView extends StatefulWidget {
  @override
  ChartViewState createState() => ChartViewState();
}

class ChartViewState extends State<ChartView> {

  List<charts.Series> seriesList;

  static List<charts.Series<ChartModel, String>> _createRandomData() {
    final desktopSalesData = [
      ChartModel('01 Apr 2020', 50),
      ChartModel('01 May 2020', 90),
      ChartModel('01 Jun 2020', 150),
      ChartModel('01 Jul 2020', 35),
    ];

    final tabletSalesData = [
      ChartModel('01 Apr 2020', 110),
      ChartModel('01 May 2020', 90),
      ChartModel('01 Jun 2020', 100),
      ChartModel('01 Jul 2020', 135),
    ];

    final mobileSalesData = [
      ChartModel('01 Apr 2020', 100),
      ChartModel('01 May 2020', 190),
      ChartModel('01 Jun 2020', 10),
      ChartModel('01 Jul 2020', 77),
    ];

    return [
      charts.Series<ChartModel, String>(
        id: 'ChartModel',
        domainFn: (ChartModel sales, _) => sales.date,
        measureFn: (ChartModel sales, _) => sales.numberOfCases,
        data: desktopSalesData,
        fillColorFn: (ChartModel sales, _) {
          return charts.MaterialPalette.blue.shadeDefault;
        },
      ),
      charts.Series<ChartModel, String>(
        id: 'ChartModel',
        domainFn: (ChartModel sales, _) => sales.date,
        measureFn: (ChartModel sales, _) => sales.numberOfCases,
        data: tabletSalesData,
        fillColorFn: (ChartModel sales, _) {
          return charts.MaterialPalette.blue.shadeDefault;
        },
      ),
      charts.Series<ChartModel, String>(
        id: 'ChartModel',
        domainFn: (ChartModel sales, _) => sales.date,
        measureFn: (ChartModel sales, _) => sales.numberOfCases,
        data: mobileSalesData,
        fillColorFn: (ChartModel sales, _) {
          return charts.MaterialPalette.blue.shadeDefault;
        },
      )
    ];
  }

  @override
  void initState() {
    super.initState();
    seriesList = _createRandomData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: charts.BarChart(
        seriesList,
        animate: true,
        vertical: true,

        barGroupingType: charts.BarGroupingType.grouped,
        defaultRenderer: charts.BarRendererConfig(
          groupingType: charts.BarGroupingType.grouped,
          strokeWidthPx: 1.0,
        ),

        // for y-Axis
        primaryMeasureAxis: charts.NumericAxisSpec(
          showAxisLine: true,
          renderSpec: charts.GridlineRendererSpec(
            //tickLengthPx: 3,
            labelStyle: charts.TextStyleSpec(
              fontSize: 8,
              color: charts.MaterialPalette.gray.shade700,
            ),
            lineStyle: charts.LineStyleSpec(
              color: charts.MaterialPalette.gray.shade400,
            ),
          ),
        ),

        // for x-Axis
        domainAxis: charts.OrdinalAxisSpec(
          //showAxisLine: true,
          renderSpec: charts.GridlineRendererSpec(
            labelStyle: charts.TextStyleSpec(
              fontSize: 8,
              color: charts.MaterialPalette.gray.shade700,
            ),
            lineStyle: charts.LineStyleSpec(
              color: charts.MaterialPalette.gray.shade400,
            ),
          ),
        ),
        // behaviors: [
        //   LinePointHighlighter(
        //     //drawFollowLinesAcrossChart: true,
        //     showHorizontalFollowLine: LinePointHighlighterFollowLineType.all,
        //   ),
        // ],
      ),
    );
  }
}


