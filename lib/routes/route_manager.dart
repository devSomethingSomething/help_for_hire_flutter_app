import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/pages/account_type_page.dart';
import 'package:help_for_hire_flutter_app/pages/change_password_page.dart';
import 'package:help_for_hire_flutter_app/pages/employer_profile_page.dart';
import 'package:help_for_hire_flutter_app/pages/history_page.dart';
import 'package:help_for_hire_flutter_app/pages/new_password_page.dart';
import 'package:help_for_hire_flutter_app/pages/register_page.dart';
import 'package:help_for_hire_flutter_app/pages/registration_success_page.dart';
import 'package:help_for_hire_flutter_app/pages/report_page.dart';
import 'package:help_for_hire_flutter_app/pages/reset_password_page.dart';
import 'package:help_for_hire_flutter_app/pages/reset_password_success_page.dart';
import 'package:help_for_hire_flutter_app/pages/review_page.dart';
import 'package:help_for_hire_flutter_app/pages/settings_page.dart';
import 'package:help_for_hire_flutter_app/pages/sign_in_page.dart';
import 'package:help_for_hire_flutter_app/pages/sign_in_register_page.dart';
import 'package:help_for_hire_flutter_app/pages/terms_and_conditions_page.dart';
import 'package:help_for_hire_flutter_app/pages/worker_profile_page.dart';
import 'package:help_for_hire_flutter_app/pages/worker_register_page.dart';

class RouteManager {
  // static const splashPage = '/';
  static const signInRegisterPage = '/signInRegisterPage';
  static const signInPage = '/signInPage';
  static const resetPasswordPage = '/resetPasswordPage';
  static const newPasswordPage = '/newPasswordPage';
  static const resetPasswordSuccessPage = '/resetPasswordSuccessPage';
  static const registerPage = '/';
  static const accountTypePage = '/accountTypePage';
  static const workerRegisterPage = '/workerRegisterPage';
  static const termsAndConditionsPage = '/termsAndConditionsPage';
  static const registrationSuccessPage = '/registrationSuccessPage';
  static const employerProfilePage = '/employerProfilePage';
  static const changePasswordPage = '/changePasswordPage';
  static const workerProfilePage = '/workerProfilePage';
  static const reportPage = '/reportPage';
  static const reviewPage = '/reviewPage';
  static const historyPage = '/historyPage';
  static const settingsPage = '/settingsPage';

  const RouteManager._();

  static Route<MaterialPageRoute> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
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
      case registerPage:
        return MaterialPageRoute(
          builder: (_) => const RegisterPage(),
        );
      case accountTypePage:
        return MaterialPageRoute(
          builder: (_) => const AccountTypePage(),
        );
      case workerRegisterPage:
        return MaterialPageRoute(
          builder: (_) => const WorkerRegisterPage(),
        );
      case termsAndConditionsPage:
        return MaterialPageRoute(
          builder: (_) => const TermsAndConditionsPage(),
        );
      case registrationSuccessPage:
        return MaterialPageRoute(
          builder: (_) => const RegistrationSuccessPage(),
        );
      case employerProfilePage:
        return MaterialPageRoute(
          builder: (_) => EmployerProfilePage(),
        );
      case changePasswordPage:
        return MaterialPageRoute(
          builder: (_) => const ChangePasswordPage(),
        );
      case workerProfilePage:
        return MaterialPageRoute(
          builder: (_) => WorkerProfilePage(),
        );
      case reportPage:
        return MaterialPageRoute(
          builder: (_) => const ReportPage(),
        );
      case reviewPage:
        return MaterialPageRoute(
          builder: (_) => const ReviewPage(),
        );
      case historyPage:
        return MaterialPageRoute(
          builder: (_) => const HistoryPage(),
        );
      case settingsPage:
        return MaterialPageRoute(
          builder: (_) => SettingsPage(),
        );
      default:
        throw Exception(
          'Route not found',
        );
    }
  }
}
