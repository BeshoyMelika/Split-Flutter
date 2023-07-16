import 'package:flutter/material.dart';
import 'package:split/utils/locale/app_localization.dart';
import 'package:split/utils/locale/app_localization_keys.dart';
import 'package:split/utils/text_form_validators/txt_form_filed_vaildators.dart';

// enum FormValidatorsStates { vaild, empty, notVaild }
// enum can be call like calss

class TextFormValidatorsTranslator {
  BuildContext context;

  TextFormValidatorsTranslator(this.context);
  // its states
  String empty = FormValidatorsStates.empty.name;
  String notValid = FormValidatorsStates.notVaild.name;
  String valid = FormValidatorsStates.vaild.name;
  String alreadyTaken = FormValidatorsStates.alreadyTaken.name;

  // enmil
  String? translatedEmail(email) {
    if (FormValidators.emailValidator(email) ==
        FormValidatorsStates.notVaild.name) {
      return _translateString(LocalizationKeys.pleaseEnterValidEmail);
    } else if (FormValidators.emailValidator(email) ==
        FormValidatorsStates.empty.name) {
      return _translateString(LocalizationKeys.pleaseEnterEmail);
    } else {
      return null;
    }
  }

// phone
  String? translatedPhone(phoneNumber) {
    if (FormValidators.phoneValidator(phoneNumber) ==
        FormValidatorsStates.notVaild.name) {
      return _translateString(LocalizationKeys.pleaseEnterValidPhoneNumber);
    } //
    else if (FormValidators.phoneValidator(phoneNumber) ==
        FormValidatorsStates.empty.name) {
      return _translateString(LocalizationKeys.pleaseEnterPhoneNumber);
    } else {
      return null;
    }
  }

// password
  String? translatedUserName(userName) {
    if (FormValidators.usernameValidator(userName) == notValid) {
      return _translateString(LocalizationKeys.pleaseEnterValidUsername);
    } else if (FormValidators.passwordValidator(userName) == empty) {
      return _translateString(LocalizationKeys.pleaseEnterUsername);
    } else {
      return null;
    }
  }

// userName
  String? translatedPassword(password) {
    if (FormValidators.passwordValidator(password) == notValid) {
      return _translateString(LocalizationKeys.pleaseEnterValidPassword);
    }
    //
    else if (FormValidators.passwordValidator(password) == empty) {
      return _translateString(LocalizationKeys.pleaseEnterPassword);
    } else {
      return null;
    }
  }

  String _translateString(String text) =>
      AppLocalizations.of(context)!.translate(text)!;
}
