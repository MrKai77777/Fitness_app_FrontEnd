import 'package:flutter/material.dart';
import '../helper/const.dart';
import '../helper/text_styles.dart';
import 'mainpage.dart';

class CreateGroupScreen extends StatelessWidget {
  const CreateGroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Create Group",
          style: subTitleTextStyle.copyWith(color: kPrimaryColor),
        ),
        backgroundColor: Colors.black12,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "First Step To develop yourself together !!!",
              style: descTextStyle.copyWith(),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                label: const Text("Group Name"),
                fillColor: Colors.white,
                filled: true,
                prefixIcon: const Icon(Icons.account_box_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                prefixIconColor: kPrimaryColor,
                floatingLabelStyle: const TextStyle(color: kPrimaryColor),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: kPrimaryColor),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                label: const Text("Calorie Goal"),
                fillColor: Colors.white,
                filled: true,
                prefixIcon: const Icon(Icons.add_task_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                prefixIconColor: kPrimaryColor,
                floatingLabelStyle: const TextStyle(color: kPrimaryColor),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: kPrimaryColor),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                label: const Text("Step Goal"),
                fillColor: Colors.white,
                filled: true,
                prefixIcon: const Icon(Icons.add_task_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                prefixIconColor: kPrimaryColor,
                floatingLabelStyle: const TextStyle(color: kPrimaryColor),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: kPrimaryColor),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 10, horizontal: 50)),
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.lightGreenAccent)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainPage(),
                      ));
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
    );
  }
}
