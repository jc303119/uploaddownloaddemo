class Db{
    static List<String> getCourses(){
    List<String> courses = ["C", "C++", "JS", "Java", "Dart"];
    return courses;
  }
  static Map<String, bool> getHobbies() {
    Map<String, bool> hobbies = {};
    return {"Reading": false, "Sports": false, "Travel": false};
  }
  static Map<String, int> getGender(){
      return {"male":1, "female":2};
  }
}
