class InviteModel {
  /// Invite Model variables
  String inviteId;
  String status;
  String employerId;
  String workerId;

  /// Invite Model constructor with the required fields of the model variables
  InviteModel({
    required this.inviteId,
    required this.status,
    required this.employerId,
    required this.workerId,
  });

  /// This constructor initializes the Invite Model variables
  InviteModel.fromJson({
    required Map<String, dynamic> json,
  })  : inviteId = json['inviteId'],
        status = json['status'],
        employerId = json['employerId'],
        workerId = json['workerId'];

  /// This method will convert the model data back into a map
  Map<String, dynamic> toJson() => {
        'inviteId': inviteId,
        'status': status,
        'employerId': employerId,
        'workerId': workerId,
      };
}
