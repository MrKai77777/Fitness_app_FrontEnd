import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import '../api_client/api_requests.dart';
import '../helper/text_styles.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    getAlbum();
    
  }

  getAlbum() async {
    var users = await fetchUsers();
    log("Users: ${users.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    List<_SalesData> data = [
    _SalesData('Sunday', 3500),
    _SalesData('Monday', 2800),
    _SalesData('Tuesday', 3400),
    _SalesData('Wednesday', 3200),
    _SalesData('Thursday', 2000),
    _SalesData('Friday', 1000),
    _SalesData('Saturday', 9000)
  ];
  const values = 0.8;
     return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  height: 250,
                  child: const CircularProgressIndicator(
                    strokeWidth: 10,
                    value: values,
                    backgroundColor: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  child: const CircularProgressIndicator(
                    strokeWidth: 5,
                    value: 0.3,
                    backgroundColor: Colors.grey,
                  ),
                ),
                Container(
                  height: 70,
                  width: 70,
                  child: const CircularProgressIndicator(
                    strokeWidth: 5,
                    value: 0.3,
                    backgroundColor: Colors.grey,
                  ),
                ),
                Container(
                  height: 70,
                  width: 70,
                  child:const CircularProgressIndicator(
                    strokeWidth: 5,
                    value: 0.3,
                    backgroundColor: Colors.grey,
                  ),
                ),
              ],
            ),
            Container(
              height: 230,
              width: double.infinity,
              child: ListView(children: [
                //Initialize the chart widget
                SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    // Chart title
                    title: ChartTitle(text: 'Weekly Steps'),
                    // Enable legend

                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<_SalesData, String>>[
                      LineSeries<_SalesData, String>(
                          dataSource: data,
                          xValueMapper: (_SalesData sales, _) => sales.year,
                          yValueMapper: (_SalesData sales, _) => sales.sales,
                          name: 'Steps',
                          // Enable data label
                          dataLabelSettings:const DataLabelSettings(isVisible: true))
                    ]),
              ]),
            )
          ],
        ),
        Positioned(
          top: 60,
          left: 90,
          child:  Container(
            child: const Center(
              child: const Text(
                textAlign: TextAlign.center,
                "2900 "
                "STEPS",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            height: 150,
            width: 150,
          ),
        ),
        Positioned(
          top: 325,
          left: 45,
          child: Container(
            child: Center(
              child: const Text(
                textAlign: TextAlign.center,
                "2900 "
                "kcals",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            height: 40,
            width: 40,
          ),
        ),
        Positioned(
          top: 325,
          left: 145,
          child: Container(
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                "2"
                "kms",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            height: 40,
            width: 40,
          ),
        ),
        Positioned(
          top: 325,
          left: 242,
          child: Container(
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                "60 "
                "mins",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            height: 40,
            width: 40,
          ),
        ),
      ],
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}