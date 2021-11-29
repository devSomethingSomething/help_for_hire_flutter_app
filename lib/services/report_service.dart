import 'package:flutter/material.dart';

class ReportService with ChangeNotifier {
  /// For use in the report page
  ///
  /// Holds the selected report type
  String _selectedReportType = 'Report Type';

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
}
