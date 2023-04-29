class ViewRecord {
  List<Data>? data;

  ViewRecord({this.data});

  ViewRecord.fromJson(Map<String, dynamic> json) {
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
    return 'ViewRecord {data: ${data.toString()}, ';
  }
}

class Data {
  String? sId;
  String? accountId;
  String? firstname;
  List<Progress>? progress;
  num? maxStreaks;
  int? iV;
  num? averageCalories;
  num? averageSteps;

  Data(
      {this.sId,
      this.accountId,
      this.firstname,
      this.progress,
      this.maxStreaks,
      this.iV,
      this.averageCalories,
      this.averageSteps});

  @override
  String toString() {
    return 'Data{sId: $sId, accountID:$accountId ,firstname: $firstname, progress: $progress, maxStreaks: $maxStreaks, averageCalories: $averageCalories, averageSteps: $averageSteps,iV: $iV}';
  }

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    accountId = json['account_id'];
    firstname = json['firstname'];
    if (json['progress'] != null) {
      progress = <Progress>[];
      json['progress'].forEach((v) {
        progress!.add(new Progress.fromJson(v));
      });
    }
    maxStreaks = json['max_streaks'];
    iV = json['__v'];
    averageCalories = json['averageCalories'];
    averageSteps = json['averageSteps'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    data['account_id'] = accountId;
    data['firstname'] = firstname;
    if (progress != null) {
      data['progress'] = progress!.map((v) => v.toJson()).toList();
    }
    data['max_streaks'] = maxStreaks;
    data['__v'] = iV;
    data['averageCalories'] = averageCalories;
    data['averageSteps'] = averageSteps;
    return data;
  }
}

class Progress {
  num? steps;
  num? calorie;
  String? date;
  String? sId;

  Progress(
    {this.steps,
    this.calorie, 
    this.date, 
    this.sId});

    @override
    String toString() {
    return 'Data{steps: $steps, calorie: $calorie, date: $date, sID : $sId}';
  }

  Progress.fromJson(Map<String, dynamic> json) {
    steps = json['steps'];
    calorie = json['calorie'];
    date = json['date'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['steps'] = steps;
    data['calorie'] = calorie;
    data['date'] = date;
    data['_id'] = sId;
    return data;
  }
}
