import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/pages/theme_data.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:provider/provider.dart';

void main() {
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
          create: (context) => ThemeSettings(),
        ),
      ],
      child: Consumer<ThemeSettings>(
        builder: (context, value, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: RouteManager.splashPage,
              onGenerateRoute: RouteManager.generateRoute,
              theme: value.darkTheme ? darkTheme : lightTheme);
        },
      ),
    );
  }
}
