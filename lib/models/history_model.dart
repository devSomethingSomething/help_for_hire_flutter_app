class HistoryModel {
  String historyId;
  String description;
  String userId;

  HistoryModel({
    required this.historyId,
    required this.description,
    required this.userId,
  });

  HistoryModel.fromJson({
    required Map<String, dynamic> json,
  })  : historyId = json['historyId'],
        description = json['description'],
        userId = json['userId'];

  Map<String, dynamic> toJson() => {
        'historyId': historyId,
        'description': description,
        'userId': userId,
      };
}
