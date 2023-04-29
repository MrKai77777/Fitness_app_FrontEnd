class CalorieCounter {
  List<Data>? data;

  CalorieCounter({this.data});

  CalorieCounter.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
   @override
  String toString() {
    return 'CalorieCounter {data: ${data.toString()}, ';
  }
}

class Data {
  String? sId;
  String? accountId;
  List<FoodIngested>? foodIngested;
  int? iV;

  Data({
    this.sId, 
    this.accountId, 
    this.foodIngested, 
    this.iV});

  @override
    String toString() {
    return 'Data{sId: $sId, accountId: $accountId, foodIngested: $foodIngested,iV: $iV}';
  }

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    accountId = json['account_id'];
    if (json['foodIngested'] != null) {
      foodIngested = <FoodIngested>[];
      json['foodIngested'].forEach((v) {
        foodIngested!.add(new FoodIngested.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    data['account_id'] = accountId;
    if (foodIngested != null) {
      data['foodIngested'] = foodIngested!.map((v) => v.toJson()).toList();
    }
    data['__v'] = iV;
    return data;
  }
}

class FoodIngested {
  String? sauceName;
  num? calories;
  String? sId;

  FoodIngested({
    this.sauceName, 
    this.calories, 
    this.sId});

    @override
    String toString() {
    return 'Data{sId: $sId, sauceName: $sauceName, calories: $calories}';
  }

  FoodIngested.fromJson(Map<String, dynamic> json) {
    sauceName = json['sauceName'];
    calories = json['calories'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sauceName'] = sauceName;
    data['calories'] = calories;
    data['_id'] = sId;
    return data;
  }
}
