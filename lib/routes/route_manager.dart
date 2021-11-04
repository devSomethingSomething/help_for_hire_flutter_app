import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/pages/new_password_page.dart';
import 'package:help_for_hire_flutter_app/pages/otp_page.dart';
import 'package:help_for_hire_flutter_app/pages/registration_successful_page.dart';
import 'package:help_for_hire_flutter_app/pages/reset_password_page.dart';
import 'package:help_for_hire_flutter_app/pages/splash_page.dart';

class RouteManager {
  static const splashPage = '/';
  // Uncomment this once the homePage has been added
  // static const homePage = '/homePage';
  // static const accountTypePage = '/accountTypePage'; // Added - Werner
  static const registrationSuccessPage =
      '/registrationSuccessPage'; // Added - Werner
  static const resetPasswordPage = '/resetPasswordPage';
  static const otpPage = '/otpPage';
  static const newPasswordPage = '/newPasswordPage';

  const RouteManager._();

  static Route<MaterialPageRoute> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case splashPage:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );
      // case accountTypePage: // Added - Werner
      // return MaterialPageRoute(
      //   builder: (_) => const AccountType(),
      // );
      case registrationSuccessPage: // Added - Werner
        return MaterialPageRoute(
          builder: (_) => const RegistrationSuccess(),
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
      default:
        throw Exception(
          'Route not found',
        );
    }
  }
}
