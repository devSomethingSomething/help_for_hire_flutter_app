import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/widgets/text_container_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bar_widget.dart';

class WorkerInfoPage extends StatelessWidget {
  const WorkerInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Worker Info'),
      body: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: MediaQuery.of(context).size.width <
                MediaQuery.of(context).size.height
                ? MediaQuery.of(context).size.width / 10 + 5
                : MediaQuery.of(context).size.height / 10 + 5,
            child: Icon(Icons.image,color: Colors.white,),
          ),
          TextContainerWidget(contents: 'name'),
          TextContainerWidget(contents: 'surname'),
          TextContainerWidget(contents: 'rating'),
          TextContainerWidget(contents: 'phone number'),
          TextContainerWidget(contents: 'min fee'),
          TextContainerWidget(contents: 'full time / part time'),
          TextContainerWidget(contents: 'discription'),

          ElevatedButton(onPressed: (){}, child:Text('Report')),
        ],
      ),),
    );
  }
}
