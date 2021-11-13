import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/models/form_model.dart';
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
          create: (_) => FormModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteManager.signInPage,
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
