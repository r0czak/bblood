class UserInfoModel{
  String? firstName;
  String? lastName;
  DateTime? birthday;
  String? peselNumber;
  String? email;
  String? password;

  UserInfoModel(
      {this.firstName,
      this.lastName,
      this.birthday,
      this.peselNumber,
      this.email,
      this.password});

  // receive data from the server
  factory UserInfoModel.fromMap(map) {
    return UserInfoModel(
        firstName: map['firstName'],
        lastName: map['lastName'],
        birthday: map['birthday'],
        peselNumber: map['peselNumber'],
        email: map['email'],
        password: map['password']);
  }

  // send data to the server
  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'birthday': birthday,
      'peselNumber': peselNumber,
      'email': email,
      'password': password
    };
  }
}
