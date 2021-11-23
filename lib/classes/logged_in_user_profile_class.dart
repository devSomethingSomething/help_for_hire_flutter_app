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
}