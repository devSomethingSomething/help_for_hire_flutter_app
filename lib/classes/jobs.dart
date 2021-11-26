import 'package:help_for_hire_flutter_app/models/job_model.dart';
import 'package:help_for_hire_flutter_app/services/job_service.dart';

class Jobs{
  JobService _jobService=JobService();

  String JobsToString(List<String> jobIDs){
    _jobService.getSelectedJobs(ids: jobIDs);
    var jobs=_jobService.jobs;
    String outPut='';
    for(int i=0;i<jobIDs.length;i++){
      outPut=outPut+jobs[i].title+'\n';
    }
      return outPut;
  }
}