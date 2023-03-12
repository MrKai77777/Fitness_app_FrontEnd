import 'package:fitness_app/ui/mainpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api_client/api_requests.dart';
import '../helper/const.dart';
import '../helper/text_styles.dart';
import 'home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homePageStateFormKey = GlobalKey<FormState>();
  bool isLoading = false;
  int steps = 0;
  int kcals = 0;
  double kms = 0;
  int mins = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //padding: const EdgeInsets.all(25.0),
      child: Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Goals",
          style: subTitleTextStyle.copyWith(color: kPrimaryColor),
        ),
        backgroundColor: Colors.black12,
      ),
        body: isLoading
          ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
          child: Form(
            key: _homePageStateFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Goals",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                const Text(
                  "SET THEM...GET THEM",
                  style: TextStyle(
                      color: Colors.white38,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: const BorderRadius.all(Radius.circular(18))),
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            steps = steps - 500;
                            if(steps <= 0){
                              steps = steps + 500;
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.remove_circle,
                          color: Colors.blue,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            steps.toString(),
                            style: const TextStyle(color: Colors.white, fontSize: 26.0),
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.send,
                                color: Colors.grey,
                              ),
                              Text("steps",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              steps = steps + 500;
                            });
                            //print(steps);
                          },
                          icon: const Icon(
                            Icons.add_circle,
                            color: Colors.blue,
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: const BorderRadius.all(Radius.circular(18))),
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            kcals = kcals - 100;
                            if(kcals <= 0){
                              kcals = kcals + 100;
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.remove_circle,
                          color: Colors.blue,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            kcals.toString(),
                            style:const TextStyle(color: Colors.white, fontSize: 26.0),
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.local_fire_department,
                                color: Colors.grey,
                              ),
                              Text("kcals",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              kcals = kcals + 100;
                            });
                            //print(steps);
                          },
                          icon: const Icon(
                            Icons.add_circle,
                            color: Colors.blue,
                          )),
                    ],
                  ),
                ),
               const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: const BorderRadius.all(Radius.circular(18))),
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            kms--;
                            if(kms <= 0){
                              kms++;
                            };
                          });
                        },
                        icon: const Icon(
                          Icons.remove_circle,
                          color: Colors.blue,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            kms.toString(),
                            style:const TextStyle(color: Colors.white, fontSize: 26.0),
                          ),
                          Row(
                            children: const [
                              Icon(
                                CupertinoIcons.arrow_right,
                                color: Colors.grey,
                              ),
                              Text("Kms",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              kms++;
                            });
                            //print(steps);
                          },
                          icon:const Icon(
                            Icons.add_circle,
                            color: Colors.blue,
                          )),
                    ],
                  ),
                ),
               const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius:const BorderRadius.all(Radius.circular(18))),
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            mins = mins - 10;
                            if(mins <= 0){
                              mins = mins + 10;
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.remove_circle,
                          color: Colors.blue,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            mins.toString(),
                            style:const TextStyle(color: Colors.white, fontSize: 26.0),
                          ),
                          Row(
                            children: const [
                             Icon(
                                Icons.timer,
                                color: Colors.grey,
                              ),
                             Text("mins",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              mins = mins + 10;
                            });
                           // print(steps);
                          },
                          icon: const Icon(
                            Icons.add_circle,
                            color: Colors.blue,
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(vertical: 10, horizontal: 50)),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.lightGreenAccent)),
                    onPressed: () async {
                            FocusScope.of(context).unfocus();
                            if (_homePageStateFormKey.currentState!.validate()) {
                              isLoading = true;
                              setState(() {});
                              await addGoal(
                                stepsGoals: steps.toString(),
                                calorieGoals: kcals.toString(),
                              ).then((value) {
                                isLoading = false;
                                setState(() {});
                                var msg = "";
                                if (value.success ?? false) {
                                  msg =
                                      "Goals Added Sucessfully";
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const MainPage(),
                                    ),
                                  );
                                } else {
                                  msg = value.msg ?? "Failed";
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(msg),
                                  ),
                                );
                              });
                            }
                          },
                    child: const Text(
                      'Done',
                      style: TextStyle(color: Colors.blueAccent, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

