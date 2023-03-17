import 'dart:developer';

import 'package:flutter/material.dart';

import '../api_client/api_requests.dart';
import '../helper/const.dart';
import '../helper/text_styles.dart';
import '../model/profile_response.dart';
import 'edit_profile_screen.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  late ProfileResponse user;

  var isLoading = true;
  int ages = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await calorieRecommenderApi();
      await getProfile();
    });
  }

  getProfile() async {
    isLoading = true;
    setState(() {});
    user = await getUser();
    isLoading = false;
    setState(() {});

    print("Users: ${user.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(
      //     "Profile",
      //     style: subTitleTextStyle.copyWith(color: kPrimaryColor),
      //   ),
      //   backgroundColor: Colors.black12,
      // ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                   Text(
                    "Profile" ,
                    style: subTitleTextStyle.copyWith(color: Colors.red),
                  ),
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(
                            image: AssetImage(
                                'assets/947a9f1acf2478edc6e97b9a17ef75aa.jpg'))),
                  ), // SizedBox
                  const SizedBox(height: 10),
                  Text(user.data?.username ?? "N/A", style: normalTextStyle),
                  Text(user.data?.email ?? "N/A", style: normalTextStyle),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditProfileScreen(),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kRedColor,
                          side: BorderSide.none,
                          shape: const StadiumBorder()),
                      child: const Text("Edit Profile", style: normalTextStyle),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Divider(),
                  const SizedBox(height: 10),

                  ProfileWidget(
                      titles: "Id",
                      icon: Icons.account_circle_rounded,
                      trailing: user.data?.sId ?? "N/A"),
                   ProfileWidget(
                      titles: "Name",
                      icon: Icons.account_circle_rounded,
                      trailing: user.data?.firstname ?? "N/A"),
                   ProfileWidget(
                      titles: "Age",
                      icon: Icons.account_circle_rounded,
                      trailing: user.data?.age.toString() ?? "N/A" ),
                   ProfileWidget(
                      titles: "Height",
                      icon: Icons.account_circle_rounded,
                      trailing: user.data?.height.toString() ?? "N/A" ),
                   ProfileWidget(
                      titles: "Weight",
                      icon: Icons.account_circle_rounded,
                      trailing: user.data?.weight.toString() ?? "N/A" ),
                  ProfileWidget(
                      titles: "Calorie Goal",
                      icon: Icons.account_circle_rounded,
                      trailing: user.data?.calorieGoal.toString() ?? "N/A" ),
                  ProfileWidget(
                      titles: "Step Goal",
                      icon: Icons.account_circle_rounded,
                      trailing: user.data?.stepsGoal.toString() ?? "N/A" ),
                  //   const Divider(color: Colors.grey),
                  //   const SizedBox(height: 10),
                  // const ProfileWidget(
                  //   titles: "CalorieConsumed",
                  //   icon: Icons.account_circle_rounded,
                  //   trailing: "Neerav Shrestha")
                ]),
              ),
            ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key? key,
    required this.titles,
    required this.icon,
    required this.trailing,
  }) : super(key: key);
  final String titles;
  final IconData icon;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: kPrimaryColor.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: kPrimaryColor,
        ),
      ),
      title: Text(titles, style: normalTextStyle),
      trailing: Text(trailing, style: normalTextStyle),
    );
  }
}
