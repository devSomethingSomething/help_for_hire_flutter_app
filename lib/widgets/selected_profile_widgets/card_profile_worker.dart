/// Imports
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/services/worker_service.dart';
import 'package:help_for_hire_flutter_app/widgets/rating_bars/static_star_rating_widget.dart';
import 'package:provider/provider.dart';

/// Custom Card information worker
class CardInformationWorker extends StatelessWidget {
  /// Build the widget
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 200.0,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 80.0,
          ),
          child: Column(
            children: [
              /// Display the worker name and surname
              Text(
                '${context.read<WorkerService>().worker?.name} '
                '${context.read<WorkerService>().worker?.surname}',
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20.0,
                  left: 25.0,
                  right: 25.0,
                  top: 30.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    /// Display the workers minimum fee per day
                    Text(
                      'Fee: R${context.read<WorkerService>().worker?.minimumFee}/day',
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),

                    /// Displays the workers avearge rating
                    StaticStarRatingWidget(
                      averageRating:
                          context.read<WorkerService>().worker!.averageRating,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      shadowColor: Colors.black,
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
    );
  }
}
