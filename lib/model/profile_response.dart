class ProfileResponse {
  Data? data;

  ProfileResponse({this.data});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'ProfileResponse {data: ${data.toString()}, ';
  }
}

class Data {
  String? sId;
  String? firstname;
  String? lastname;
  String? username;
  num? age;
  String? password;
  String? email;
  num? weight;
  num? height;
  String? gender;
  num? calorieIngested;
  num? stepsWalked;
  num? streaks;
  num? calorieGoal;
  num? stepsGoal;
  num? recommendedCalories;
  int? iV;

  Data(
      {this.sId,
      this.firstname,
      this.lastname,
      this.username,
      this.age,
      this.password,
      this.email,
      this.weight,
      this.height,
      this.gender,
      this.calorieIngested,
      this.stepsWalked,
      this.streaks,
      this.calorieGoal,
      this.stepsGoal,
      this.recommendedCalories,
      this.iV});

  @override
  String toString() {
    return 'Data{sId: $sId, firstname: $firstname, lastname: $lastname, username: $username, age: $age, password: $password, email: $email, weight: $weight, height: $height, gender: $gender, calorieIngested: $calorieIngested,stepsWalked: $stepsWalked, streaks: $streaks, calorieGoal : $calorieGoal,stepsGoal : $stepsGoal,"recommendedCalories":$recommendedCalories,iV: $iV}';
  }

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    username = json['username'];
    age = json['age'];
    password = json['password'];
    email = json['email'];
    weight = json['weight'];
    height = json['height'];
    gender = json['gender'];
    calorieIngested = json['calorieIngested'];
    stepsWalked = json['stepsWalked'];
    streaks = json['streaks'];
    calorieGoal = json['calorieGoal'];
    stepsGoal = json['stepsGoal'];
    recommendedCalories = json['recommendedCalories'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['username'] = username;
    data['age'] = age;
    data['password'] = password;
    data['email'] = email;
    data['weight'] = weight;
    data['height'] = height;
    data['gender'] = gender;
    data['calorieIngested'] = calorieIngested;
    data['stepsWalked'] = stepsWalked;
    data['streaks'] = streaks;
    data['calorieGoal'] = calorieGoal;
    data['stepsGoal'] = stepsGoal;
    data['recommendedCalories'] = recommendedCalories;
    data['__v'] = iV;
    return data;
  }
}
