class UserLogin {
  late final User user;
  late final String token;

  UserLogin.fromJson(Map<String, dynamic> json) {
    user = User.fromJson(json['user']);
    token = json['token'];
  }
}

class User {
  // late final String _id;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String createdAt;
  late final String updatedAt;
  // late final int _V;

  User.fromJson(Map<String, dynamic> json) {
    // _id = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    // _V = json['__v'];
  }
}
