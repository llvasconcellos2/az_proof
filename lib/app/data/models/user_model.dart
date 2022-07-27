class UserModel {
  Profile? profile;
  String? email;
  String? token;
  String? id;

  UserModel({
    this.profile,
    this.email,
    this.token,
    this.id,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    profile =
        json['profile'] != null ? Profile.fromJson(json['profile']) : Profile();
    email = json['email'];
    token = json['token'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['profile'] = (profile ?? Profile()).toJson();
    data['email'] = email;
    data['token'] = token;
    data['id'] = id;

    return data;
  }
}

class Profile {
  String? name;

  Profile({
    this.name = '',
  });

  Profile.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['name'] = name;

    return data;
  }
}
