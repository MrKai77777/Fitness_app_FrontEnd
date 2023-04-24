class AddGoalsResponse {
  bool? success;
  String? msg;

  AddGoalsResponse({this.success, this.msg});

  AddGoalsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = success;
    data['msg'] = msg;
    return data;
  }
}