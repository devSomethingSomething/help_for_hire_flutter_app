// Warning, these kinds of classes might become a service to more cleanly
// separate the logic

// import 'package:flutter/material.dart';
// import 'package:help_for_hire_flutter_app/models/worker.dart';
// import 'package:help_for_hire_flutter_app/models/user.dart';
// import 'package:help_for_hire_flutter_app/models/employer.dart';

// class UserData with ChangeNotifier {
//   var _workerList = List<Worker>.empty(growable: true);
//   /*static var employer = Employer(
//     ID: 1,
//     user: User(
//       name: 'one',
//       phoneNumber: '11111',
//       surname: 'first',
//       userId: '111111',
//     ),
//   );*/
//   String _skillToSearch = '';

//   List<Worker> get workerList => _workerList;
//   String get skillToSearch => _skillToSearch;

//   set skillToSearch(String value) {
//     _skillToSearch = value;
//   }

//   void fetchInfo() {
//     //dummy data for testing
//     _workerList.add(
//       Worker(
//         description: '1',
//         fullTime: true,
//         minimumFee: 1,
//         partTime: false,
//         workerId: 1,
//         user: User(
//           name: 'one',
//           phoneNumber: '11111',
//           surname: 'first',
//           userId: '111111',
//         ),
//       ),
//     );
//     print('one added');
//     _workerList.add(
//       Worker(
//         description: '2',
//         fullTime: false,
//         minimumFee: 2,
//         partTime: true,
//         workerId: 2,
//         user: User(
//           name: 'two',
//           phoneNumber: '22222',
//           surname: 'second',
//           userId: '222222',
//         ),
//       ),
//     );
//   }
// }
