import 'dart:convert';
import 'dart:developer';

import 'package:fitness_app/helper/storage_manager.dart';
import 'package:fitness_app/model/register_response.dart';
import 'package:fitness_app/model/viewRecord_resopnse.dart';
import 'package:http/http.dart' as http;

import '../helper/const.dart';
import '../model/addFriend_response.dart';
import '../model/addGoals_response.dart';
import '../model/createGroup_response.dart';
import '../model/edit_profile_response.dart';
import '../model/joinGroup_response.dart';
import '../model/login_response.dart';
import '../model/profile_response.dart';
import '../model/showFriend_response.dart';
import '../model/user_response.dart';

Future<UserResponse> fetchUsers() async {
  var uri = Uri.parse(baseUrl + getUserData);
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return UserResponse.fromJson(jsonDecode(response.body)[0]);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
bool isLoading = false;
Future<ProfileResponse> getUser() async {
  isLoading = true;
  var uri = Uri.parse(baseUrl + getDataofUser);
  log('URL : $uri');
  var token = await StorageManager.readData(bearerToken);
  log('Token : $token');
  final response = await http.get(
    uri,
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    },
  );

  if (response.statusCode == 200) {
    isLoading = false;
    log(response.body.toString());
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return ProfileResponse.fromJson(jsonDecode(response.body));
  } else {
    isLoading = false;
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}

Future<ViewRecord> viewUserRecord() async {
  var uri = Uri.parse(baseUrl + viewUserRecords);
  log('URL : $uri');
  var token = await StorageManager.readData(bearerToken);
  log('Token : $token');
  final response = await http.get(
    uri,
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    },
  );

  if (response.statusCode == 200) {
    log(response.body.toString());
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return ViewRecord.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}

Future<ShowFriends> getFriends() async {
  var uri = Uri.parse(baseUrl + getFriendData);
  log('URL : $uri');
  var token = await StorageManager.readData(bearerToken);
  log('Token : $token');
  final response = await http.get(
    uri,
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    },
  );

  if (response.statusCode == 200) {
    log(response.body.toString());
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return ShowFriends.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}

Future<LoginResponse> loginUser(
  String email,
  String password,
) async {
  var dataMap = {
    "email": email,
    "password": password,
  };

  var uri = Uri.parse(baseUrl + login);

  final response = await http.post(
    uri,
    body: jsonEncode(dataMap),
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  );

  log("API URI: ${uri.toString()}");

  log("BODY: $dataMap");

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    log("BODY: ${response.body}");

    var data = jsonDecode(response.body);
    if (data["msg"] != null) {
      log("ALERT MESSAGE ${data["msg"]}");
    }
    return LoginResponse.fromJson(data);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to login');
  }
}

Future<RegisterResponse> registerUser({
  required String firstName,
  required String lastName,
  required String userName,
  required String email,
  required String password,
  required String height,
  required String weight,
  required String age,
  required String gender,
}) async {
  var dataMap = {
    "firstname": firstName,
    "lastname": lastName,
    "username": userName,
    "password": password,
    "age": age,
    "email": email,
    "weight": weight,
    "height": height,
    "gender": gender
  };

  var uri = Uri.parse(baseUrl + register);

  final response = await http.post(
    uri,
    body: jsonEncode(dataMap),
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  );

  log("API URI: ${uri.toString()}");

  log("BODY: $dataMap");

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    log("BODY: ${response.body}");

    var data = jsonDecode(response.body);
    if (data["msg"] != null) {
      log("ALERT MESSAGE ${data["msg"]}");
    }
    return RegisterResponse.fromJson(data);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to login');
  }
}


Future<EditProfile> editUserData({
  required String userName,
  required String height,
  required String weight,
}) async {
  var dataMap = {
    "username": userName,
    "weight": weight,
    "height": height,
  };

  var uri = Uri.parse(baseUrl + editProfile);
  
  var token = await StorageManager.readData(bearerToken);
  // log('Token : $token');

  final response = await http.post(
    uri,
    body: jsonEncode(dataMap),
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    },
  );

  print("API URI: ${uri.toString()}");

  print("BODY: $dataMap");

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print("BODY: ${response.body}");

    var data = jsonDecode(response.body);
    if (data["msg"] != null) {
      print("ALERT MESSAGE ${data["msg"]}");
    }
    return EditProfile.fromJson(data);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to login');
  }
}

Future<CreateGroup> createNewGroup({
  required String groupName,
  required String calorieGoal,
  required String stepGoal,
}) async {
  var dataMap = {
    "task_name": groupName,
    "calorie_goals": calorieGoal,
    "steps_goals": stepGoal,
  };

  var uri = Uri.parse(baseUrl + addGroup);
  
  var token = await StorageManager.readData(bearerToken);
  // log('Token : $token');

  final response = await http.post(
    uri,
    body: jsonEncode(dataMap),
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    },
  );

  print("API URI: ${uri.toString()}");

  print("BODY: $dataMap");

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print("BODY: ${response.body}");

    var data = jsonDecode(response.body);
    if (data["msg"] != null) {
      print("ALERT MESSAGE ${data["msg"]}");
    }
    return CreateGroup.fromJson(data);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to login');
  }
}

Future<AddFriendResponse> addFriend({
  required String friendId,
}) async {
  var dataMap = {
    "friend": friendId,
  };

  var uri = Uri.parse(baseUrl + addFriends);
  
  var token = await StorageManager.readData(bearerToken);
  // log('Token : $token');

  final response = await http.post(
    uri,
    body: jsonEncode(dataMap),
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    },
  );

  print("API URI: ${uri.toString()}");

  print("BODY: $dataMap");

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print("BODY: ${response.body}");

    var data = jsonDecode(response.body);
    if (data["msg"] != null) {
      print("ALERT MESSAGE ${data["msg"]}");
    }
    return AddFriendResponse.fromJson(data);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to login');
  }
}

Future<JoinGroupResponse> joinGroups({
  required String groupId,
}) async {
  var dataMap = {
    "group": groupId,
  };

  var uri = Uri.parse(baseUrl + joinGroup);
  
  var token = await StorageManager.readData(bearerToken);
  // log('Token : $token');

  final response = await http.post(
    uri,
    body: jsonEncode(dataMap),
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    },
  );

  print("API URI: ${uri.toString()}");

  print("BODY: $dataMap");

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print("BODY: ${response.body}");

    var data = jsonDecode(response.body);
    if (data["msg"] != null) {
      print("ALERT MESSAGE ${data["msg"]}");
    }
    return JoinGroupResponse.fromJson(data);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to login');
  }
}

Future<AddGoalsResponse> addGoal({
  required String calorieGoals,
  required String stepsGoals,
}) async {
  var dataMap = {
    "calorieGoal" : calorieGoals,
    "stepsGoal" : stepsGoals
  };

  var uri = Uri.parse(baseUrl + addGoals);
  
  var token = await StorageManager.readData(bearerToken);
  // log('Token : $token');

  final response = await http.post(
    uri,
    body: jsonEncode(dataMap),
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    },
  );

  print("API URI: ${uri.toString()}");

  print("BODY: $dataMap");

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print("BODY: ${response.body}");

    var data = jsonDecode(response.body);
    if (data["msg"] != null) {
      print("ALERT MESSAGE ${data["msg"]}");
    }
    return AddGoalsResponse.fromJson(data);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to login');
  }
}