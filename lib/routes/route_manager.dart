import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/pages/new_password_page.dart';
import 'package:help_for_hire_flutter_app/pages/otp_page.dart';
import 'package:help_for_hire_flutter_app/pages/reset_password_page.dart';
import 'package:help_for_hire_flutter_app/pages/splash_page.dart';

class RouteManager {
  static const String loadingPage = '/';
 // static const String homePage = '/homePage';
  static const resetPasswordPage = '/resetPasswordPage';
  static const otpPage = '/otpPage';
  static const newPasswordPage = '/newPasswordPage';

  const RouteManager._();

  static Route<MaterialPageRoute> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case loadingPage:
        return MaterialPageRoute(
          builder: (context) => SplashPage(),
        );
      // case homePage:
      //   return MaterialPageRoute(
      //     builder: (context) => SignInSignUpPage(),
      //   );
      case resetPasswordPage:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordPage(),
        );
      case otpPage:
        return MaterialPageRoute(
          builder: (_) => const OtpPage(),
        );
      case newPasswordPage:
        return MaterialPageRoute(
          builder: (_) => const NewPasswordPage(),
        );
      default:
        throw Exception(
          'Route not found',
        );
    }
  }
}
