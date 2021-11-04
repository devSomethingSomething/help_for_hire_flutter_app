import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/pages/new_password_page.dart';
import 'package:help_for_hire_flutter_app/pages/otp_page.dart';
import 'package:help_for_hire_flutter_app/pages/reset_password_page.dart';
import 'package:help_for_hire_flutter_app/pages/reset_password_success_page.dart';
import 'package:help_for_hire_flutter_app/pages/splash_page.dart';

class RouteManager {
  // For testing purposes you can change the root route to something else like
  // the resetPasswordPage. Just remember to change it back before a merge
  static const splashPage = '/';
  // Uncomment this once the homePage has been added
  // static const homePage = '/homePage';
  static const resetPasswordPage = '/resetPasswordPage';
  static const otpPage = '/otpPage';
  static const newPasswordPage = '/newPasswordPage';
  static const resetPasswordSuccessPage = '/resetPasswordSuccessPage';

  const RouteManager._();

  static Route<MaterialPageRoute> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case splashPage:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );
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
      case resetPasswordSuccessPage:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordSuccessPage(),
        );
      default:
        throw Exception(
          'Route not found',
        );
    }
  }
}
