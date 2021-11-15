import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/pages/login_page.dart';
import 'package:help_for_hire_flutter_app/pages/account_type_page.dart';
import 'package:help_for_hire_flutter_app/pages/employer_profile_page.dart';
import 'package:help_for_hire_flutter_app/pages/history_page.dart';
import 'package:help_for_hire_flutter_app/pages/new_password_page.dart';
import 'package:help_for_hire_flutter_app/pages/new_user_register_page.dart';
import 'package:help_for_hire_flutter_app/pages/change_password_page.dart';
import 'package:help_for_hire_flutter_app/pages/otp_page.dart';
import 'package:help_for_hire_flutter_app/pages/registration_successful_page.dart';
import 'package:help_for_hire_flutter_app/pages/report_page.dart';
import 'package:help_for_hire_flutter_app/pages/reset_password_page.dart';
import 'package:help_for_hire_flutter_app/pages/review_page.dart';
import 'package:help_for_hire_flutter_app/pages/settings_page.dart';
import 'package:help_for_hire_flutter_app/pages/sign_in_register_page.dart';
import 'package:help_for_hire_flutter_app/pages/splash_page.dart';
import 'package:help_for_hire_flutter_app/pages/terms_and_conditions_page.dart';
import 'package:help_for_hire_flutter_app/pages/worker_profile_page.dart';
import 'package:help_for_hire_flutter_app/pages/worker_register_page.dart';

class RouteManager {
  static const splashPage = '/';
  static const signInRegisterPage = '/signInRegisterPage';
  static const newUserRegisterPage = '/newUserRegisterPage';
  static const accountTypePage = '/accountTypePage';
  static const workerRegisterPage = '/workerRegisterPage';
  static const registrationSuccessPage = '/registrationSuccessPage';
  static const resetPasswordPage = '/resetPasswordPage';
  static const changePasswordPage = '/changePasswordPage';
  static const otpPage = '/otpPage';
  static const newPasswordPage = '/newPasswordPage';
  static const loginPage = '/loginPage';
  static const settingsPage = '/settingsPage';
  static const employerPage = '/employerPage';
  static const workerPage = '/workerPage';
  static const historyPage = '/historyPage';
  static const reviewPage = '/reviewPage';
  static const reportPage = '/reportPage';
  static const termsAndConditions = '/termsAndConditions';

  const RouteManager._();

  static Route<MaterialPageRoute> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case splashPage:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );
      case signInRegisterPage:
        return MaterialPageRoute(
          builder: (_) => const SignInRegisterPage(),
        );
      case newUserRegisterPage:
        return MaterialPageRoute(
          builder: (_) => const NewUserRegisterPage(),
        );
      case accountTypePage:
        return MaterialPageRoute(
          builder: (_) => const AccountTypePage(),
        );
      case workerRegisterPage:
        return MaterialPageRoute(
          builder: (_) => const WorkerRegisterPage(),
        );
      case registrationSuccessPage:
        return MaterialPageRoute(
          builder: (_) => const RegistrationSuccess(),
        );
      case resetPasswordPage:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordPage(),
        );
      case changePasswordPage:
        return MaterialPageRoute(
          builder: (_) => const ChangePasswordPage(),
        );
      case otpPage:
        return MaterialPageRoute(
          builder: (_) => const OtpPage(),
        );
      case newPasswordPage:
        return MaterialPageRoute(
          builder: (_) => NewPasswordPage(),
        );
      case loginPage:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      case settingsPage:
      return MaterialPageRoute(
        builder: (_) =>  SettingsPage(),
      );
      case employerPage:
        return MaterialPageRoute(
          builder: (_) => EmpProfilePage(),
        );
      case workerPage:
        return MaterialPageRoute(
          builder: (_) => WorkProfilePage(),
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
      case termsAndConditions:
        return MaterialPageRoute(
          builder: (_) => const TermsAndConditionsPage(),
        );
      default:
        throw Exception(
          'Route not found',
        );
    }
  }
}
