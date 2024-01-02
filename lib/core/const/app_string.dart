// ignore_for_file: constant_identifier_names, duplicate_ignore

class AppString {
  static const String welcomeback = 'Welcome Back ! Glad to see you, Again!';
  static const String email = 'Email Address';
  static const String emailhint = 'Enter your email address';
  static const String passwordhint = 'Enter your password';
  static const String password = 'Password';
  static const String login = 'Login';
  static const String signup = 'Register Now';
  static const String register = 'Register';
  static const String loginnow = 'Login Now';
  static const String username = 'UserName';
  static const String fullName = 'Full Name';
  static const String fullNameHint = 'Enter Your Full Name';
  static const String usernamehint = 'Enter your username';
  static const String registerText = 'Hello! Register to get started';
  static const String confirmpassword = 'Confirm Password';
  static const String confirmpasswordhint = 'Confirm your password';

  // static const String passforgetsub =
  //     'Don\'t worry! It occurs. Please enter the email address linked with your account.';
  // static const String sendcode = 'Get Reset Link';
  // static const String otpverification = 'OTP Verification';
  // static const String otptext =
  //     'Enter the verification code we just sent on your email address.';
  // static const String enteryourcode =
  //     'Enter the verification code we just sent on your email address.';
  // static const String resendcode = 'Resend Code';
  // static const String expireson = 'Expires in 01:38';
  // static const String verify = 'Verify';
  // static const String createnewpass = 'Create New Password';
  // static const String createnewpassdesc =
  //     'Your new password must be unique from those previously used.';
  // static const String changepass = 'Change Password';

  //Validation Strings
  // ignore: constant_identifier_names
  static const String required_ConfirmPass = "Please Confirm your Password";
  // ignore: constant_identifier_names
  static const String validate_ConfirmPass = "Password did not match";

  //userName Validation
  // ignore: constant_identifier_names
  static const String required_userName = "Please enter Username";

  //Phone Number Validation
  // ignore: constant_identifier_names
  static const String required_phone = "Please enter your phone number";
  // ignore: constant_identifier_names
  static const String validate_phone = "Phone number is invalid";

  //Email Validation
  static const String regExp =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const String required_email = "Please enter your Email";
  static const String validate_email = "Please enter valid Email";

  //Password Validation
  static const String required_Password = "Please enter your Password";
  static const String validate_Password =
      "Password must be atleast 8 character";

  static const String imageEditLabel = "Edit with Ease, Create with Joy";
  static const String cameraButtonLabel = "Use Camera";
  static const String galleryButtonLabel = "Select the photo from Gallery";
  static const String imageType = "Png or Jpg";

  static const String validate_Password_Uppercase =
      "Password must have Uppercase";
  static const String validate_Password_Lowercase =
      "Password must have Lowercase";
  static const String validate_Password_Number = "Password must have Number";
  static const String validate_Password_SpecialCharacter =
      "Password must have Special Character";
  static const String validate_Password_Length =
      "Password length must be between 8 to 15";
}
