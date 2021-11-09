import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/pages/new_password_page.dart';
import 'package:help_for_hire_flutter_app/pages/new_user_register_page.dart';
import 'package:help_for_hire_flutter_app/pages/otp_page.dart';
import 'package:help_for_hire_flutter_app/pages/registration_successful_page.dart';
import 'package:help_for_hire_flutter_app/pages/reset_password_page.dart';
import 'package:help_for_hire_flutter_app/pages/sign_in_register_page.dart';
import 'package:help_for_hire_flutter_app/pages/splash_page.dart';

class RouteManager {
  static const splashPage = '/';
  static const signInRegisterPage = '/signInRegisterPage';
  // static const newUserRegisterPage = '/newUserRegisterPage'; // Added - Werner
  // static const accountTypePage = '/accountTypePage'; // Added - Werner
  // static const workerRegisterPage = '/workerRegisterPage'; // Added - Werner
  static const registrationSuccessPage =
      '/registrationSuccessPage'; // Added - Werner
  static const resetPasswordPage = '/resetPasswordPage';
  static const otpPage = '/otpPage';
  static const newPasswordPage = '/newPasswordPage';
  // static const employerPage = '/employerPage';
  // static const workerPage = '/workerPage';
  // static const historyPage = '/historyPage';
  // static const reviewPage = '/reviewPage';
  // static const reportPage = '/reportPage';
  // static const settingsPage = '/settingsPage';

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
      // case newUserRegisterPage: // Added - Werner
      //   return MaterialPageRoute(
      //     builder: (_) => const NewUserRegisterPage(),
      //   );
      // case accountTypePage: // Added - Werner
      // return MaterialPageRoute(
      //   builder: (_) => const AccountType(),
      // );
      // case workerRegisterPage: // Added - Werner
      // return MaterialPageRoute(
      //   builder: (_) => const WorkerRegisterPage(),
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
          builder: (_) => NewPasswordPage(),
        );
      // case employerPage:
      // return MaterialPageRoute(
      //   builder: (_) => const EmpProfilePage(),
      // );
      // case workerPage:
      // return MaterialPageRoute(
      //   builder: (_) => const WorkProfilePage(),
      // );
      // case historyPage:
      // return MaterialPageRoute(
      //   builder: (_) => const HistoryPage(),
      // );
      // case reviewPage:
      // return MaterialPageRoute(
      //   builder: (_) => const ReviewPage(),
      // );
      // case reportPage:
      // return MaterialPageRoute(
      //   builder: (_) => const ReportPage(),
      // );
      // case settingsPage:
      // return MaterialPageRoute(
      //   builder: (_) => const SettingsPage(),
      // );
      default:
        throw Exception(
          'Route not found',
        );
    }
  }
}
