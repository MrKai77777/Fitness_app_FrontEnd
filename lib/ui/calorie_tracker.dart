
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/search.dart';

class Calorie extends StatefulWidget {
  @override
  State<Calorie> createState() => _CalorieState();
}

class _CalorieState extends State<Calorie> {
  final FoodController foodController = Get.put(FoodController());

  final searchController = TextEditingController();

  List _newList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Text(
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
            hintStyle: TextStyle(color: Colors.black),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
          ),
          style: TextStyle(color: Colors.red),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 350,
          child: Obx(() {
            if (foodController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: foodController.filteredList.length,
                itemBuilder: (context, index) {
                  var food = foodController.filteredList[index];
                  return ListTile(
                    onTap: () {
                      setState(() {
                        _newList.add(
                          foodController.filteredList[index].name,
                        );
                      });
                    },
                    title: Text(
                      food.name.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Text(
                      food.calories.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              );
            }
          }),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          "Selected Food",
          style: TextStyle(color: Colors.blue, fontSize: 28),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
            height: 152,
            child: ListView.builder(
              itemCount: _newList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${_newList[index]}',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                );
              },
            ))
      ],
    ));
  }
}
