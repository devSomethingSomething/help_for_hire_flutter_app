import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/models/employer_model.dart';
import 'package:help_for_hire_flutter_app/models/user_model.dart';
import 'package:help_for_hire_flutter_app/models/worker_model.dart';
import 'package:help_for_hire_flutter_app/services/employer_service.dart';
import 'package:help_for_hire_flutter_app/services/worker_service.dart';
import 'package:provider/provider.dart';
import 'worker_service.dart';

class UserService with ChangeNotifier {
  UserModel currentUser = UserModel(
    userId: '',
    name: '',
    surname: '',
    phoneNumber: '',
    locationId: '',
  );

  UserModel selectedUser = UserModel(
    userId: '',
    name: '',
    surname: '',
    phoneNumber: '',
    locationId: '',
  );

  bool get isEmployer => currentUser is EmployerModel;

  UserService();

  // This method will need work as the services are completed
  // Will handle the registration of the new user
  Future<void> registerUser({
    required BuildContext context,
  }) async {
    if (isEmployer) {
      await context.read<EmployerService>().postEmployer(
            employer: currentUser as EmployerModel,
          );
    } else {
      await context.read<WorkerService>().postWorker(
            worker: currentUser as WorkerModel,
          );
    }
  }

  // Loads the correct user information
  Future<void> loadUser({
    required BuildContext context,
  }) async {
    context.read<EmployerService>().employer = null;
    context.read<WorkerService>().worker = null;

    await context.read<EmployerService>().getEmployer(
          id: currentUser.userId,
        );
    await context.read<WorkerService>().getWorker(
          id: currentUser.userId,
        );

    currentUser = context.read<EmployerService>().employer != null
        ? context.read<EmployerService>().employer as EmployerModel
        : context.read<WorkerService>().worker as WorkerModel;
  }
}
