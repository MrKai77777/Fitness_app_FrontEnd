import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'foodmodel.dart';



class FoodController extends GetxController {
  var isLoading = true.obs;
  var foodList = <Food>[].obs;
  var filteredList = <Food>[].obs;
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchFoods();
  }

  void fetchFoods() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse(
          'https://raw.githubusercontent.com/sauravchaulagain/the-app/main/assets/sauce-1.json'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        foodList.value = List<Food>.from(data.map((food) => Food(
              name: food['name'],
              calories: food['calories'],
            )));
        filteredList.value = foodList.value;
      } else {
        // handle error
      }
    } finally {
      isLoading(false);
    }
  }

  void setSearchQuery(String query) {
    searchQuery.value = query;
    filterFoods();
  }

  void filterFoods() {
    if (searchQuery.value.isEmpty) {
      filteredList.value = foodList.value;
    } else {
      filteredList.value = foodList.value
          .where((food) =>
              food.name.toLowerCase().contains(searchQuery.value.toLowerCase()))
          .toList();
    }
  }
}
