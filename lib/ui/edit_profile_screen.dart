import 'package:fitness_app/helper/text_formfield_style.dart';
import 'package:fitness_app/helper/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/const.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreen();
}

class _EditProfileScreen extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // inputDecorationTheme : TTextFormFieldTheme.kPrimaryTheme;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                leading: IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back_ios)),
                    centerTitle: true,
                title: Text(
                  "Edit Profile",
                  style: subTitleTextStyle.copyWith(color: kPrimaryColor),
                ),
                backgroundColor: Colors.black12,
                ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(1.0),
                child: Column(children: [
                  Form(
                      child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          label: const Text("Name"),
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
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          label: const Text("Weight"),
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
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          label: const Text("Height"),
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
                      const SizedBox(height: 10)
                    ],
                  ))
                ]),
              ),
            )));
  }
}
