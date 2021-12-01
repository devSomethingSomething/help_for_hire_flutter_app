import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/widgets/drawers/drawer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/services/worker_service.dart';
import 'package:provider/provider.dart';

class ProfileDiscoveryPage extends StatelessWidget {
  const ProfileDiscoveryPage();

  @override
  Widget build(BuildContext context) {
    // context.read<WorkerService>().getWorkersInCity(
    //       locationId: context.read<UserService>().currentUser.locationId,
    //     );
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh,
            ),
            onPressed: () {
              // Need to just recall the worker service method to get the
              // workers again
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.filter_alt,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.sort,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.blue[900],
        title: const Text(
          'Profile Discovery',
        ),
      ),
      body: Center(
        child: Consumer<WorkerService>(
          builder: (_, service, __) {
            return service.workers.isEmpty
                ? const _ProfileDiscoveryPagePlaceholderWidget()
                : ListView.builder(
                    itemCount: service.workers.length,
                    itemBuilder: (_, index) {
                      return Card(
                        child: Padding(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.person,
                              ),
                              Text(
                                '${service.workers[index].name} ${service.workers[index].surname}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Needs to be dynamic
                              // Needs to somehow get the average rating for
                              // each user and return that here
                              // Row(
                              //   children: _getRandomRating(),
                              // ),
                              IconButton(
                                icon: const Icon(
                                  Icons.exit_to_app,
                                ),
                                onPressed: () {
                                  // Navigate to selected profile page

                                  // Set selected worker in worker service
                                  // We have the index already which means
                                  // we do not need to do another get request

                                  // In page, read from service
                                },
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                          padding: const EdgeInsets.all(
                            8.0,
                          ),
                        ),
                        elevation: 4.0,
                      );
                    },
                  );
          },
        ),
      ),
      drawer: const DrawerWidget(),
      drawerEnableOpenDragGesture: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[900],
        child: const Icon(
          Icons.history,
        ),
        onPressed: () {},
      ),
    );
  }
}

class _ProfileDiscoveryPagePlaceholderWidget extends StatelessWidget {
  const _ProfileDiscoveryPagePlaceholderWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Icon(
          Icons.warning,
          color: Colors.grey,
          size: 128.0,
        ),
        SmallSpacerWidget(),
        Text(
          'No profiles to display',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SmallSpacerWidget(),
        Text(
          'Possible causes\n'
          '\u2022 No profiles in your area\n'
          '\u2022 No internet connection\n'
          '\u2022 Slow network speed',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20.0,
          ),
          textAlign: TextAlign.center,
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
