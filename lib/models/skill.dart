class Skill{

  int _skillID;
  //Worker worker;
  Job _job;

  Skill(this._skillID, this._job);

  Job get job => _job;

  set job(Job value) {
    _job = value;
  }

  int get skillID => _skillID;

  set skillID(int value) {
    _skillID = value;
  }
}

class Job{
  int _jobID;
  String _Title;

  Job(this._jobID, this._Title);

  String get Title => _Title;

  set Title(String value) {
    _Title = value;
  }

  int get jobID => _jobID;

  set jobID(int value) {
    _jobID = value;
  }
}