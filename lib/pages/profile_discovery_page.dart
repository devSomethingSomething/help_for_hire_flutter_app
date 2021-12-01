import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/helpers/delay_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/validation_helper.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/widgets/drawers/drawer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/services/worker_service.dart';
import 'package:provider/provider.dart';

class ProfileDiscoveryPage extends StatelessWidget {
  const ProfileDiscoveryPage();

  @override
  Widget build(BuildContext context) {
    // Read in the background, the list is listening for changes and will update
    context.read<WorkerService>().getWorkersInCity(
          // Add this line back later to get the workers based on the correct
          // user location
          // locationId: context.read<UserService>().currentUser.locationId,
          // For testing, gets all the workers in Bloemfontein
          locationId: 'Obj3eS6Dx2K7ZiNXraGX',
        );

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh,
            ),
            onPressed: () {
              // Check the connection first to prevent infinite loading
              // Also prevents the list of workers from being deleted, meaning
              // that the user can still look at what has already loaded
              ValidationHelper.checkConnection(
                context: context,
                function: () async {
                  // Since this is an action that the user takes, they expect some
                  // kind of feedback to see that they have done something
                  // Here it is better to display a loading indicator, the call to
                  // the service above does it in the background, but this one is
                  // triggered by the user
                  DelayHelper.showLoadingIndicator(context: context);

                  await context.read<WorkerService>().getWorkersInCity(
                        // Add this line back later to get the workers based on the correct
                        // user location
                        // locationId: context.read<UserService>().currentUser.locationId,
                        // For testing, gets all the workers in Bloemfontein
                        locationId: 'Obj3eS6Dx2K7ZiNXraGX',
                      );

                  DelayHelper.hideLoadingIndicator(context: context);
                },
              );
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
                                size: 48.0,
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
                                  // Set the selected worker in worker service
                                  // This call is important later on for things
                                  // like invites or reports
                                  context.read<WorkerService>().worker =
                                      service.workers[index];

                                  // Navigate to the selected profile page
                                  // Also allows the user to return to this page
                                  // without having to scroll through the whole
                                  // list again, keeps the place
                                  Navigator.pushNamed(
                                    context,
                                    RouteManager.selectedWorkerProfilePage,
                                  );
                                },
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 16.0,
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
