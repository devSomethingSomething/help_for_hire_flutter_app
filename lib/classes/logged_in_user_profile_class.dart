import 'package:help_for_hire_flutter_app/models/rating_model.dart';
import 'package:help_for_hire_flutter_app/services/rating_service.dart';

class UserProfile{

  String getWorkTimeString(bool partTime,bool fullTime){
    String outPut='';

    if(partTime){
      outPut=outPut+'PartTime';
    }

    if(fullTime){
      outPut=outPut+'FullTime';
    }

    if(outPut.length<1){
      outPut='in active';
    }

    return outPut;
  }

  double getAvgRating(String userID,List<RatingModel> ratings){
    double num=0;
    for(int i=0;i<ratings.length;i++){
      num=num+ratings[i].value;
    }
    return num/ratings.length;
  }

}