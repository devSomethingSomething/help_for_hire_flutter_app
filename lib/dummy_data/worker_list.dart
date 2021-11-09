import 'package:help_for_hire_flutter_app/models/user.dart';
import 'package:help_for_hire_flutter_app/models/worker.dart';

class workerData{
  List<Worker> _workers=[];

  List<Worker> get workers => _workers;

  updateWorkersList() {
    List<Worker> value=[];
    value.add(
      Worker(
        description: '1',
        fullTime: true,
        minimumFee: 1,
        partTime: false,
        workerId: 1,
        user: User(
          name: 'one',
          phoneNumber: '11111',
          surname: 'first',
          userId: '111111',
        ),
      ),
    );
    value.add(
        Worker(
          description: '2',
          fullTime: false,
          minimumFee: 2,
          partTime: true,
          workerId: 2,
          user: User(
            name: 'two',
            phoneNumber: '22222',
            surname: 'second',
            userId: '222222',
          ),
        ),
    );

    _workers = value;
  }
}
