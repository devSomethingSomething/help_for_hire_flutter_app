import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';

class AccountTypeCardWidget extends StatelessWidget {
  final void Function() _onTap;

  final IconData _leadingIcon;

  final String _headingText;

  final String _descriptionText;

  final String _detailsHeadingText;

  final String _detailsDescriptionText;

  const AccountTypeCardWidget({
    required void Function() onTap,
    required IconData leadingIcon,
    required String headingText,
    required String descriptionText,
    required String detailsHeadingText,
    required String detailsDescriptionText,
  })  : _onTap = onTap,
        _leadingIcon = leadingIcon,
        _headingText = headingText,
        _descriptionText = descriptionText,
        _detailsHeadingText = detailsHeadingText,
        _detailsDescriptionText = detailsDescriptionText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Padding(
          child: Row(
            children: [
              Icon(
                _leadingIcon,
                color: Colors.blue[900],
                size: 64.0,
              ),
              const SizedBox(
                width: 16.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _headingText,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SmallSpacerWidget(),
                  Text(
                    _descriptionText,
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                icon: Icon(
                  Icons.info_outline_rounded,
                  color: Colors.blue[900],
                  size: 32.0,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        actions: [
                          TextButton(
                            child: const Text(
                              'CLOSE',
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                        content: Text(
                          _detailsDescriptionText,
                        ),
                        title: Text(
                          _detailsHeadingText,
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
          padding: const EdgeInsets.all(
            16.0,
          ),
        ),
        elevation: 4.0,
      ),
      onTap: _onTap,
    );
  }
}
