import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/widgets/text_container_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';

class EmployerInfoPage extends StatelessWidget {
  const EmployerInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(data: 'Employer Info'),
      body: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: MediaQuery.of(context).size.width <
                      MediaQuery.of(context).size.height
                  ? MediaQuery.of(context).size.width / 10 + 5
                  : MediaQuery.of(context).size.height / 10 + 5,
              child: Icon(
                Icons.image,
                color: Colors.white,
              ),
            ),
            TextContainerWidget(
              contents: 'Name',
            ),
            TextContainerWidget(
              contents: 'Surname',
            ),
            TextContainerWidget(
              contents: 'Phone Number',
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Report',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
