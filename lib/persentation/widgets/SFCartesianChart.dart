import 'package:alogoriza_task/data/models/Degree.dart';
import 'package:alogoriza_task/persentation/Methods/sfCartesianChart_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../screens/weather_screen.dart';

class SFCartesianChart extends StatelessWidget {
  final List weatherInfo;
  const SFCartesianChart({
    Key? key,
    required this.weatherInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //double degreeno = weatherInfo[0]["degree"].toDouble();

    // String city = weatherInfo[0]["city"];

    List<Degree> data = WeatherUsedDataMethod(weatherInfo);
   // print("meeeeeeeeeeeeeeeeeeeee");
   // print(data.length.toString() + "2");

    // print(data);

    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        visibleMinimum: 30,
        //maximum: 0,

        visibleMaximum: 30,
        isVisible: false,
        //majorGridLines: const MajorGridLines(
        //  width: 0,

        //dashArray: <double>[5, 99],
        // ),
      ),

      primaryYAxis: CategoryAxis(
        isVisible: false,
        visibleMinimum: 20,
        labelPlacement: LabelPlacement.values[0],
        maximum: 80,

        // majorGridLines: const MajorGridLines(width: 0),
      ),

      //borderWidth: 95,

      margin: const EdgeInsets.only(left: 0, top: 50, bottom: 3),
      borderColor: Colors.transparent,
      plotAreaBorderColor: Colors.transparent,

      // Sets 15 logical pixels as margin for all the 4 sides.

      //title: ChartTitle(text: 'Half Yearly Sales Analysis'),
      enableSideBySideSeriesPlacement: false,
      enableAxisAnimation: false,


      legend: Legend(
        isVisible: false,
      ),
      tooltipBehavior: TooltipBehavior(enable: false),
      series: <CartesianSeries>[
        LineSeries<Degree, String>(
          isVisibleInLegend: false,
          dataSource: data,

          xValueMapper: (Degree degree, _) => degree.time,
          yValueMapper: (Degree degree, _) => degree.degree,

          name: '',
          color: Colors.white,
          animationDelay: 0,
          animationDuration: 0,



          dataLabelSettings: const DataLabelSettings(

            // margin:
            //  const EdgeInsets.only(top: 20, left: 111111, bottom: 80),

            isVisible: true,
            //  offset: Offset(0, 13),

            alignment: ChartAlignment.far,
            opacity: 20,
            labelPosition: ChartDataLabelPosition.outside,
            labelAlignment: ChartDataLabelAlignment.top,

            textStyle: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),

            // builder: (dynamic data, dynamic point, dynamic series, int pointIndex, int seriesIndex) {
            //   return Container(
            //       height: 30,
            //       width: 30,
            //       child: Image.asset('assets/img/person.jpeg')
            //   );
            // }
          ),

          //dataLabelMapper:(SalesData sales, _)
          //=> sales.month ,

          markerSettings:
              const MarkerSettings(isVisible: true, width: 4, height: 3),
        ),
      ],
    );
  }
}

