import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/widgets/user_list_card_widget.dart';
import 'package:help_for_hire_flutter_app/models/user_data.dart';
import 'package:provider/provider.dart';
import 'package:help_for_hire_flutter_app/widgets/custom_dropdown_button.dart';

class ListOfWorkers extends StatelessWidget {
  const ListOfWorkers({Key? key}) : super(key: key); //will add const again

  @override
  Widget build(BuildContext context) {
    print('build again');
    context.read<UserData>().fetchInfo();
    return Scaffold(
      appBar: AppBar(),
      body:
      Padding(
        padding: EdgeInsets.only(top: 10,left:10,right: 10 ),
        child:  Column(
          children: [
            TextField(
              decoration:
              InputDecoration(hintText: 'enter name to search'),
              style: TextStyle(fontSize: 20),
            ),
            Row(
              children: [


                CustomDropdownButton(
                    initialVal: 'gender',
                    allVal: <String>['Male', 'Female', 'gender']),
                SizedBox(width: 20,),
                CustomDropdownButton(initialVal: 'province', allVal: <String>[
                  'province',
                  'free state',
                  'limpopo',
                  'gauteng',
                  'western cape'
                ]),
                SizedBox(width: 20,),
                CustomDropdownButton(
                    initialVal: 'rating', allVal: <String>['rating', '1', '2', '3', '4', '5']),
                SizedBox(width: 15,),
                ElevatedButton(onPressed: (){}, child: Text('search'),),
              ],
            ),
            Consumer<UserData>(builder: (context, value, child) {
              return
                SizedBox(height: 500,child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.workerList.length,
                  itemBuilder: (context, index) {
                    return WorkerCard(worker: value.workerList[index]);
                  },
                ),)
              ;
            }),
          ],
        ),
      ),



    );
  }
}