import 'package:help_for_hire_flutter_app/models/rating.dart';
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

  double getAvgRating(String userID){
    double num=0;
    for(int i=0;i<RatingService.ratings.length;i++){
      num=num+RatingService.ratings[i].value;
    }
    return num/RatingService.ratings.length;
  }

}