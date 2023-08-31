class PostMainList {
  int? totalPosts;
  List<PostResponses>? postResponses;

  PostMainList({this.totalPosts, this.postResponses});

  PostMainList.fromJson(Map<String, dynamic> json) {
    totalPosts = json['totalPosts'];
    if (json['postResponses'] != null) {
      postResponses = <PostResponses>[];
      json['postResponses'].forEach((v) {
        postResponses!.add(PostResponses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalPosts'] = totalPosts;
    if (postResponses != null) {
      data['postResponses'] = postResponses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PostResponses {
  int? id;
  String? userNickname;
  String? profile;
  String? title;
  String? state;
  String? major;
  String? language;
  String? createDate;

  PostResponses(
      {this.id,
      this.userNickname,
      this.profile,
      this.title,
      this.state,
      this.major,
      this.language,
      this.createDate});

  PostResponses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userNickname = json['userNickname'];
    profile = json['profile'];
    title = json['title'];
    state = json['state'];
    major = json['major'];
    language = json['language'];
    createDate = json['createDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userNickname'] = userNickname;
    data['profile'] = profile;
    data['title'] = title;
    data['state'] = state;
    data['major'] = major;
    data['language'] = language;
    data['createDate'] = createDate;
    return data;
  }
}
