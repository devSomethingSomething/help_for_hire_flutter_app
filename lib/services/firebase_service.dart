import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/domain_constants.dart';
import 'package:help_for_hire_flutter_app/helpers/snack_bar_helper.dart';

class FirebaseService {
  const FirebaseService._();

  static Future<void> initialize() async {
    await Firebase.initializeApp();
  }

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

  static Future<void> signInUser({
    required BuildContext context,
    required String id,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: '$id${DomainConstants.emailSuffix}',
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          SnackBarHelper.showSnackBar(
            context: context,
            data: 'Invalid email',
          );
          break;
        case 'user-disabled':
          SnackBarHelper.showSnackBar(
            context: context,
            data: 'User disabled',
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
    }
  }
}
