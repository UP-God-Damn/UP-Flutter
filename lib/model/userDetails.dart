class UserDetails {
  int? id;
  String? userNickname;
  String? profileImage;
  String? title;
  String? content;
  String? file;
  String? language;
  String? state;
  String? major;
  List<Comments>? comments;
  String? createDate;

  UserDetails(
      {this.id,
      this.userNickname,
      this.profileImage,
      this.title,
      this.content,
      this.file,
      this.language,
      this.state,
      this.major,
      this.comments,
      this.createDate});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userNickname = json['userNickname'];
    profileImage = json['profileImage'];
    title = json['title'];
    content = json['content'];
    file = json['file'];
    language = json['language'];
    state = json['state'];
    major = json['major'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromJson(v));
      });
    }
    createDate = json['createDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userNickname'] = userNickname;
    data['profileImage'] = profileImage;
    data['title'] = title;
    data['content'] = content;
    data['file'] = file;
    data['language'] = language;
    data['state'] = state;
    data['major'] = major;
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }
    data['createDate'] = createDate;
    return data;
  }
}

class Comments {
  int? id;
  String? userNickname;
  String? profileImage;
  String? content;
  String? createDate;

  Comments(
      {this.id,
      this.userNickname,
      this.profileImage,
      this.content,
      this.createDate});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userNickname = json['userNickname'];
    profileImage = json['profileImage'];
    content = json['content'];
    createDate = json['createDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userNickname'] = userNickname;
    data['profileImage'] = profileImage;
    data['content'] = content;
    data['createDate'] = createDate;
    return data;
  }
}
