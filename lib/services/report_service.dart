import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/domain_constants.dart';
import 'package:help_for_hire_flutter_app/models/report_model.dart';
import 'package:http/http.dart';

class ReportService with ChangeNotifier {
  /// For use in the report page
  ///
  /// Holds the selected report type
  String _selectedReportType = 'Report Type';

  /// If a duplicate report is found then this will become true
  bool isDuplicate = false;

  /// Route in the web api to reach the report controller
  static const _controllerRoute = '/api/report/';

  ReportService();

  String get selectedReportType => _selectedReportType;

  set selectedReportType(
    String selectedReportType,
  ) {
    _selectedReportType = selectedReportType;

    notifyListeners();
  }

  /// Sets the report type back to its default value
  ///
  /// Useful when the user navigates between pages. Prevents the old value
  /// from being stored between different instances of a page
  void defaultReportType() {
    _selectedReportType = 'Report Type';
  }

  /// Creates a new report
  Future<void> postReport({
    required ReportModel report,
  }) async {
    // Reset to false to make sure that previous calls do not break the code
    isDuplicate = false;

    final response = await post(
      Uri.parse(
        'https://${DomainConstants.ip}:5001$_controllerRoute',
      ),
      body: jsonEncode(report),
      headers: {
        'Accept': 'application/json',
        'content-type': 'application/json',
      },
    );

    // Indicates that a duplicate report was found
    if (response.statusCode == HttpStatus.badRequest) {
      isDuplicate = true;
    }

    notifyListeners();
  }
}
