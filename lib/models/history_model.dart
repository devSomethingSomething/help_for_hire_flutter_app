class HistoryModel {
  /// History Model variables
  String historyId;
  String description;
  String userId;

  /// History Model constructor with the required fields of the model variables
  HistoryModel({
    required this.historyId,
    required this.description,
    required this.userId,
  });

  /// This constructor initializes the History Model variables
  HistoryModel.fromJson({
    required Map<String, dynamic> json,
  })  : historyId = json['historyId'],
        description = json['description'],
        userId = json['userId'];

  /// This method will convert the model data back into a map
  Map<String, dynamic> toJson() => {
        'historyId': historyId,
        'description': description,
        'userId': userId,
      };
}
