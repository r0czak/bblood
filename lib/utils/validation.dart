//todo Finish all validation cases and test them
mixin InputValidationMixin {
  bool isPasswordValid(String password) {
    String pattern = r'^.{6,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(password);
  }

  bool isEmailValid(String email) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email) && email.isNotEmpty;
  }

  bool isNameValid(String name) {
    //String pattern = r"^([a-z]+[,.]?[ ]?|[a-z]+['-]?)+$";
    //RegExp regex = RegExp(pattern);
    return name.length <= 30;
  }

  bool isPeselNumberValid(String peselNumber) {
    String pattern = '[0-9]{4}[0-3]{1}[0-9]{6}';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(peselNumber);
  }

  bool isLoginNameValid(String loginName) {
    String pattern = r'^[a-zA-Z]\w*$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(loginName) &&
        (loginName.length <= 30 && loginName.length >= 5);
  }
}
