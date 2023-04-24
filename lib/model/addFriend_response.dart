class AddFriendResponse {
  bool? success;
  String? msg;

  AddFriendResponse({this.success, this.msg});

  AddFriendResponse.fromJson(Map<String, dynamic> json) {
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