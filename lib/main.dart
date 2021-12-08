/// Imports
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/models/form_model.dart';
import 'package:help_for_hire_flutter_app/models/settings_model.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/services/employer_service.dart';
import 'package:help_for_hire_flutter_app/services/history_service.dart';
import 'package:help_for_hire_flutter_app/services/invite_service.dart';
import 'package:help_for_hire_flutter_app/services/job_service.dart';
import 'package:help_for_hire_flutter_app/services/location_service.dart';
import 'package:help_for_hire_flutter_app/services/rating_service.dart';
import 'package:help_for_hire_flutter_app/services/report_service.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/services/worker_service.dart';

import 'package:provider/provider.dart';

/// Entry point of the program
void main() async {
  // Initializes a widget binding
  WidgetsFlutterBinding.ensureInitialized();

  // Uses custom HTTP overrides which allow us to connect to the web API hosted
  // locally
  HttpOverrides.global = CustomHttpOverrides();

  // Initialize the Firebase instance
  await Firebase.initializeApp();

  // Start running our app
  runApp(
    const _App(),
  );
}

/// The main app in the application
class _App extends StatelessWidget {
  /// Constructor
  const _App();

  /// Builds our widget
  @override
  Widget build(BuildContext context) {
    // Setup the models and services used throughout the app
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => EmployerService(),
        ),
        ChangeNotifierProvider(
          create: (_) => FormModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => HistoryService(),
        ),
        ChangeNotifierProvider(
          create: (_) => InviteService(),
        ),
        ChangeNotifierProvider(
          create: (_) => JobService(),
        ),
        ChangeNotifierProvider(
          create: (_) => LocationService(),
        ),
        ChangeNotifierProvider(
          create: (_) => RatingService(),
        ),
        ChangeNotifierProvider(
          create: (_) => ReportService(),
        ),
        ChangeNotifierProvider(
          create: (_) => SettingsModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserService(),
        ),
        ChangeNotifierProvider(
          create: (_) => WorkerService(),
        ),
      ],
      // Listen for changes to settings, allowing the theme to change throughout
      // the app
      child: Consumer<SettingsModel>(
        builder: (_, model, __) {
          return MaterialApp(
            // Hide the debug banner
            debugShowCheckedModeBanner: false,
            // Start our app at the splash page
            initialRoute: RouteManager.splashPage,
            // Generate the routes for our pages
            onGenerateRoute: RouteManager.generateRoute,
            // Use the appropriate theme based on the shared preferences
            theme: model.darkTheme ? darkTheme : lightTheme,
          );
        },
      ),
    );
  }
}

/// Helps with connecting to the web api hosted locally
class CustomHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
