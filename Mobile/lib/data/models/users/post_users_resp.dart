class PostUsersResp {
  String? message;

  PostUsersResp({this.message});

  PostUsersResp.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.message != null) {
      data['message'] = this.message;
    }
    return data;
  }
}
