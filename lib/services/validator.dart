class Validator {
  Validator._();

  static String? validateName(String? name) {
    return (name?.length ?? 0) < 5 ? "Provided name is very short" : null;
  }
  static String? validateage(String? age) {

    return (int.parse(age??"") ?? 0) < 18 ? "you are very young" : null;
  }
  static String? validatephone(String? phone) {
    if ((phone?.length ?? 0) != 11){
      return "your phone number must be 11 number";
    }
    if (!(((phone?.startsWith("011"))??false) ||((phone?.startsWith("012")) ?? false)||((phone?.startsWith("010"))??false) ||((phone?.startsWith("015"))??false))){
      return "your phone number is wrong";
    }
    //return (phone?.length ?? 0) != 11 ? "your phone number must be 11 number" : null;
    return null;
  }
  //TODO:TASK validate phone and age : 18 years

}
