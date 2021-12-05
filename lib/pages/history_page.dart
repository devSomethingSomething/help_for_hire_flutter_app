import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/helpers/snack_bar_helper.dart';
import 'package:help_for_hire_flutter_app/services/history_service.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/widgets/cards/history_card_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/drawers/drawer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/gradients/white_gradient_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/placeholders/empty_placeholder_widget.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage();

  @override
  Widget build(BuildContext context) {
    context.read<HistoryService>().getHistoryByUser(
          id: context.read<UserService>().currentUser.userId,
        );
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh,
              size: 28.0,
            ),
            onPressed: () => context.read<HistoryService>().getHistoryByUser(
                  id: context.read<UserService>().currentUser.userId,
                ),
            splashRadius: 28.0,
          ),
          IconButton(
            icon: const Icon(
              Icons.delete_forever,
              size: 28.0,
            ),
            onPressed: () {
              // Should have a popup which asks if the user wants to clear their
              // history
              // The popup should call a method
              // context.read<HistoryService>().deleteAllUserHistory(id: id);
              // This method needs to be added to the history service and to
              // the history controller in the web api
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    actions: [
                      TextButton(
                        child: const Text(
                          'No',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      TextButton(
                        child: const Text(
                          'Yes',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          if (context
                              .read<HistoryService>()
                              .histories
                              .isNotEmpty) {
                            context
                                .read<HistoryService>()
                                .deleteAllHistoryForUser(
                                  userId: context
                                      .read<UserService>()
                                      .currentUser
                                      .userId,
                                );
                          } else {
                            SnackBarHelper.showSnackBar(
                              context: context,
                              data: 'No history to delete',
                            );
                          }

                          Navigator.pop(context);
                        },
                      ),
                    ],
                    content: const Text(
                      'This will permanently delete your history with Help for Hire',
                    ),
                    title: const Text(
                      'Delete History',
                    ),
                  );
                },
              );
            },
            splashRadius: 28.0,
          ),
        ],
        backgroundColor: Colors.blue[900],
        title: const Text(
          'History',
        ),
      ),
      body: Stack(
        children: [
          const WhiteGradientWidget(),
          Center(
            child: Consumer<HistoryService>(
              builder: (_, service, __) {
                return service.histories.isEmpty
                    ? const EmptyPlaceholderWidget(
                        data: 'No history to display',
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(
                          8.0,
                        ),
                        itemCount: service.histories.length,
                        itemBuilder: (_, index) {
                          return HistoryCard(
                            history: service.histories[index],
                          );
                        },
                      );
              },
            ),
          ),
        ],
      ),
      drawer: const DrawerWidget(),
      drawerEnableOpenDragGesture: false,
    );
  }
}
