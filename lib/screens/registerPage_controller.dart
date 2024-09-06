import 'package:get/get.dart';

class RegisterController extends GetxController {
  var email = ''.obs;
  var username = ''.obs;
  var bio = ''.obs;
  var password = ''.obs;
  var passwordConfirm = ''.obs;

  void setEmail(String value) => email.value = value;
  void setUsername(String value) => username.value = value;
  void setBio(String value) => bio.value = value;
  void setPassword(String value) => password.value = value;
  void setPasswordConfirm(String value) => passwordConfirm.value = value;

  bool get isPasswordValid => password.value == passwordConfirm.value;
}
