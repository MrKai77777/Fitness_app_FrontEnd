import 'package:fitness_app/helper/const.dart';
import 'package:fitness_app/helper/storage_manager.dart';
import 'package:fitness_app/ui/goals.dart';
import 'package:fitness_app/ui/home_screen.dart';
import 'package:fitness_app/ui/insights_screen.dart';
import 'package:fitness_app/ui/profile.dart';
import 'package:fitness_app/ui/sgrp.dart';
import 'package:fitness_app/ui/step_tracker_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api_client/api_requests.dart';
import '../notification.dart';
import 'calorie_tracker.dart';
import 'leaderboard_screen.dart';
import 'login_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _addFriendFormKey = GlobalKey<FormState>();
  NotificationServices notificationServices = NotificationServices();
  @override
  void initState() {
    super.initState();
    notificationServices.initializeNotification();
  }

  TextEditingController friendIdController = TextEditingController(text: "");
  bool isLoading = false;
  int selectedIndex = 0;
  bool switchvalue = false;
  final bottomNavScreens =  [
    const HomeScreen(),
    Calorie(),
    const LeaderboardScreen(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.grey.shade900,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                const Text(
                  '  Settings',
                  style: TextStyle(fontSize: 26, color: Colors.white),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.directions_walk,
                    color: Colors.blue,
                  ),
                  title: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StepTrackerScreen(),
                          ));
                    },
                    child: const Text(
                      'Step Tracker',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                // ListTile(
                //   leading: const Icon(
                //     Icons.person_outline,
                //     color: Colors.blue,
                //   ),
                //   title: InkWell(
                //     onTap: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => const Profile(),
                //           ));
                //     },
                //     child: const Text(
                //       'Profile',
                //       style: TextStyle(fontSize: 16, color: Colors.white),
                //     ),
                //   ),
                // ),
                // ListTile(
                //   leading: const Icon(
                //     Icons.notification_add_outlined,
                //     color: Colors.blue,
                //   ),
                //   title: InkWell(
                //     onTap: () {},
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         const Text(
                //           'Notification',
                //           style: TextStyle(fontSize: 16, color: Colors.white),
                //         ),
                //         CupertinoSwitch(
                //           activeColor: CupertinoColors.activeBlue,
                //           trackColor: CupertinoColors.inactiveGray,
                //           thumbColor: CupertinoColors.white,
                //           value: switchvalue,
                //           onChanged: (value) {
                //             setState(() {
                //               switchvalue = value;
                //               //print(value);
                //               if (switchvalue == true) {
                //                 print(value);
                //                 notificationServices.scheduleNotifiation(
                //                     'Fitness App',
                //                     'Hydration is important.Drink Water');
                //               }
                //             });
                //           },
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                ListTile(
                    leading: const Icon(
                      Icons.file_download_done_rounded,
                      color: Colors.blue,
                    ),
                    title: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ));
                      },
                      child: const Text("Goals",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    )),
                ListTile(
                    leading: const Icon(
                      Icons.person_add,
                      color: Colors.blue,
                    ),
                    title: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                child: Form(
                                  key: _addFriendFormKey,
                                  child: AlertDialog(
                                    title: TextFormField(
                                      controller: friendIdController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'ID is required';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          fillColor: Colors.white24,
                                          hintText: "#Enter_Friend's_User_Id",
                                          filled: true,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18))),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: isLoading
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator())
                                            : const Text('Done'),
                                        onPressed: () async {
                                          FocusScope.of(context).unfocus();
                                          if (_addFriendFormKey.currentState!
                                              .validate()) {
                                            isLoading = true;
                                            setState(() {});
                                            await addFriend(
                                              friendId: friendIdController.text
                                                  .toString(),
                                            ).then((value) {
                                              isLoading = false;
                                              setState(() {});
                                              var msg = "";
                                              if (value.success ?? false) {
                                                msg = "Friend Added Sucessfully";
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HomeScreen(),
                                                  ),
                                                );
                                              } else {
                                                msg = value.msg ?? "Failed";
                                              }
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(msg),
                                                ),
                                              );
                                            });
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: const Text("Add Friend",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    )),
                ListTile(
                  leading: const Icon(
                    Icons.group,
                    color: Colors.blue,
                  ),
                  title: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const grp(),
                          ));
                    },
                    child: const Text(
                      'Groups',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.blue,
                  ),
                  title: InkWell(
                    onTap: () {
                      StorageManager.deleteData(bearerToken);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ));
                    },
                    child: const Text(
                      'Log Out',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.blue,
            size: 30,
          ),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            bottom: 18,
            left: 18,
            right: 18,
          ),
          child: bottomNavScreens[selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          currentIndex: selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.white30,
          backgroundColor: Colors.black,
          selectedFontSize: 16,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.restaurant_menu_sharp ),
              label: "Tracker",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.stacked_bar_chart),
              label: "Friends",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.group),
              label: "Profile",
            )
          ],
        ),
      ),
    );
  }
}
