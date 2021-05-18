class Customer{
  String _name ;
  String _phoneNo;
  String _email;
  String _course;
  List<String> _hobbies = [];
  String _gender;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get phoneNo => _phoneNo;

  set phoneNo(String value) {
    _phoneNo = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get course => _course;

  set course(String value) {
    _course = value;
  }

  List<String> get hobbies => _hobbies;

  set hobbies(List<String> value) {
    _hobbies = value;
  }

  String get gender => _gender;

  set gender(String value) {
    _gender = value;
  }

  @override
  String toString() {
    return 'Customer{_name: $_name, _phoneNo: $_phoneNo, _email: $_email, _course: $_course, _hobbies: $_hobbies, _gender: $_gender}';
  }
}