class ReportModel {
  /// Report Model variables
  String reportId;
  String reportType;
  String description;
  String reportedUserId;
  String reporterUserId;

  /// Report Model constructor with the required fields of the model variables
  ReportModel({
    required this.reportId,
    required this.reportType,
    required this.description,
    required this.reportedUserId,
    required this.reporterUserId,
  });

  /// This constructor initializes the Report Model variables
  ReportModel.fromJson({
    required Map<String, dynamic> json,
  })  : reportId = json['reportId'],
        reportType = json['reportType'],
        description = json['description'],
        reportedUserId = json['reportedUserId'],
        reporterUserId = json['reporterUserId'];

  /// This method will convert the model data back into a map
  Map<String, dynamic> toJson() => {
        'reportId': reportId,
        'reportType': reportType,
        'description': description,
        'reportedUserId': reportedUserId,
        'reporterUserId': reporterUserId,
      };
}
