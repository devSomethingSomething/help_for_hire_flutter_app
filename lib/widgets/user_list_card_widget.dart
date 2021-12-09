/// Imports
// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/models/worker_model.dart';

/// Custom Card widget for the worker
class WorkerCard extends StatefulWidget {
  /// Variables
  final WorkerModel worker;

  /// Constructor with required fields
  const WorkerCard({
    Key? key,
    required this.worker,
  }) : super(key: key);

  @override
  _WorkerCardState createState() => _WorkerCardState();
}

class _WorkerCardState extends State<WorkerCard> {
  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {},
        splashColor: Colors.blue,
        child: Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: Row(
                children: [
                  const Icon(
                    Icons.image,
                    size: 75,
                  ),
                  Column(
                    children: [
                      Text(
                        widget.worker.name,
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Rating',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
