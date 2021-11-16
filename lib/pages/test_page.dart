import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/models/employer_model.dart';
import 'package:help_for_hire_flutter_app/models/user_model.dart';
import 'package:help_for_hire_flutter_app/services/employer_service.dart';
import 'package:provider/provider.dart';

class TestPage extends StatelessWidget {
  const TestPage();

  @override
  Widget build(BuildContext context) {
    context.read<EmployerService>().putEmployer(
          id: '2222222222222',
          employer: EmployerModel(
            user: UserModel(
              userId: '2222222222222',
              name: 'John',
              surname: 'Jones',
              phoneNumber: '2222222222',
              locationId: 'ilySl6HTh1mPgI6Chzbn',
            ),
          ),
        );
    return const Scaffold();
  }
}
