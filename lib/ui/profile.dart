import 'package:fitness_app/helper/const.dart';
import 'package:fitness_app/ui/edit_profile_screen.dart';
import 'package:fitness_app/ui/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/text_styles.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                leading: IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back_ios)),
                    centerTitle: true,
                title: Text(
                  "Profile",
                  style: subTitleTextStyle.copyWith(color: kPrimaryColor),
                ),
                backgroundColor: Colors.black12,
                ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
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
            const Text("Kai77777", style: normalTextStyle),
            const Text("neeravsth11@gmail.com", style: normalTextStyle),
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

            const ProfileWidget(
                titles: "Id",
                icon: Icons.account_circle_rounded,
                trailing: "#6565465165465165"),
            const ProfileWidget(
                titles: "Name",
                icon: Icons.account_circle_rounded,
                trailing: "Neerav Shrestha"),
            const ProfileWidget(
                titles: "Age",
                icon: Icons.account_circle_rounded,
                trailing: "21"),
            const ProfileWidget(
                titles: "Height",
                icon: Icons.account_circle_rounded,
                trailing: "168"),
            const ProfileWidget(
                titles: "Weight",
                icon: Icons.account_circle_rounded,
                trailing: "67"),
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
