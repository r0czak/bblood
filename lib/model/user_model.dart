class UserModel {
  String? userId;
  String? firstName;
  String? lastName;
  DateTime? birthday;
  String? peselNumber;
  String? email;
  String? login;
  String? password;

  UserModel(
      {this.userId,
      this.firstName,
      this.lastName,
      this.birthday,
      this.peselNumber,
      this.email,
      this.login,
      this.password});

  // receive data from the server
  factory UserModel.fromMap(map) {
    return UserModel(
        userId: map['userId'],
        firstName: map['firstName'],
        lastName: map['lastName'],
        birthday: map['birthday'],
        peselNumber: map['peselNumber'],
        email: map['email'],
        login: map['login'],
        password: map['password']);
  }

  // send data to the server
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'birthday': birthday,
      'peselNumber': peselNumber,
      'email': email,
      'login': login,
      'password': password
    };
  }
}
