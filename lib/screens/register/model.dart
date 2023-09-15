class UserRegister {
  late final String firstName;
  late final String lastName;
  late final String email;
  // late final String _id;
  late final String createdAt;
  late final String updatedAt;
  // late final int _V;

  UserRegister.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    // _id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    // _V = json['__v'];
  }
}
