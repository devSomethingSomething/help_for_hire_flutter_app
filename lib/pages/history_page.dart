import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/services/history_service.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage();

  @override
  Widget build(BuildContext context) {
    // Get history for user
    context.read<HistoryService>().getHistoryByUser(
          // Update to current user
          id: '0002245275082',
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
                  // Update to current user
                  id: '0002245275082',
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
            },
            splashRadius: 28.0,
          ),
        ],
        backgroundColor: Colors.blue[900],
        title: const Text(
          'History',
        ),
      ),
      body: Center(
        child: Consumer<HistoryService>(
          builder: (_, service, __) {
            return service.histories.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.warning,
                        color: Colors.grey,
                        size: 128.0,
                      ),
                      SmallSpacerWidget(),
                      Text(
                        'No history to display',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SmallSpacerWidget(),
                      Text(
                        'Possible causes\n'
                        '\u2022 No internet connection\n'
                        '\u2022 Slow network speed\n'
                        '\u2022 No in app activity',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                : ListView(
                    children: [
                      Card(
                        color: Colors.grey[100],
                        child: Row(
                          children: const [
                            // Continue here
                            // Need cards for history
                            // Should be able to have an icon,
                            // some text as a description,
                            // Perhaps some kind of button if relevant
                            // Such as for viewing a specific profile
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            8.0,
                          ),
                        ),
                      )
                    ],
                  );
          },
        ),
      ),
      drawer: const Drawer(),
      drawerEnableOpenDragGesture: false,
    );
  }
}
