// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/dropdown_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text/heading_text_widget.dart';
import 'package:help_for_hire_flutter_app/constants/image_constants.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:help_for_hire_flutter_app/services/report_service.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  TextEditingController descriptionController=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('Report'),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 24.0,
              ),
              onPressed: () => Navigator.pop(context),
              padding: EdgeInsets.zero,
            ),
            backgroundColor: ColorConstants.blue,
          ),
          body: ListView(children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HeadingTextWidget(
                    data: 'Report',
                  ), Text(
                    'REPORTED USER',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30,),
                  Center(child:Image.asset(ImageConstants.bad,height: 180,width: 180,),),

                  //want to retrieve reported account details
                  Column(children:[


                  Padding(
                    padding: EdgeInsets.only(
                        left: 30, right: 30,  bottom: 10),
                    child: Column(
                      children: [
                        TextRow('Name ', 'name surname'),
                        SizedBox(
                          height: 5,
                        ),
                        TextRow('Job     ', 'job'),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),]),
                  SizedBox(height: 30,),
                  DropDownWidget(
                    hint: 'Select Reason',
                    items: dropdownItems,
                    paddingbottom: 20,
                    paddingLeft: 10,
                    paddingRight: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,bottom: 50,),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Description',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.lightBlueAccent, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.lightBlueAccent, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                          controller: descriptionController,
                          maxLines: 5,
                        ),
                      ],
                    ),
                  ),
                  RoundedButtonWidget(
                    data: 'Report User',
                    onPressed: () {
                    },
                    invertColors: true,
                  ),
                ],
              ),
            ),
          ])),
    ));
  }

  Row TextRow(String title, String discription) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title + ': ',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          discription,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

List<String> get dropdownItems {
  List<String> menuItems = [
    'Inappropriate Behaviour',
    'Unethical Actions',
    'Fraud',
    'Abusive',
    'Violation Of Contract',
    'theft',
    'Violence',
  ];
  return menuItems;
}
