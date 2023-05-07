import 'dart:convert';
import 'package:courses_app/model/section_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helper/api.dart';

class GetCoursesSectionService {
  Future<List<SectionModel>> getCourseSection({required int id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print('t:');
    print(token);
    var req = await Api().get(url: 'courses/$id', token: token);
    List<dynamic> data = jsonDecode(req.body);
    List<SectionModel> sectionList = [];
    for (int i = 0; i < data.length; i++) {
      sectionList.add(
        SectionModel.fromJson(data[i]),
      );
    }
    return sectionList;
  }
}
