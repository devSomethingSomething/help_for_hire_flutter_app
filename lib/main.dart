import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:help_for_hire_flutter_app/models/user_data.dart';

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
          create: (context) => UserData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteManager.listOfWorkers,
        onGenerateRoute: RouteManager.generateRoute,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.teal,
            secondary: Colors.teal,
          ),
          unselectedWidgetColor: Colors.white,
        ),
      ),
    );
  }
}
