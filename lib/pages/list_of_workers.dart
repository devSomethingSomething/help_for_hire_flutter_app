import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/widgets/user_list_card_widget.dart';
import 'package:help_for_hire_flutter_app/models/user_data.dart';
import 'package:provider/provider.dart';
import 'package:help_for_hire_flutter_app/widgets/custom_dropdown_button.dart';

class ListOfWorkers extends StatelessWidget {
  const ListOfWorkers({Key? key}) : super(key: key); //will add const again

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => UserData(),
        builder: (context, child) {
          context.read<UserData>().fetchInfo();
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
                      /*child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Filter:'),
                              Text('name'),
                              *//*TextField(
                                decoration: InputDecoration(
                                  hintText: 'enter name to search'),
                                style: TextStyle(fontSize: 20),
                              ),*//*
                            ],
                          ),
                          Row(
                            children: [
                              CustomDropdownButton(
                                  initialVal: 'none',
                                  allVal: <String>['Male', 'Female', 'none']),
                              CustomDropdownButton(
                                  initialVal: 'all',
                                  allVal: <String>[
                                    'all',
                                    'free state',
                                    'limpopo',
                                    'gauteng',
                                    'western cape'
                                  ]),
                              CustomDropdownButton(
                                  initialVal: 0,
                                  allVal: <int>[0, 1, 2, 3, 4, 5]),
                            ],
                          ),
                        ],
                      ),*/
                    ),
                  ),
                ),
                Consumer<UserData>(builder: (context, value, child) {
                  return  ListView.builder(
                          itemCount: value.workerList.length,
                          itemBuilder: (context, index){
                            return WorkerCard(worker: value.workerList[index]);
                          },
                          shrinkWrap: true,

                        );
                }),
              ],
            ),
          );
        });
  }
}
/*
value.workerList.length == 0
? Center(child: CircularProgressIndicator())
: Text(
'${value.workerList[0].name}');*/
