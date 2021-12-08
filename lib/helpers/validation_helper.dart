/// Imports
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/helpers/connection_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/snack_bar_helper.dart';

/// This Validation Helper class is used to validate all the
/// text form fields in the application to see if valid or
/// invalid data has been entered
class ValidationHelper {
  /// Validation Helper constructor
  const ValidationHelper._();

  /// This validateForm method will check if all the
  /// text form fields have data in it
  ///
  /// If some data is missing it will show a snackbar
  /// containing an error message
  static void validateForm({
    required BuildContext context,
    required GlobalKey<FormState> key,
    required void Function() function,
  }) {
    if (key.currentState!.validate()) {
      function();
    } else {
      SnackBarHelper.showSnackBar(
        context: context,
        data: 'Some fields are invalid',
      );
    }
  }

  /// This checkConnection method will check if there is
  /// connection to the internet
  ///
  /// If there is no connection it will show a snackbar
  /// containing an error message
  static void checkConnection({
    required BuildContext context,
    required void Function() function,
  }) async {
    if (await ConnectionHelper.hasConnection()) {
      function();
    } else {
      SnackBarHelper.showSnackBar(
        context: context,
        data: 'No internet connection',
      );
    }
  }

  /// This validateText method will check if there is valid
  /// data in the text form field
  ///
  /// It will return an error message if the text form field is empty or
  /// too long
  static String? validateText(
    String? text,
  ) {
    if (text == null || text.isEmpty) {
      return 'Text cannot be empty';
    } else if (text.length > 32) {
      return 'Text is too long';
    }

    return null;
  }

  static String? validateFee() {
    return null;
  }

  /// This validatePhoneNumber method will check if there is valid
  /// data in the text form field
  ///
  /// It will return an error message if the text form field is empty or
  /// if it conatains a . or , in it
  static String? validatePhoneNumber(
    String? text,
  ) {
    if (text == null || text.isEmpty) {
      return 'Number is empty';
    } else if (text.contains('.') || text.contains(',')) {
      return 'Number cannot contain decimal points';
    }

    return null;
  }

  /// This validateOtp method will check if there is valid
  /// data in the text form fields
  ///
  /// It will return a error message if the text form field is empty or
  /// if it conatains a . or , or if it is 6 characters long
  static String? validateOtp(
    String? text,
  ) {
    if (text == null || text.isEmpty) {
      return 'OTP is empty';
    } else if (text.contains('.') || text.contains(',')) {
      return 'OTP cannot contain decimal points';
    } else if (text.length != 6) {
      return 'OTP should be 6 characters long please try again';
    }

    return null;
  }

  /// This validatePassword method will check if there is valid
  /// data in the text form field
  ///
  /// It will return a error message if the text form field is empty,
  /// if it is 8 characters long, less than 24 character and checks if it contains
  /// an upper case, lower case, number and special character
  static String? validatePassword(
    String? text,
  ) {
    if (text == null || text.isEmpty) {
      return 'Password cannot be empty';
    } else if (text.length < 8) {
      return 'Password should be at least 8 characters long please try again';
    } else if (text.length > 24) {
      return 'Password cannot be more than 24 characters please try again';
    } else if (!text.contains(RegExp(r'[A-Z]')) ||
        !text.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain uppercase and lowercase';
    } else if (!text.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least 1 special character';
    }

    return null;
  }

  /// This validateDescription method will check if there is valid
  /// data in the text form field
  ///
  /// It will return an error message if the text form field is empty
  static String? validateDescription(
    String? text,
  ) {
    if (text == null || text.isEmpty) {
      return 'Text is empty';
    }

    return null;
  }

  /// This validateIdmethod will check if there is valid
  /// data in the text form field
  ///
  /// It will return a error message if the text form field is empty,
  /// if it is 13 characters long, and does not contain . or ,
  static String? validateId(
    String? text,
  ) {
    if (text == null || text.isEmpty) {
      return 'ID cannot be empty';
    } else if (text.contains('.') || text.contains(',')) {
      return 'ID cannot contain decimal points';
    } else if (text.length != 13) {
      return 'ID should be 13 characters long please try again';
    }

    return null;
  }
}
