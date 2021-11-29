class ReportModel {
  String reportId;
  String reportType;
  String description;
  String reportedUserId;
  String reporterUserId;

  ReportModel({
    required this.reportId,
    required this.reportType,
    required this.description,
    required this.reportedUserId,
    required this.reporterUserId,
  });

  ReportModel.fromJson({
    required Map<String, dynamic> json,
  })  : reportId = json['reportId'],
        reportType = json['reportType'],
        description = json['description'],
        reportedUserId = json['reportedUserId'],
        reporterUserId = json['reporterUserId'];

  Map<String, dynamic> toJson() => {
        'reportId': reportId,
        'reportType': reportType,
        'description': description,
        'reportedUserId': reportedUserId,
        'reporterUserId': reporterUserId,
      };
}
