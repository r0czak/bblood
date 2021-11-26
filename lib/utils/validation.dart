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
    String pattern = r"^[a-zA-ZàáâäąčćęèéêłńòóôöõøżźñçčšžĄĆČĘÈÉÊËŁŃÒÓŻŹČŠŽ ,.'-]+$";
    RegExp regex = RegExp(pattern);
    return (name.length <= 30 && name.length >= 3) && regex.hasMatch(name);
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

  bool isDateValid(String date){
    String pattern = r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$|(?:(?:1[6-9]|[2-9]\d)?\d{2})(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\5(?:0?[1-9]|1\d|2[0-8])$|^(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00)))(\/|-|\.)0?2\6(29)$|^(?:(?:1[6-9]|[2-9]\d)?\d{2})(?:(?:(\/|-|\.)(?:0?[1,3-9]|1[0-2])\8(?:29|30))|(?:(\/|-|\.)(?:0?[13578]|1[02])\9(?:31)))$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(date);
  }
}
