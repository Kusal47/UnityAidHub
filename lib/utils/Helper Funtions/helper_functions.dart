

class HelperFunctions{
    bool hasUppercaseLetter(String password) {
    final pattern = RegExp(r'[A-Z]');
    return pattern.hasMatch(password);
  }

  bool hasLowercaseLetter(String password) {
    final pattern = RegExp(r'[a-z]');
    return pattern.hasMatch(password);
  }

  bool hasDigit(String password) {
    final pattern = RegExp(r'[0-9]');
    return pattern.hasMatch(password);
  }

  bool hasSpecialCharacter(String password) {
    final pattern = RegExp(r'[!@#\$%^&*()_+{}|~<>,.?/:;[\]-]');
    return pattern.hasMatch(password);
  }

  bool hasValidLength(String password) {
    return password.length >= 8 && password.length <= 15;
  }


}