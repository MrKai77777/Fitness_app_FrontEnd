import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

import '../api_client/api_requests.dart';
import '../helper/text_styles.dart';
import '../model/profile_response.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  late ProfileResponse user;

  var isLoading = true;
  String _status = '?', _steps = '?';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getProfile();
      await recordDataApi();
      await calorieResetApi();
    });
    initPlatformState();
  }

  getProfile() async {
    isLoading = true;
    setState(() {});
    user = await getUser();
    isLoading = false;
    setState(() {});

    print("Users: ${user.toString()}");
  }

  void onStepCount(StepCount event) {
    print('onStepCount ${event}');
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print('onPedestrianStatusChanged $event');
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = '0';
    });
  }

  void initPlatformState() async {
    if (await Permission.activityRecognition.request().isGranted) {
      _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
      _pedestrianStatusStream
          .listen(onPedestrianStatusChanged)
          .onError(onPedestrianStatusError);

      _stepCountStream = Pedometer.stepCountStream;
      _stepCountStream.listen(onStepCount).onError(onStepCountError);
    } else {}

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const values = 0.8;
    return isLoading == true
        ? Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Stack(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                      "current streak",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${user.data?.streaks.toString()}",
                                      style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 33,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text("Your All time high was 89.",
                                        style: TextStyle(
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          height: 140,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Row(
                                              children: const [
                                                Text(
                                                  "7,622",
                                                  style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 26,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "steps per day",
                                                  style: TextStyle(
                                                    color: Colors.white12,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Icon(
                                      Icons.directions_walk_outlined,
                                      size: 70,
                                      color: Colors.green,
                                    ),
                                  ],
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
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          height: 150,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: const [
                                            Text(
                                              "2622",
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 26,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(
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
                                    const Icon(
                                      Icons.fastfood,
                                      size: 50,
                                      color: Colors.orange,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  top: size.height * 0.065,
                  child: Container(
                    color: Colors.transparent,
                    child: Center(
                      child: Text(
                        "Steps Count \n"
                        "${_steps}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    height: size.height * 0.2,
                    width: size.width * 0.9,
                  ),
                ),
              ],
            ),
          );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
