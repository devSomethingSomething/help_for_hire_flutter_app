import 'dart:io';

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/models/form_model.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/services/employer_service.dart';
import 'package:help_for_hire_flutter_app/services/job_service.dart';
import 'package:help_for_hire_flutter_app/services/location_service.dart';
import 'package:provider/provider.dart';

void main() {
  HttpOverrides.global = CustomHttpOverrides();

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
          create: (_) => FormModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => LocationService(),
        ),
        ChangeNotifierProvider(
          create: (_) => JobService(),
        ),
        ChangeNotifierProvider(
          create: (_) => EmployerService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteManager.testPage,
        onGenerateRoute: RouteManager.generateRoute,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: ColorConstants.blue,
            secondary: ColorConstants.blue,
          ),
          unselectedWidgetColor: Colors.white,
        ),
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
