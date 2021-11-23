import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/widgets/user_list_card_widget.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/services/worker_service.dart';
import 'package:provider/provider.dart';
import 'package:help_for_hire_flutter_app/widgets/custom_dropdown_button.dart';

class ProfileDiscoveryPage extends StatelessWidget {

  const ProfileDiscoveryPage({Key? key})
      : super(key: key); //will add const again

  @override
  Widget build(BuildContext context) {

    context.read<WorkerService>().getWorkers();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Enter name to search'),
              style: TextStyle(fontSize: 20),
            ),
            Row(
              children: [
                CustomDropdownButton(
                  initialVal: 'Gender',
                  allVal: <String>[
                    'Male',
                    'Female',
                    'Gender',//no gender constraints
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                CustomDropdownButton(
                  initialVal: 'Province',
                  allVal: <String>[
                    'Province',//no province constraints
                    'Free State',
                    'Limpopo',
                    'Gauteng',
                    'Western Cape'
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                CustomDropdownButton(
                  initialVal: 'Rating',
                  allVal: <String>[
                    'Rating',//no rating constraints
                    '1',
                    '2',
                    '3',
                    '4',
                    '5',
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Search'),
                ),
              ],
            ),
            Consumer<WorkerService>(builder: (context, value, child) {
              return SizedBox(
                height: 500,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.workers.length,
                  itemBuilder: (context, index) {
                    return WorkerCard(worker: value.workers[index]);
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
