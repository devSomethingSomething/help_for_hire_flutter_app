import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/pages/login_page.dart';
import 'package:help_for_hire_flutter_app/pages/account_type_page.dart';
import 'package:help_for_hire_flutter_app/pages/employer_profile_page.dart';
import 'package:help_for_hire_flutter_app/pages/history_page.dart';
import 'package:help_for_hire_flutter_app/pages/new_password_page.dart';
import 'package:help_for_hire_flutter_app/pages/new_user_register_page.dart';
import 'package:help_for_hire_flutter_app/pages/change_password_page.dart';
import 'package:help_for_hire_flutter_app/pages/registration_successful_page.dart';
import 'package:help_for_hire_flutter_app/pages/report_page.dart';
import 'package:help_for_hire_flutter_app/pages/reset_password_page.dart';
import 'package:help_for_hire_flutter_app/pages/reset_password_success_page.dart';
import 'package:help_for_hire_flutter_app/pages/review_page.dart';
import 'package:help_for_hire_flutter_app/pages/sign_in_page.dart';
import 'package:help_for_hire_flutter_app/pages/sign_in_register_page.dart';
import 'package:help_for_hire_flutter_app/pages/splash_page.dart';
import 'package:help_for_hire_flutter_app/pages/test_page.dart';

class RouteManager {
  static const testPage = '/';
  // static const splashPage = '/';
  static const signInRegisterPage = '/signInRegisterPage';
  static const signInPage = '/signInPage';
  static const resetPasswordPage = '/resetPasswordPage';
  static const newPasswordPage = '/newPasswordPage';
  static const resetPasswordSuccessPage = '/resetPasswordSuccessPage';
  static const registrationSuccessPage = '/registrationSuccessPage';
  static const changePasswordPage = '/changePasswordPage';
  static const employerPage = '/employerPage';
  static const historyPage = '/historyPage';
  static const reviewPage = '/reviewPage';
  static const reportPage = '/reportPage';

  const RouteManager._();

  static Route<MaterialPageRoute> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case testPage:
        return MaterialPageRoute(
          builder: (_) => const TestPage(),
        );
      // case splashPage:
      //   return MaterialPageRoute(
      //     builder: (_) => const SplashPage(),
      //   );
      case signInRegisterPage:
        return MaterialPageRoute(
          builder: (_) => const SignInRegisterPage(),
        );
      case signInPage:
        return MaterialPageRoute(
          builder: (_) => SignInPage(),
        );
      case resetPasswordPage:
        return MaterialPageRoute(
          builder: (_) => ResetPasswordPage(),
        );
      case newPasswordPage:
        return MaterialPageRoute(
          builder: (_) => NewPasswordPage(),
        );
      case resetPasswordSuccessPage:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordSuccessPage(),
        );
      case registrationSuccessPage:
        return MaterialPageRoute(
          builder: (_) => const RegistrationSuccess(),
        );
      case changePasswordPage:
        return MaterialPageRoute(
          builder: (_) => const ChangePasswordPage(),
        );
      case employerPage:
        return MaterialPageRoute(
          builder: (_) => EmpProfilePage(),
        );
      case historyPage:
        return MaterialPageRoute(
          builder: (_) => const HistoryPage(),
        );
      case reviewPage:
        return MaterialPageRoute(
          builder: (_) => const ReviewPage(),
        );
      case reportPage:
        return MaterialPageRoute(
          builder: (_) => const ReportPage(),
        );
      default:
        throw Exception(
          'Route not found',
        );
    }
  }
}
