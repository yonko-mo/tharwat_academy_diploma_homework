class UserModel {
  final String firstName;
  final String lastName;
  final String email;

  const UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
    );
  }
}
