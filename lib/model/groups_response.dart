class GroupsResponse {
  List<Data>? data;

  GroupsResponse({this.data});

  GroupsResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? taskName;
  int? calorieGoals;
  int? stepsGoals;
  List<IncludeUser>? includeUser;
  int? iV;

  Data({
    this.sId,
    this.taskName,
    this.calorieGoals,
    this.stepsGoals,
    this.includeUser,
    this.iV,
  });

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    taskName = json['task_name'];
    calorieGoals = json['calorie_goals'];
    stepsGoals = json['steps_goals'];
    if (json['include_user'] != null) {
      includeUser = <IncludeUser>[];
      json['include_user'].forEach((v) {
        includeUser!.add(IncludeUser.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['task_name'] = taskName;
    data['calorie_goals'] = calorieGoals;
    data['steps_goals'] = stepsGoals;
    if (includeUser != null) {
      data['include_user'] = includeUser!.map((v) => v.toJson()).toList();
    }
    data['__v'] = iV;
    return data;
  }
}

class IncludeUser {
  List<Account>? account;
  String? random;
  String? sId;

  IncludeUser({this.account, this.random, this.sId});

  IncludeUser.fromJson(Map<String, dynamic> json) {
    if (json['account'] != null) {
      account = <Account>[];
      json['account'].forEach((v) {
        account!.add(Account.fromJson(v));
      });
    }
    random = json['random'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (account != null) {
      data['account'] = account!.map((v) => v.toJson()).toList();
    }
    data['random'] = random;
    data['_id'] = sId;
    return data;
  }
}

class Account {
  String? accountId;
  String? firstname;
  String? username;
  String? dateGoal;
  int? streak;
  String? sId;

  Account({
    this.accountId,
    this.firstname,
    this.username,
    this.dateGoal,
    this.streak,
    this.sId,
  });

  Account.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    firstname = json['firstname'];
    username = json['username'];
    dateGoal = json['date_goal'];
    streak = json['streak'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['account_id'] = accountId;
    data['firstname'] = firstname;
    data['username'] = username;
    data['date_goal'] = dateGoal;
    data['streak'] = streak;
    data['_id'] = sId;
    return data;
  }
}
