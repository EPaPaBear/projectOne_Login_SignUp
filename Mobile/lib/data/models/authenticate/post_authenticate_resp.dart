class PostAuthenticateResp {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? createdAt;
  String? updatedAt;

  PostAuthenticateResp(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.createdAt,
      this.updatedAt});

  PostAuthenticateResp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.id != null) {
      data['id'] = this.id;
    }
    if (this.name != null) {
      data['name'] = this.name;
    }
    if (this.email != null) {
      data['email'] = this.email;
    }
    if (this.phone != null) {
      data['phone'] = this.phone;
    }
    if (this.createdAt != null) {
      data['created_at'] = this.createdAt;
    }
    if (this.updatedAt != null) {
      data['updated_at'] = this.updatedAt;
    }
    return data;
  }
}
