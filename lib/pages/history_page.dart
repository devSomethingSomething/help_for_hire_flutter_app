import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/services/history_service.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/flat_button_widget.dart';
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
            // Change this back to is empty
            return service.histories.isNotEmpty
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
                      // Need to extract this out so that we can dynamically
                      // create multiple tiles with the listview builder method
                      Padding(
                        padding: const EdgeInsets.all(
                          8.0,
                        ),
                        child: ListTile(
                          leading: const Icon(
                            Icons.insert_invitation,
                            size: 32.0,
                          ),
                          minVerticalPadding: 16.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ),
                          ),
                          tileColor: Colors.grey[200],
                          title: const Text(
                            'You received an invite on 2021/01/01 from John Doe',
                          ),
                          trailing: const Icon(
                            Icons.exit_to_app,
                            size: 32.0,
                          ),
                        ),
                      ),
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
