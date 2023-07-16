import 'dart:core';

enum FormValidatorsStates { vaild, empty, notVaild, alreadyTaken }

// FormVaildatrosStates state = FormVaildatrosStates.empty;
String empty = FormValidatorsStates.empty.name;
String notVaild = FormValidatorsStates.notVaild.name;
String vaild = FormValidatorsStates.vaild.name;
String alreadyTaken = FormValidatorsStates.alreadyTaken.name;

class FormValidators {
  //
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return empty;
    }

    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegex.hasMatch(value)) {
      return notVaild;
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return empty;
    }
    final phoneRegex = RegExp(r'^(01)\d{9}$');
    //r'^(0|1)\d{9}$'     ,, r'^\d{11}$'
    if (!phoneRegex.hasMatch(value)) {
      return notVaild;
    }
    return null;
  }

  static String? usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return empty;
    }
    final usernameRegex = RegExp(r'^[a-zA-Z0-9_]{6,}$');
    if (!usernameRegex.hasMatch(value)) {
      return notVaild;
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return empty;
    }
    final passwordRegex = RegExp(r'^(?=.*[A-Za-z])[A-Za-z\d]{5,}');
    if (!passwordRegex.hasMatch(value)) {
      return notVaild;
    }
    return null;
  }
}
