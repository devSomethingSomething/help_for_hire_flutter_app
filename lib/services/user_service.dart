
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/models/employer_model.dart';
import 'package:help_for_hire_flutter_app/models/user_model.dart';
import 'package:help_for_hire_flutter_app/services/employer_service.dart';
import 'package:provider/provider.dart';

class UserService with ChangeNotifier {
  UserModel currentUser = UserModel(
    userId: '',
    name: '',
    surname: '',
    phoneNumber: '',
    locationId: '',
  );

  UserService();

  // This method will need work as the services are completed
  // Will handle the registration of the new user
  void registerUser({
    required BuildContext context,
  }) {
    if (currentUser is EmployerModel) {
      context.read<EmployerService>().postEmployer(
            employer: currentUser as EmployerModel,
          );
    } else {
      // Needs to be done once the worker model and service are complete
      // if (currentUser is WorkerModel) {
      // context.read<WorkerService>().postWorker(
      // worker: currentUser as WorkerModel,
      // );
    }
  }
}
