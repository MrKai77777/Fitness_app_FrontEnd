class EditProfile {
  String? msg;
  bool? success;

  EditProfile({this.msg, this.success});

  EditProfile.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['msg'] = msg;
    data['success'] = success;
    return data;
  }
}