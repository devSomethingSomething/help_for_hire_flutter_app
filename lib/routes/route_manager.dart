import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/pages/otp_page.dart';
import 'package:help_for_hire_flutter_app/pages/reset_password_page.dart';

class RouteManager {
  static const resetPasswordPage = '/resetPasswordPage';
  static const otpPage = '/otpPage';

  const RouteManager._();

  static Route<MaterialPageRoute> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case resetPasswordPage:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordPage(),
        );
      case otpPage:
        return MaterialPageRoute(
          builder: (_) => const OtpPage(),
        );
      default:
        throw Exception(
          'Route not found',
        );
    }
  }
}
