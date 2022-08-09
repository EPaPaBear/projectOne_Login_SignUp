class PostLogoutResp {
  String? status;
  String? message;

  PostLogoutResp({this.status, this.message});

  PostLogoutResp.fromJson(Map<String, dynamic> json) {
    status = json['STATUS'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.status != null) {
      data['STATUS'] = this.status;
    }
    if (this.message != null) {
      data['message'] = this.message;
    }
    return data;
  }
}
