import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/services/job_service.dart';
import 'package:provider/provider.dart';

class TestPage extends StatelessWidget {
  const TestPage();

  @override
  Widget build(BuildContext context) {
    context.read<JobService>().getJobs();
    return const Scaffold();
  }
}
