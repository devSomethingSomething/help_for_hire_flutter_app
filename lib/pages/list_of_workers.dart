import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/widgets/user_list_card_widget.dart';
import 'package:help_for_hire_flutter_app/models/worker.dart';
import 'package:help_for_hire_flutter_app/dummy_data/worker_list.dart';

class ListOfWorkers extends StatelessWidget {

  final workers;//dummy data

  ListOfWorkers({Key? key}) : super(key: key);//will add const again

  @override
  Widget build(BuildContext context) {
    context.read<workerData>().updateInformation;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: SizedBox(
              height: 30,
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Filter:'),
                    Icon(Icons.arrow_downward_rounded),
                  ],
                ),
              ),
            ),
          ),

          ListView.builder(
            itemCount: workers.length,
            itemBuilder: (context, index){
              return WorkerCard(worker: workers[index]);
            },
            shrinkWrap: true,

          ),
        ],
      ),
    );
  }
}
