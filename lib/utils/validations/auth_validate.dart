import 'package:split/core/translator.dart';
import 'package:split/utils/locale/app_localization_keys.dart';
import 'package:split/utils/validations/validator.dart';

mixin AuthValidate on Translator {
  String? emailValidator(String? value) {
    ValidationState validationState = Validator.validateEmail(value);
    switch (validationState) {
      case ValidationState.empty:
        return translate(LocalizationKeys.required);
      case ValidationState.formatting:
        return translate(LocalizationKeys.emailInvalid);
      case ValidationState.valid:
        return null;
    }
  }

  String? phoneNumberValidator(String? value) {
    ValidationState validationState =
        Validator.validateNumber(value, length: 9);
    switch (validationState) {
      case ValidationState.empty:
        return translate(LocalizationKeys.required);
      case ValidationState.formatting:
        return translate(LocalizationKeys.emailOrPhoneNumberInvalid);
      case ValidationState.valid:
        return null;
    }
  }

  String? confirmPasswordValidator(String? value, String password) {
    ValidationState validationState =
        Validator.validateTextWithText(value, password);
    switch (validationState) {
      case ValidationState.empty:
        return translate(LocalizationKeys.required);
      case ValidationState.formatting:
        return translate(LocalizationKeys.passMatch);
      case ValidationState.valid:
        return null;
    }
  }

  String? passwordValidator(String? value) {
    ValidationState validationState = Validator.validatePassword(value);
    switch (validationState) {
      case ValidationState.empty:
        return translate(LocalizationKeys.required);
      case ValidationState.formatting:
        return translate(LocalizationKeys.pleaseEnterValidPassword);
      case ValidationState.valid:
        return null;
    }
  }

  String? fullNameValidator(String? value) {
    ValidationState validationState = Validator.validateText(value);
    switch (validationState) {
      case ValidationState.empty:
        return translate(LocalizationKeys.required);
      case ValidationState.formatting:
        return translate(LocalizationKeys.required);
      case ValidationState.valid:
        return null;
    }
  }

  String? usernameValidator(String? value) {
    ValidationState validationState = Validator.validateUsername(value);
    switch (validationState) {
      case ValidationState.empty:
        return translate(LocalizationKeys.pleaseEnterUsername);
      case ValidationState.formatting:
        return translate(LocalizationKeys.pleaseEnterValidUsername);
      case ValidationState.valid:
        return null;
    }
  }

  String? textValidator(String? value) {
    ValidationState validationState = Validator.validateText(value);
    switch (validationState) {
      case ValidationState.empty:
      case ValidationState.formatting:
        return translate(LocalizationKeys.required);
      case ValidationState.valid:
        return null;
    }
  }

  String? otpValidator(String? value) {
    ValidationState validationState =
        Validator.validateNumber(value, length: 4);
    switch (validationState) {
      case ValidationState.empty:
        return translate(LocalizationKeys.required);
      case ValidationState.formatting:
        return translate(LocalizationKeys.checkOtpCode);
      case ValidationState.valid:
        return null;
    }
  }
}
