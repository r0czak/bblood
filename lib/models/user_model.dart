class User {
  String? uid;
  String? firstName;
  String? lastName;
  DateTime? birthday;
  String? peselNumber;
  String? email;
  String? password;

  User(
      {this.uid,
      this.firstName,
      this.lastName,
      this.birthday,
      this.peselNumber,
      this.email,
      this.password});

  factory User.fromMap(map) {
    return User(
        uid: map['uid'],
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
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'birthday': birthday,
      'peselNumber': peselNumber,
      'email': email,
      'password': password
    };
  }
}
