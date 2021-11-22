class InviteModel {
  int inviteId;
  String status;
  // Worker worker;
  // Employer employer;

  InviteModel({
    required this.inviteId,
    required this.status,
    //required this.worker,
    //required this.employer,
  });

  InviteModel.fromJson({
    required Map<String, dynamic> json,
  })  : inviteId = json['inviteId'],
        status = json['status']
  //worker = json['status'],
  //employer = json['employer']
  ;

  Map<String, dynamic> toJson() => {
        'inviteId': inviteId,
        'status': status,
        //'worker':worker,
        //'employer':employer,
      };
}
