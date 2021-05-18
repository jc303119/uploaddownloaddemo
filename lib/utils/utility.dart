class Utility{
  static bool isNumeric(String value){
    for(int i=0; i<value.length; i++){
      int singleChar = value.codeUnitAt(i);
      if(!(singleChar>=48 && singleChar<=57)){
        return false;
      }
    }
    return true;
  }

  static bool isNumericShort(String value){
     Pattern pattern = r"[0-9]\d{9}$";  //r means regular expression
     RegExp regExp = RegExp(pattern);
//     if(!regExp.hasMatch(value)){
//       return false;
//     }
//    return true;
  return regExp.hasMatch(value);
  }
  static bool isValidEmail(String value){
    Pattern pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";   //r means regular expression
    RegExp regExp = RegExp(pattern);

    return regExp.hasMatch(value);
  }

}
