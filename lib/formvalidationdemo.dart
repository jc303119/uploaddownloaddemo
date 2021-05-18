import 'package:flutter/material.dart';
import 'package:uploaddownloaddemo/db/db.dart';
import 'package:uploaddownloaddemo/models/customer.dart';
import 'package:uploaddownloaddemo/utils/utility.dart';

class FormValidationDemo extends StatefulWidget {
  @override
  _FormValidationDemoState createState() => _FormValidationDemoState();
}

class _FormValidationDemoState extends State<FormValidationDemo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, bool> hobbies;
  Map<String, int> genders;
  initState() {
    super.initState();
    hobbies = Db.getHobbies();
    genders = Db.getGender();
  }

  _validateIt() {
    if (_formKey.currentState.validate()) {
      print('Form is Validate');
      _formKey.currentState.save();
      print('Customer object data is $customer');
    } else {
      print('Form is Invalid');
    }
  }

  Customer customer = Customer();
  int groupValue = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Validation'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(4),
                  child: TextFormField(
                    autofocus: true,
                    onSaved: (String value) {
                      customer.name = value;
                      print('Save Call... ${customer.name}');
                    },
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Name can't be blank";
                      } else if (value.length < 3) {
                        return "Name can't be less than 3 characters";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      errorStyle: TextStyle(fontSize: 22),
                      hintText: 'Type Name Here',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(4),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    //autofocus: true,
                    onSaved: (String value) {
                      customer.phoneNo = value;
                      print('Save Call... Phone No${customer.phoneNo}');
                    },
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Phone No can't be blank";
                      } else if (value.length < 10) {
                        return "Phone No can't be less than 10 characters";
                      } else if (!Utility.isNumericShort(value)) {
                        return "Only Numbers Allowed in Phone No";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      errorStyle: TextStyle(fontSize: 22),
                      hintText: 'Type Phone No Here',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(4),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    //autofocus: true,
                    onSaved: (String value) {
                      customer.email = value;
                      print('Save Call... Email ${customer.email}');
                    },
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Email can't be blank";
                      } else if (!Utility.isValidEmail(value)) {
                        return "Invalid Email Id";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      errorStyle: TextStyle(fontSize: 22),
                      hintText: 'Type Email Here',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(4),
                  child: DropdownButtonFormField<String>(
                    onSaved: (String value) {
                      customer.course = value;
                    },
                    validator: (String value) {
                      if (value == null) {
                        return "Please select a Course";
                      } else if (value.isEmpty) {
                        return "Select a Course";
                      }
                      return null;
                    },
                    hint: Text('Select the Course'),
                    onChanged: (String selectedValue) {
                      customer.course = selectedValue;
                    },
                    value: customer.course,
                    items: Db.getCourses()
                        .map((course) => DropdownMenuItem<String>(
                              value: course,
                              child: Text(course.toUpperCase()),
                            ))
                        .toList(),
                    decoration: InputDecoration(
                        errorStyle: TextStyle(fontSize: 22),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
                Container(
                  child: Text(
                    'Select Hobbies',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Card(
                  child: Column(
                      children: hobbies != null && hobbies.length != 0
                          ? hobbies.keys.map((String key) {
                              return ListTile(
                                leading: Checkbox(
                                  value: hobbies[key],
                                  onChanged: (bool value) {
                                    if (value) {
                                      setState(() {
                                        hobbies[key] = value;
                                        customer.hobbies.add(key);
                                      });
                                    } else {
                                      setState(() {
                                        hobbies[key] = value;
                                        customer.hobbies.remove(key);
                                      });
                                    }
                                  },
                                ),
                                title: Text(key),
                              );
                            }).toList()
                          : Text('No Hobbies Present')),
                ),
                Container(
                  child: Column(
                    children: genders != null && genders.length > 0
                        ? genders.keys.map((String key) {
                            return RadioListTile(
                              title: Text(key),
                              value: genders[key],
                              onChanged: (int value) {
                                setState(() {
                                  groupValue = value;
                                  customer.gender = groupValue == 1 ?"Male":"Female";
                                });
                                print('Group value is $groupValue and value is $value');
                              },
                              groupValue: groupValue,
                            );
                          }).toList()
                        : Text("No Gender"),
                  ),
                ),
                RaisedButton(
                  child: Text('Submit'),
                  onPressed: () {
                    _validateIt();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
