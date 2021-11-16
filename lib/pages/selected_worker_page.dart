import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/models/worker.dart';

class WorkerProfile extends StatelessWidget {
  final Worker worker;
  const WorkerProfile({Key? key, required this.worker}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Icon(
                Icons.account_circle,
                size: 150,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '${worker.name} ${worker.surname}',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 150,child: ElevatedButton(onPressed: (){}, child: Text('rate user'))),
                    SizedBox(width: 150,child: ElevatedButton(onPressed: (){}, child: Text('report user'))),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '${worker.description} ',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'minimum fee: ${worker.minimumFee}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  worker.fullTime ? Text('fulltime') : Container(),
                  worker.partTime ? Text('partTime') : Container(),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'and so on...',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(width: 150,child: ElevatedButton(onPressed: (){}, child: Text('view this users History'))),
            ],
          ),
        ));
  }
}
