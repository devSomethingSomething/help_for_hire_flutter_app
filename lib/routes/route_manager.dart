import 'package:flutter/material.dart';
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
import 'package:help_for_hire_flutter_app/pages/settings_page.dart';
import 'package:help_for_hire_flutter_app/pages/review_page.dart';
import 'package:help_for_hire_flutter_app/pages/sign_in_register_page.dart';
import 'package:help_for_hire_flutter_app/pages/splash_page.dart';
import 'package:help_for_hire_flutter_app/pages/worker_register_page.dart';
import 'package:help_for_hire_flutter_app/pages/invites_page.dart';

class RouteManager {
  static const splashPage = '/splashPage';
  static const signInRegisterPage = '/signInRegisterPage';
  static const newUserRegisterPage = '/newUserRegisterPage'; // Added - Werner
  static const accountTypePage = '/accountTypePage'; // Added - Werner
  static const workerRegisterPage = '/workerRegisterPage'; // Added - Werner
  static const registrationSuccessPage =
      '/registrationSuccessPage'; // Added - Werner
  static const resetPasswordPage = '/resetPasswordPage';
  static const changePasswordPage = '/changePasswordPage';
  static const otpPage = '/otpPage';
  static const newPasswordPage = '/newPasswordPage';
  static const settingsPage = '/settingsPage';
  static const employerPage = '/employerPage';
  static const workerPage = '/workerPage';
  static const historyPage = '/historyPage';
  static const reviewPage = '/reviewPage';
  static const reportPage = '/reportPage';
  static const invitesPage = '/';

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
      case newUserRegisterPage: // Added - Werner
        return MaterialPageRoute(
          builder: (_) => const NewUserRegisterPage(),
        );
      case accountTypePage: // Added - Werner
        return MaterialPageRoute(
          builder: (_) => const AccountTypePage(),
        );
      case workerRegisterPage: // Added - Werner
        return MaterialPageRoute(
          builder: (_) => const WorkerRegisterPage(),
        );
      case registrationSuccessPage: // Added - Werner
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
      case employerPage:
        return MaterialPageRoute(
          builder: (_) => EmpProfilePage(),
        );
      // case workerPage:
      // return MaterialPageRoute(
      //   builder: (_) => const WorkProfilePage(),
      // );
      case historyPage:
        return MaterialPageRoute(
          builder: (_) => const HistoryPage(),
        );
      case invitesPage:
        return MaterialPageRoute(
          builder: (_) => const InvitesPage(),
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
