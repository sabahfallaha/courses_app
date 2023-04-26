import 'dart:convert';

class Student {
  // int id;
  // String email;
  // String phone;
  // String name;
  String token;

  Student(
      {
      //   required this.id,
      // required this.email,
      // required this.phone,
      // required this.name,
      required this.token});

  factory Student.fromReqBody(String body) {
    Map<String, dynamic> json = jsonDecode(body);

    return Student(
      // id: json['id'],
      // email: json['email'],
      // name: json['name'],
      // phone: json['phone'],
      token: json['access'],
    );
  }

  void printAttributes() {
    //  print("id: ${this.id}\n");
    // print("email: ${this.email}\n");
    // print("phone: ${this.phone}\n");
    // print("name: ${this.name}\n");
    print("token: ${this.token}\n");
  }
}
