// ignore_for_file: file_names

class UserProfile {
  String? nickname;
  String? accountId;
  String? profileImgeUrl;
  int? totalPosts;

  UserProfile({nickname, accountId, profileImgeUrl, totalPosts});

  UserProfile.fromJson(Map<String, dynamic> json) {
    nickname = json['nickname'];
    accountId = json['accountId'];
    profileImgeUrl = json['profileImgeUrl'];
    totalPosts = json['totalPosts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nickname'] = nickname;
    data['accountId'] = accountId;
    data['profileImgeUrl'] = profileImgeUrl;
    data['totalPosts'] = totalPosts;
    return data;
  }
}
