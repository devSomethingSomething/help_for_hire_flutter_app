import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/models/worker.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';

class WorkerCard extends StatefulWidget {
  final Worker worker;

  const WorkerCard({Key? key, required this.worker}) : super(key: key);

  @override
  _WorkerCardState createState() => _WorkerCardState();
}

class _WorkerCardState extends State<WorkerCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40),
      child: InkWell(
        onTap: (){Navigator.pushNamed(context, RouteManager.workerInfoPage);},
        splashColor: Colors.black,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            boxShadow: [BoxShadow(color: Colors.black)],
          ),
          child: Row(
            children: [
              Icon(
                Icons.image,
                size: 50,
              ),
              Text(
                widget.worker.name,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(width: 10,),
              Text(
                'rating',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
