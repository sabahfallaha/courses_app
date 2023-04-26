import 'dart:convert';

import 'package:loginuicolors/models/course_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/api.dart';

class GetAllCoursesService {
  Future<List<CourseModel>> getAllCourses() async {
    // var token = await Api.readToken();
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var token = _prefs.getString('token');
    print('t:');
    print(token);
    var req = await Api().get(url: 'courses', token: token);
    List<dynamic> data = jsonDecode(req.body);
    List<CourseModel> courseList = [];
    for (int i = 0; i < data.length; i++) {
      courseList.add(
        CourseModel.fromJson(data[i]),
      );
    }
    return courseList;
  }
}
