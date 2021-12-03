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
import 'package:help_for_hire_flutter_app/helpers/check_box_helper.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = CustomHttpOverrides();

  await Firebase.initializeApp();

  runApp(
    const _App(),
  );
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CheckBoxHelper(),
        ),
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
      child: Consumer<SettingsModel>(
        builder: (_, model, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: RouteManager.splashPage,
            onGenerateRoute: RouteManager.generateRoute,
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
