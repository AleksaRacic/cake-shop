class User {
  String firstName;
  String lastName;
  String username;
  String email;
  String password;
  String phoneNumber;
  bool isCustomer;

  User(
      {required this.firstName,
      required this.lastName,
      required this.username,
      required this.email,
      required this.password,
      required this.phoneNumber,
      required this.isCustomer});
}
