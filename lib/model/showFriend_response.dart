class ShowFriends {
  Data? data;

  ShowFriends({this.data});

  ShowFriends.fromJson(Map<String, dynamic> json) {
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
    return 'ShowFriends {data: ${data.toString()}, ';
  }
}

class Data {
  String? sId;
  String? accountId;
  String? name;
  List<FriendList>? friendList;
  int? iV;

  Data(
    {this.sId,
    this.accountId, 
    this.name, 
    this.friendList, 
    this.iV});

    @override
    String toString() {
    return 'Data{sId: $sId, accountId: $accountId, name: $name, friendList: $friendList,iV: $iV}';
  }

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    accountId = json['account_id'];
    name = json['name'];
    if (json['friend_list'] != null) {
      friendList = <FriendList>[];
      json['friend_list'].forEach((v) {
        friendList!.add(new FriendList.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    data['account_id'] = accountId;
    data['name'] = name;
    if (friendList != null) {
      data['friend_list'] = friendList!.map((v) => v.toJson()).toList();
    }
    data['__v'] = iV;
    return data;
  }
}

class FriendList {
  String? friendId;
  String? friendName;
  int? streaks;
  String? sId;

  FriendList(
    {this.friendId, 
    this.friendName, 
    this.streaks, 
    this.sId});

    @override
    String toString() {
    return 'Data{sId: $sId, friendId: $friendId, friendName: $friendName, streaks : $streaks}';
  }

  FriendList.fromJson(Map<String, dynamic> json) {
    friendId = json['friend_id'];
    friendName = json['friend_name'];
    streaks = json['streaks'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['friend_id'] = friendId;
    data['friend_name'] = friendName;
    data['streaks'] = streaks;
    data['_id'] = sId;
    return data;
  }
}
