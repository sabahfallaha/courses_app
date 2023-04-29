import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/student_cubit.dart';
import '../model/course_model.dart';
import '../model/student_model.dart';
import '../services/get_all_courses_service.dart';
import 'custom_card.dart';

class CourseList extends StatelessWidget {
  CourseList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, Student>(
        builder: (BuildContext context, Student state) {
      return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: FutureBuilder<List<CourseModel>>(
          future: GetAllCoursesService().getAllCourses(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<CourseModel> courses = snapshot.data!;
              return ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4),
                    child: CustomCard(
                      course: courses[index],
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      );
    });
  }
}
