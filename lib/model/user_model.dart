class UserModel {
  String uid;
  String firstName;
  String lastName;
  String email;

  UserModel(
      {required this.uid,
      required this.firstName,
      required this.lastName,
      required this.email});

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
      };
}
