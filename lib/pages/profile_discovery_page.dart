import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/services/worker_service.dart';
import 'package:provider/provider.dart';

class ProfileDiscoveryPage extends StatelessWidget {
  const ProfileDiscoveryPage();

  @override
  Widget build(BuildContext context) {
    context.read<WorkerService>().getWorkersInCity(
          locationId: context.read<UserService>().currentUser.locationId,
        );
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh,
              size: 28.0,
            ),
            onPressed: () {
              context.read<WorkerService>().getWorkersInCity(
                    locationId:
                        context.read<UserService>().currentUser.locationId,
                  );
            },
            splashRadius: 28.0,
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
                        'No profiles to display',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
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
                  )
                : ListView.builder(
                    itemCount: service.workers.length,
                    itemBuilder: (_, index) {
                      return Card(
                        color: Colors.grey[100],
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 16.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Placeholder(
                                color: Colors.black,
                                fallbackHeight: 56.0,
                                fallbackWidth: 56.0,
                              ),
                              Column(
                                children: [
                                  Text(
                                    '${service.workers[index].name} ${service.workers[index].surname}',
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Minimum Fee: R${service.workers[index].minimumFee}',
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ],
                              ),
                              // Needs to be dynamic
                              Row(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 20.0,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 20.0,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 20.0,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 20.0,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20.0,
                                  ),
                                ],
                              ),
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
                                iconSize: 28.0,
                              ),
                            ],
                          ),
                        ),
                        elevation: 4.0,
                      );
                    },
                  );
          },
        ),
      ),
      drawer: const Drawer(),
      drawerEnableOpenDragGesture: false,
    );
  }
}
