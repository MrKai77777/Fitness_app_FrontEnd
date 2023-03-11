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
  int? age;
  String? password;
  String? email;
  int? weight;
  int? height;
  String? gender;
  int? calorieIngested;
  int? stepsWalked;
  int? streaks;
  int? calorieGoal;
  int? stepsGoal;
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
      this.iV});

  @override
  String toString() {
    return 'Data{sId: $sId, firstname: $firstname, lastname: $lastname, username: $username, age: $age, password: $password, email: $email, weight: $weight, height: $height, gender: $gender, calorieIngested: $calorieIngested,stepsWalked: $stepsWalked, streaks: $streaks, calorieGoal : $calorieGoal,stepsGoal : $stepsGoal,iV: $iV}';
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
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['username'] = this.username;
    data['age'] = this.age;
    data['password'] = this.password;
    data['email'] = this.email;
    data['weight'] = this.weight;
    data['height'] = this.height;
    data['gender'] = this.gender;
    data['calorieIngested'] = this.calorieIngested;
    data['stepsWalked'] = this.stepsWalked;
    data['streaks'] = this.streaks;
    data['calorieGoal'] = this.calorieGoal;
    data['stepsGoal'] = this.stepsGoal;
    data['__v'] = this.iV;
    return data;
  }
}
