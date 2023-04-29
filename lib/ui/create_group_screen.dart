import 'package:fitness_app/api_client/api_requests.dart';
import 'package:fitness_app/ui/sgrp.dart';
import 'package:flutter/material.dart';

import '../helper/const.dart';
import '../helper/text_styles.dart';
import 'home_screen.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({Key? key}) : super(key: key);

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreen();
}

class _CreateGroupScreen extends State<CreateGroupScreen> {
  final _createGroupFormKey = GlobalKey<FormState>();

  bool isLoading = false;

  TextEditingController groupNameController =
      TextEditingController(text: "");
  TextEditingController stepGoalController =
      TextEditingController(text: "");
  TextEditingController calorieGoalController =
      TextEditingController(text: "");

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
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                key: _createGroupFormKey,
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
                      controller: groupNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Weight field is required';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        label: const Text("Group Name"),
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: const Icon(Icons.account_box_rounded),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        prefixIconColor: kPrimaryColor,
                        floatingLabelStyle:
                            const TextStyle(color: kPrimaryColor),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: kPrimaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: calorieGoalController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Weight field is required';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        label: const Text("Calorie Goal"),
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: const Icon(Icons.add_task_rounded),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        prefixIconColor: kPrimaryColor,
                        floatingLabelStyle:
                            const TextStyle(color: kPrimaryColor),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: kPrimaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: stepGoalController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Weight field is required';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        label: const Text("Step Goal"),
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: const Icon(Icons.add_task_rounded),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        prefixIconColor: kPrimaryColor,
                        floatingLabelStyle:
                            const TextStyle(color: kPrimaryColor),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: kPrimaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        style: const ButtonStyle(
                            padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 50)),
                            backgroundColor: MaterialStatePropertyAll(
                                Colors.lightGreenAccent)),
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          if (_createGroupFormKey.currentState!.validate()) {
                            isLoading = true;
                            setState(() {});
                            await createNewGroup(
                              groupName: groupNameController.text.toString(),
                              stepGoal: stepGoalController.text.toString(),
                              calorieGoal:
                                  calorieGoalController.text.toString(),
                            ).then((value) {
                              isLoading = false;
                              setState(() {});
                              var msg = "";
                              if (value.success ?? false) {
                                msg = "New Group Created Sucessfully";
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const grp(),
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
                        child: Text(
                          'Register',
                          style: normalTextStyle.copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

      //             child: const Text(
      //               'Done',
      //               style: TextStyle(color: Colors.blueAccent, fontSize: 18),
      //             ),
      //           ),
      //       ],
      //     ),
      //   ),
    );
  }
}
