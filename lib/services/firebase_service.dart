/// Imports
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/domain_constants.dart';
import 'package:help_for_hire_flutter_app/helpers/connection_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/snack_bar_helper.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/widgets/text_form_fields/text_form_field_widget.dart';
import 'package:http/http.dart';

/// Handles operations related to Firebase such as authentication or OTPs
class FirebaseService {
  /// Constructor
  const FirebaseService._();

  /// Initializes the Firebase app
  @Deprecated('No longer needed as initialization is done in main')
  static Future<void> initialize() async {
    await Firebase.initializeApp();
  }

  /// Deletes a user from Firebase auth
  static Future<void> deleteUser({
    required String id,
  }) async {
    await delete(
      Uri.parse(
        'https://${DomainConstants.ip}:5001/api/auth/?email=$id${DomainConstants.emailSuffix}',
      ),
    );
  }

  /// Checks if a user exists in Firebase auth
  static Future<bool> isNotExistingUser({
    required BuildContext context,
    required String id,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: '$id${DomainConstants.emailSuffix}',
        password: password,
      );

      // Indicates that the user does not exist
      return true;
    } catch (_) {
      // Indicates that the user does exist, duplicate user details
      return false;
    }
  }

  /// Attempts to sign a user into Firebase auth
  static Future<bool> signInUser({
    required BuildContext context,
    required String id,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: '$id${DomainConstants.emailSuffix}',
        password: password,
      );

      // Indicates successful sign in
      return Future<bool>.value(true);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          SnackBarHelper.showSnackBar(
            context: context,
            data: 'Invalid ID number',
          );
          break;
        case 'user-not-found':
          SnackBarHelper.showSnackBar(
            context: context,
            data: 'User not found',
          );
          break;
        case 'wrong-password':
          SnackBarHelper.showSnackBar(
            context: context,
            data: 'Wrong password',
          );
          break;
      }

      // Indicates failed sign in
      return Future<bool>.value(false);
    }
  }

  /// Checks if a user exists in Firebase auth
  static Future<bool> isExistingId({
    required String id,
  }) async {
    // --- 2021/11/26 - Seems like firebase blocks too many requests from one
    // device, there is no solution around this in debug mode
    // Waiting a few minutes seems to clear the block on the device
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: '$id${DomainConstants.emailSuffix}',
        // Password does not matter here
        password: '0123456789',
      );
    } on FirebaseAuthException catch (e) {
      if (e.toString().contains('blocked')) {
        // Need to create a solution to this problem
        // ignore: avoid_print
        print('---------------------------'
            '\nRate limit hit. Wait a few minutes before trying again'
            '\n---------------------------');
      }

      if (e.code == 'wrong-password') {
        return true;
      }
    }

    return false;
  }

  /// Creates a new user in Firebase auth
  static Future<void> createUser({
    required BuildContext context,
    required String id,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: '$id${DomainConstants.emailSuffix}',
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          SnackBarHelper.showSnackBar(
            context: context,
            data: 'Email already in use',
          );
          break;
        case 'invalid-email':
          SnackBarHelper.showSnackBar(
            context: context,
            data: 'Invalid email',
          );
          break;
        case 'operation-not-allowed':
          SnackBarHelper.showSnackBar(
            context: context,
            data: 'Operation not allowed',
          );
          break;
        case 'weak-password':
          SnackBarHelper.showSnackBar(
            context: context,
            data: 'Weak password',
          );
          break;
      }
    }
  }

  /// Handles OTPs sent to a users phone
  ///
  /// Can also navigate to another page after the OTP is verified
  /// Currently does not work on emulators, this seems to be a security measure
  /// in Firebase to prevent misuse of the system
  static Future<void> handleOtp({
    required BuildContext context,
    required String phoneNumber,
    String routeName = RouteManager.newPasswordPage,
  }) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber:
          '${DomainConstants.phoneNumberPrefix}${phoneNumber.substring(1)}',
      codeSent: (verificationId, _) async {
        final _key = GlobalKey<FormState>();

        final _otpController = TextEditingController();

        showDialog(
          barrierDismissible: false,
          builder: (_) => AlertDialog(
            actions: [
              TextButton(
                child: const Text(
                  'CANCEL',
                ),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: const Text(
                  'SUBMIT',
                ),
                onPressed: () async {
                  if (_key.currentState!.validate()) {
                    if (await ConnectionHelper.hasConnection()) {
                      final smsCode = _otpController.text;

                      final credential = PhoneAuthProvider.credential(
                        verificationId: verificationId,
                        smsCode: smsCode,
                      );

                      try {
                        await FirebaseAuth.instance
                            .signInWithCredential(credential)
                            .then(
                              (_) => Navigator.popAndPushNamed(
                                context,
                                routeName,
                              ),
                            );
                      } catch (_) {
                        SnackBarHelper.showSnackBar(
                          context: context,
                          data: 'OTP is incorrect, please try again',
                        );

                        Navigator.pop(context);
                      }
                    } else {
                      SnackBarHelper.showSnackBar(
                        context: context,
                        data: 'No internet connection',
                      );
                    }
                  } else {
                    SnackBarHelper.showSnackBar(
                      context: context,
                      data: 'Invalid OTP entered',
                    );
                  }
                },
              ),
            ],
            content: Padding(
              child: Form(
                key: _key,
                child: TextFormFieldWidget(
                  controller: _otpController,
                  icon: Icons.pin,
                  keyboardType: TextInputType.number,
                  labelText: 'OTP',
                  lightMode: true,
                  maxLength: 6,
                ),
              ),
              padding: const EdgeInsets.all(
                16.0,
              ),
            ),
            title: const Text(
              'Enter OTP',
            ),
          ),
          context: context,
        );
      },
      codeAutoRetrievalTimeout: (_) {},
      verificationCompleted: (_) {},
      verificationFailed: (_) {},
    );
  }
}
