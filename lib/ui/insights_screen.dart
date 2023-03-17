import 'dart:developer';

import 'package:fitness_app/api_client/api_requests.dart';
import 'package:fitness_app/helper/text_styles.dart';
import 'package:fitness_app/model/viewRecord_resopnse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InsightsScreen extends StatefulWidget {
  const InsightsScreen({Key? key}) : super(key: key);

  @override
  State<InsightsScreen> createState() => _InsightsScreen();
}

class _InsightsScreen extends State<InsightsScreen> {
  late ViewRecord insights;
  late String maxStreak;
  late String averageSteps;
  late String averageKCals;

  var isLoading = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await viewRecord();
    });
  }

  viewRecord() async {
    isLoading = true;
    setState(() {});
    insights = await viewUserRecord();
    maxStreak = insights.data!.first.maxStreaks!.toString();
    averageKCals = insights.data!.first.averageCalories!.toString();
    averageSteps = insights.data!.first.averageSteps!.toString();
    isLoading = false;
    setState(() {});

    log("Users: ${insights.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Insights",
                    style: titleTextStyle,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      "Records.  Streaks",
                      style: descTextStyle,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    height: 210,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Streaks.",
                                style: TextStyle(
                                    color: Colors.white12,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "Current streak",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "76",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 33,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("Your All time high was $maxStreak.",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  )
                                  //fontWeight: FontWeight.bold),
                                  ),
                            ],
                          ),
                          const Expanded(
                            child: Icon(
                              CupertinoIcons.map_pin_ellipse,
                              color: Colors.red,
                              size: 70,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    height: 210,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Average",
                            style: TextStyle(
                                color: Colors.white12,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text(
                                averageSteps,
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                "steps per day",
                                style: TextStyle(
                                  color: Colors.white12,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "Currently you are in second place",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text("1st: Aushreeya with 8,976",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              )
                              //fontWeight: FontWeight.bold),
                              ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    height: 120,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Average",
                            style: TextStyle(
                                color: Colors.white12,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text(
                                averageKCals,
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                "kcals per day",
                                style: TextStyle(
                                  color: Colors.white12,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                           Row(
                            children: const [
                              Text(
                                "Recommended calories=",
                                style: TextStyle(
                                  color: Colors.white12,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "2200",
                                style: TextStyle(
                                  color: Colors.pink,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
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
