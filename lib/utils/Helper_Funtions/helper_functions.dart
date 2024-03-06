

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
  
String slugify(String title) {
  return title.toLowerCase().replaceAll(' ', '-').replaceAll(RegExp(r'[^a-z0-9-]'), '%');
}

double amount(String fund) {
  String amountString = fund.replaceAll('Rs.', '');
  double? amount = double.tryParse(amountString);
  if (amount == null) {
    print('Invalid amount format');
    return 0.0; // or handle the error accordingly
  }
  return amount;
}
bool isImageFile(String fileName) {
  final imageExtensions = ['.jpg', '.jpeg', '.png', '.gif'];
  final extension = fileName.split('.').last.toLowerCase();
  return imageExtensions.contains('.$extension');
}

}