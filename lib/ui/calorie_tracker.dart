
import 'package:fitness_app/model/foodmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api_client/api_requests.dart';
import '../helper/const.dart';
import '../helper/text_styles.dart';
import '../model/calorieCounter_response.dart';
import '../model/profile_response.dart';
import '../model/search.dart';

class Calorie extends StatefulWidget {
  @override
  State<Calorie> createState() => _CalorieState();
}

class _CalorieState extends State<Calorie> {
  bool isLoading = true;
  late CalorieCounter user;
   late ProfileResponse profile;
  
  final _calorieStateFormKey = GlobalKey<FormState>();
  final FoodController foodController = Get.put(FoodController());

  final searchController = TextEditingController();

  List _newList = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await countingCalorie();
      await getProfile();
    });
  }

  countingCalorie() async{
    isLoading = true;
    setState(() {});
    user = await getCalorieData();
    isLoading = false;
    setState(() {});

   // print("Users: ${user.toString()}");
  }

  getProfile() async {
    isLoading = true;
    setState(() {});
    profile = await getUser();
    isLoading = false;
    setState(() {});

   // print("Users: ${profile.toString()}");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
        : Form(
          key : _calorieStateFormKey,
          child: ListView(
              children: [
          const Text(
            "Calories Tracker",
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.w500, color: Colors.red),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: searchController,
            onChanged: (value) => foodController.setSearchQuery(value),
            decoration: InputDecoration(
              hintText: 'Search for food...',
              fillColor: Colors.white,
              filled: true,
              hintStyle: const TextStyle(color: Colors.black),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
            ),
            style: const TextStyle(color: Colors.red),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 200,
            child: Obx(() {
              if (foodController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemCount: foodController.filteredList.length,
                  itemBuilder: (context, index) {
                    var food = foodController.filteredList[index];
                    return ListTile(
                      onTap: ()async {
                          FocusScope.of(context).unfocus();
                            if (_calorieStateFormKey.currentState!.validate()) {
                              isLoading = true;
                              setState(() {});
                              await countCalorieApi(
                                sauceName: foodController.filteredList[index].name.toString(),
                              ).then((value) {
                                isLoading = false;
                                setState(() {});
                                var msg = "";
                                if (value.success ?? false) {
                                  msg =
                                      "Food Added Sucessfully";
                                      user.data!.first.foodIngested!.add(FoodIngested(sId: "0",calories: food.calories,sauceName: food.name));
                                      profile.data!.calorieIngested = (profile.data!.calorieIngested!.toInt() + food.calories) as int?;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Calorie(),
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
                        //     setState(() {
                        //   print(foodController.filteredList[index].name);
                        //   _newList.add(
                        //     foodController.filteredList[index].name,
                        //   );
                        // });
                      },
                      title: Text(
                        food.name.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: Text(
                        food.calories.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  },
                );
              }
            }),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Selected Food",
            style: TextStyle(color: Colors.blue, fontSize: 28),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              height: 200,
              child: Column(
                children: [
                  Expanded(
                      child: ListView.separated(
                        separatorBuilder: (ctx, i) {
                          return const Divider(
                            color: Colors.white24,
                          );
                        },
                        itemBuilder: (ctx, i) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(10),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    "${i + 1}. ",
                                    style: normalTextStyle,
                                  ),
                                ),
                                Text(
                                  "${user.data!.first.foodIngested![i].sauceName}",
                                  style: normalTextStyle,
                                ),
                                const Spacer(),
                                Text(
                                  "${user.data!.first.foodIngested![i].calories} kCal",
                                  style: normalTextStyle.copyWith(
                                    color: kRedColor,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Icon(
                                    Icons.local_fire_department,
                                    color: kRedColor,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: user.data!.first.foodIngested!.length,
                      ),
                      
                    ),
                ],
              ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                        "Total Calories:  ",
                        style: subTitleTextStyle.copyWith(color: kRedColor)
                        ),
                        Text(
                          "${profile.data!.calorieIngested}",
                          style: subTitleTextStyle
                          )
                    ],
                  )
                ],
              )
              
              ],
            ),
           
        )
        );
  }
}
