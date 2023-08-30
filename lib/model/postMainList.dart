class PostMainList {
  int? totalPage;
  List<PostResponses>? postResponses;

  PostMainList({this.totalPage, this.postResponses});

  PostMainList.fromJson(Map<String, dynamic> json) {
    totalPage = json['totalPage'];
    if (json['postResponses'] != null) {
      postResponses = <PostResponses>[];
      json['postResponses'].forEach((v) {
        postResponses!.add(new PostResponses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalPage'] = this.totalPage;
    if (this.postResponses != null) {
      data['postResponses'] =
          this.postResponses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PostResponses {
  int? id;
  String? userNickname;
  String? title;
  String? state;
  String? major;
  String? language;
  String? createDate;

  PostResponses(
      {this.id,
      this.userNickname,
      this.title,
      this.state,
      this.major,
      this.language,
      this.createDate});

  PostResponses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userNickname = json['userNickname'];
    title = json['title'];
    state = json['state'];
    major = json['major'];
    language = json['language'];
    createDate = json['createDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userNickname'] = this.userNickname;
    data['title'] = this.title;
    data['state'] = this.state;
    data['major'] = this.major;
    data['language'] = this.language;
    data['createDate'] = this.createDate;
    return data;
  }
}
