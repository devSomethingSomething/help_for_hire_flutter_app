class InviteModel {
  String inviteId;
  String status;
  String employerId;
  String workerId;

  InviteModel({
    required this.inviteId,
    required this.status,
    required this.employerId,
    required this.workerId,
  });

  InviteModel.fromJson({
    required Map<String, dynamic> json,
  })  : inviteId = json['inviteId'],
        status = json['status'],
        employerId = json['employerId'],
        workerId = json['workerId'];

  Map<String, dynamic> toJson() => {
        'inviteId': inviteId,
        'status': status,
        'employerId': employerId,
        'workerId': workerId,
      };
}
