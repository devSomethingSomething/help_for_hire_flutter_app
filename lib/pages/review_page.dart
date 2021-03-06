/// Imports
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/helpers/delay_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/info_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/snack_bar_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/validation_helper.dart';
import 'package:help_for_hire_flutter_app/models/rating_model.dart';
import 'package:help_for_hire_flutter_app/services/rating_service.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/services/worker_service.dart';
import 'package:help_for_hire_flutter_app/widgets/rating_bars/star_rating_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/large_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_form_fields/text_form_field_widget.dart';
import 'package:provider/provider.dart';

/// Handles users reviewing each other
class ReviewPage extends StatefulWidget {
  /// Constructor
  const ReviewPage();

  /// Creates the state for this page
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

/// The state class for this page
class _ReviewPageState extends State<ReviewPage> {
  /// The key used for form validation
  final _key = GlobalKey<FormState>();

  /// Controllers
  final _descriptionController = TextEditingController();

  /// The rating value selected during the review
  var _value = 1;

  /// Cleans up any unused objects or resources
  @override
  void dispose() {
    _descriptionController.dispose();

    super.dispose();
  }

  void _onPressed() async {
    // Make sure form is valid
    ValidationHelper.validateForm(
      context: context,
      // Make sure that there is a connection
      function: () => ValidationHelper.checkConnection(
        context: context,
        function: () async {
          DelayHelper.showLoadingIndicator(context: context);

          await context.read<RatingService>().postRating(
                rating: RatingModel(
                  ratingId: '',
                  value: _value,
                  description: _descriptionController.text,
                  // This means that only employers can rate workers
                  // This might change in the future
                  // However, according to our initial specs, this is how we
                  // planned it
                  employerId: context.read<UserService>().currentUser.userId,
                  // employerId: '1234554321127',
                  // Depends on how we get the value
                  // Will probably just read from the worker service to get
                  // the id
                  // workerId: '7777711111222',
                  workerId: context.read<WorkerService>().worker?.userId ?? '',
                ),
              );

          // Prevent duplicates from being posted
          if (!context.read<RatingService>().isDuplicate) {
            DelayHelper.hideLoadingIndicator(context: context);

            Navigator.pop(context);

            SnackBarHelper.showSnackBar(
              context: context,
              data: 'Review posted',
            );
          } else {
            DelayHelper.hideLoadingIndicator(context: context);

            SnackBarHelper.showSnackBar(
              context: context,
              data: 'Cannot review the same user twice',
            );
          }
        },
      ),
      key: _key,
    );
  }

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.info_outline_rounded,
            ),
            // Show an info box with details on the current page
            onPressed: () => InfoHelper.showInfoDialog(
              context: context,
              content: 'This page allows you to review the selected account',
              title: 'Review Details',
            ),
          ),
        ],
        backgroundColor: ColorConstants.darkBlue,
        foregroundColor: Colors.white,
        title: const Text(
          'Review',
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Form(
                child: Column(
                  children: [
                    const Icon(
                      Icons.reviews_rounded,
                      color: Colors.black,
                      size: 128.0,
                    ),
                    const SmallSpacerWidget(),
                    const Text(
                      'Review Selected User',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const LargeSpacerWidget(),
                    Card(
                      child: Padding(
                        child: Column(
                          children: [
                            const Text(
                              'Please select a rating',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const MediumSpacerWidget(),
                            StarRatingWidget(
                              numberOfStars: 5,
                              onTap: (value) {
                                _value = value;
                              },
                            ),
                            const MediumSpacerWidget(),
                            const Text(
                              'Please write a short review',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SmallSpacerWidget(),
                            TextFormFieldWidget(
                              controller: _descriptionController,
                              icon: Icons.text_fields_rounded,
                              keyboardType: TextInputType.text,
                              labelText: 'Description',
                              lightMode: true,
                              maxLength: 256,
                              maxLines: 3,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 16.0,
                        ),
                      ),
                      color: Colors.white,
                      elevation: 2,
                      shadowColor: Colors.black,
                    ),
                    const LargeSpacerWidget(),
                    RoundedButtonWidget(
                      data: 'SUBMIT',
                      onPressed: _onPressed,
                      invertColors: true,
                    ),
                  ],
                ),
                key: _key,
              ),
            ),
            padding: const EdgeInsets.all(
              16.0,
            ),
          ),
        ],
      ),
    );
  }
}
