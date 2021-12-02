import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/helpers/delay_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/validation_helper.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/services/job_service.dart';
import 'package:help_for_hire_flutter_app/services/rating_service.dart';
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
    // context.read<WorkerService>().getWorkersInCity(
    // Add this line back later to get the workers based on the correct
    // user location
    // locationId: context.read<UserService>().currentUser.locationId,
    // For testing, gets all the workers in Bloemfontein
    // locationId: 'Obj3eS6Dx2K7ZiNXraGX',
    // );

    // This does not work quite how it should
    // Will move the method to the worker service, that way everything stays
    // up to date properly
    // context.read<RatingService>().getAverageRatingForWorker(
    //       workerId: '9876543210123',
    //     );

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
            onPressed: () {
              ValidationHelper.checkConnection(
                context: context,
                function: () async {
                  showDialog(
                    builder: (_) {
                      // Load the list of jobs
                      context.read<JobService>().getJobs();

                      var selectedJobIds = <String>[];

                      return AlertDialog(
                        actions: [
                          TextButton(
                            child: const Text(
                              'CLOSE',
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                          TextButton(
                            child: const Text(
                              'SUBMIT',
                            ),
                            onPressed: () async {
                              DelayHelper.showLoadingIndicator(
                                  context: context);

                              await context
                                  .read<WorkerService>()
                                  .getWorkersWithSkills(
                                    // This needs to be the current users id
                                    // Change this later after testing
                                    locationId: 'Obj3eS6Dx2K7ZiNXraGX',
                                    jobIds: selectedJobIds,
                                  );

                              DelayHelper.hideLoadingIndicator(
                                  context: context);

                              Navigator.pop(context);
                            },
                          ),
                        ],
                        content: Consumer<JobService>(
                          builder: (_, service, __) {
                            return service.jobs.isEmpty
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.blue[900],
                                    ),
                                  )
                                : Column(
                                    children: service.jobs.map(
                                      (job) {
                                        var selected = false;

                                        return StatefulBuilder(
                                          builder: (_, setState) {
                                            return CheckboxListTile(
                                              onChanged: (value) {
                                                setState(
                                                  () {
                                                    selected = value!;

                                                    value
                                                        ? selectedJobIds
                                                            .add(job.jobId)
                                                        : selectedJobIds
                                                            .remove(job.jobId);
                                                  },
                                                );
                                              },
                                              title: Text(
                                                job.title,
                                              ),
                                              value: selected,
                                            );
                                          },
                                        );
                                      },
                                    ).toList(),
                                    mainAxisSize: MainAxisSize.min,
                                  );
                          },
                        ),
                        title: const Text(
                          'Filter Jobs',
                        ),
                      );
                    },
                    context: context,
                  );
                },
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.sort,
            ),
            onPressed: () {
              // Will require change to worker model in order to work better
              // with ratings
              // Store a property in the app with just a starting value of 0
              // or something and just change that when the workers are
              // retrieved
              // Should be able to sort by name, surname, ratings
              // ABC or CBA, whichever order
            },
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
                              const SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                '${service.workers[index].name} ${service.workers[index].surname}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: List.generate(
                                  5,
                                  (i) {
                                    return i <
                                            service.workers[index].averageRating
                                        ? const Icon(
                                            Icons.star,
                                            color: Colors.orange,
                                          )
                                        : const Icon(
                                            Icons.star,
                                          );
                                  },
                                ),
                              ),
                              // service.averageRatingsForWorkers.length > index
                              //     ? Row(
                              //         children: List.generate(
                              //           5,
                              //           (i) {
                              //             return i <
                              //                     service.averageRatingsForWorkers[
                              //                         index]
                              //                 ? const Icon(
                              //                     Icons.star,
                              //                     color: Colors.orange,
                              //                   )
                              //                 : const Icon(
                              //                     Icons.star,
                              //                   );
                              //           },
                              //         ),
                              //       )
                              //     : Container(),
                              const SizedBox(
                                width: 8.0,
                              ),
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
      // Will get back to this later on if there is time, but it is not a
      // required feature, just something extra
      // floatingActionButton: FloatingActionButton(
      // backgroundColor: Colors.blue[900],
      // child: const Icon(
      // Icons.history,
      // ),
      // onPressed: () {
      // This might require some changes to the history controller
      // The post method will need to check for duplicates to prevent
      // a user from showing up twice in the viewed list
      // There will need to be another method which only retrieves
      // viewed user ids
      // Then the app will have to retrieve those workers and their details
      // and list them in a column
      // Be careful not to overwrite the workers list which is already in
      // the worker service
      // Would be better to create a new variable to hold the viewed
      // accounts
      // },
      // ),
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
