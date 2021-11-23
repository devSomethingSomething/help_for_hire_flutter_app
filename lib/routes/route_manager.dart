import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/models/employer_model.dart';
import 'package:help_for_hire_flutter_app/models/user_model.dart';
import 'package:help_for_hire_flutter_app/pages/account_type_page.dart';
import 'package:help_for_hire_flutter_app/pages/change_password_page.dart';
import 'package:help_for_hire_flutter_app/pages/logged_in_user_profile_page.dart';
import 'package:help_for_hire_flutter_app/pages/history_page.dart';
import 'package:help_for_hire_flutter_app/pages/new_password_page.dart';
import 'package:help_for_hire_flutter_app/pages/register_page.dart';
import 'package:help_for_hire_flutter_app/pages/registration_success_page.dart';
import 'package:help_for_hire_flutter_app/pages/report_page.dart';
import 'package:help_for_hire_flutter_app/pages/reset_password_page.dart';
import 'package:help_for_hire_flutter_app/pages/reset_password_success_page.dart';
import 'package:help_for_hire_flutter_app/pages/review_page.dart';
import 'package:help_for_hire_flutter_app/pages/selected_employer_profile_page.dart';
import 'package:help_for_hire_flutter_app/pages/settings_page.dart';
import 'package:help_for_hire_flutter_app/pages/sign_in_page.dart';
import 'package:help_for_hire_flutter_app/pages/sign_in_register_page.dart';
import 'package:help_for_hire_flutter_app/pages/splash_page.dart';
import 'package:help_for_hire_flutter_app/pages/terms_and_conditions_page.dart';
import 'package:help_for_hire_flutter_app/pages/update_user_info_page.dart';
import 'package:help_for_hire_flutter_app/pages/worker_register_page.dart';
import 'package:help_for_hire_flutter_app/pages/profile_discovery_page.dart';
import 'package:help_for_hire_flutter_app/pages/invites_page.dart';

class RouteManager {
  static const splashPage = '/';

  static const signInRegisterPage = '/signInRegisterPage';
  static const signInPage = '/signInPage';
  static const resetPasswordPage = '/resetPasswordPage';
  static const newPasswordPage = '/newPasswordPage';
  static const resetPasswordSuccessPage = '/resetPasswordSuccessPage';
  static const registerPage = '/registerPage';
  static const accountTypePage = '/accountTypePage';
  static const workerRegisterPage = '/workerRegisterPage';
  static const termsAndConditionsPage = '/termsAndConditionsPage';
  static const registrationSuccessPage = '/registrationSuccessPage';
  static const loggedInUserProfile = '/loggedInUserProfile';
  static const changePasswordPage = '/changePasswordPage';
  static const reportPage = '/reportPage';
  static const invitesPage = '/invitesPage';
  static const reviewPage = '/reviewPage';
  static const historyPage = '/historyPage';
  static const settingsPage = '/settingsPage';
  static const profileDiscoveryPage = '/profileDiscoveryPage';
  static const updateUserInfoPage = '/updateUserInfoPage';
  static const selectedEmployerProfilePage = '/selectedEmployerProfilePage';

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
      case loggedInUserProfile:
        return MaterialPageRoute(
          builder: (_) => LoggedInUserProfile(),
        );
      case changePasswordPage:
        return MaterialPageRoute(
          builder: (_) => const ChangePasswordPage(),
        );
      case reportPage:
        return MaterialPageRoute(
          builder: (_) => const ReportPage(),
        );
      case invitesPage:
        return MaterialPageRoute(
          builder: (_) => const InvitesPage(),
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
      case profileDiscoveryPage:
        return MaterialPageRoute(
          builder: (_) => const ProfileDiscoveryPage(),
        );
      case selectedEmployerProfilePage:
        return MaterialPageRoute(
          builder: (_) => SelectedEmployerProfilePage(),
        );

      default:
        throw Exception(
          'Route not found',
        );
    }
  }
}
