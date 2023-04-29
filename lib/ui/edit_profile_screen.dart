import 'package:fitness_app/api_client/api_requests.dart';
import 'package:fitness_app/helper/text_formfield_style.dart';
import 'package:fitness_app/helper/text_styles.dart';
import 'package:fitness_app/ui/profile.dart';
import 'package:flutter/material.dart';

import '../helper/const.dart';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreen();
}

class _EditProfileScreen extends State<EditProfileScreen> {
  final _editProfileFormKey = GlobalKey<FormState>();

  bool isLoading = false;
  //bool isObscure = true;

  TextEditingController userNameController = TextEditingController(text: "");
  TextEditingController heightController = TextEditingController(text: "");
  TextEditingController weightController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    // inputDecorationTheme : TTextFormFieldTheme.kPrimaryTheme;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Edit Profile",
                style: subTitleTextStyle.copyWith(color: kPrimaryColor),
              ),
              backgroundColor: Colors.black12,
            ),
            body: isLoading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(1.0),
                      child: Column(children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: const Image(
                                  image: AssetImage(
                                      'assets/947a9f1acf2478edc6e97b9a17ef75aa.jpg'))),
                        ),
                        Form(
                          key: _editProfileFormKey,
                            child: Column(
                          children: [
                          
                            TextFormField(
                              controller: userNameController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Username field is required';
                                      }
                                      return null;
                                    },
                              decoration: InputDecoration(
                                label: const Text("Username"),
                                fillColor: Colors.white,
                                filled: true,
                                prefixIcon:
                                    const Icon(Icons.account_box_rounded),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                prefixIconColor: kPrimaryColor,
                                floatingLabelStyle:
                                    const TextStyle(color: kPrimaryColor),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: kPrimaryColor),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: weightController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Weight field is required';
                                      }
                                      return null;
                                    },
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                              decoration: InputDecoration(
                                label: const Text("Weight(in kg)"),
                                fillColor: Colors.white,
                                filled: true,
                                prefixIcon:
                                    const Icon(Icons.account_box_rounded),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                prefixIconColor: kPrimaryColor,
                                floatingLabelStyle:
                                    const TextStyle(color: kPrimaryColor),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: kPrimaryColor),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: heightController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Height field is required';
                                      }
                                      return null;
                                    },
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                              decoration: InputDecoration(
                                label: const Text("Height(in cm)"),
                                fillColor: Colors.white,
                                filled: true,
                                prefixIcon:
                                    const Icon(Icons.account_box_rounded),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                prefixIconColor: kPrimaryColor,
                                floatingLabelStyle:
                                    const TextStyle(color: kPrimaryColor),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: kPrimaryColor),
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                            Center(
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                  padding: MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 50,
                                    ),
                                  ),
                                  backgroundColor: MaterialStatePropertyAll(
                                    kPrimaryColor,
                                  ),
                                ),
                                onPressed: () async {
                                //   Navigator.push(
                                //            context,
                                //            MaterialPageRoute(
                                //              builder: (context) =>
                                //                 const Profile(),
                                //            ),
                                //          );
                                // }, 
                                  FocusScope.of(context).unfocus();
                                  if (_editProfileFormKey.currentState!.validate()) {
                                    isLoading = true;
                                    setState(() {});
                                    await editUserData(
                                      userName:
                                          userNameController.text.toString(),
                                      height: heightController.text.toString(),
                                      weight: weightController.text.toString(),
                                    )
                                    .then((value) {
                                      isLoading = false;
                                      setState(() {});
                                      var msg = "";
                                      if (value.success ?? false) {
                                        msg = "Data Edited Sucessfully";
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Profile(),
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
                                child: Text(
                                  'Done',
                                  style: normalTextStyle.copyWith(
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ))
                      ]),
                    ),
                  )));
  }
}
