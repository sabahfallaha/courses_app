import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constant.dart';
import '../cubit/student_cubit.dart';
import '../model/course_model.dart';
import '../model/student_model.dart';
import '../services/get_all_courses_service.dart';
import '../widgets/custom_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = 'homePage';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, Student>(
      builder: (BuildContext context, Student state) {
        return Scaffold(
          //  drawer: Container(),
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.logout,
                color: kPrimaryColor,
              ),
            ),
            //  actions: [
            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(Icons.call),
            // ),
            //   IconButton(
            //     onPressed: () {
            //       Drawer();
            //     },
            //     icon: Icon(
            //       Icons.menu,
            //       color: kPrimaryColor,
            //     ),
            //   ),
            // ],
            backgroundColor: KSecondaryColor,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'My Courses',
              style: TextStyle(
                color: kPrimaryColor,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
            child: FutureBuilder<List<CourseModel>>(
              future: GetAllCoursesService().getAllCourses(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<CourseModel> courses = snapshot.data!;
                  return GridView.builder(
                      itemCount: courses.length,
                      clipBehavior: Clip.none,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1.5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 100,
                      ),
                      itemBuilder: (context, index) {
                        return CustomCard(
                          course: courses[index],
                        );
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          //CourseList(),
        );
      },
    );

    // return Container(
    //   color: Colors.white,
    //   child: Text("There is no courses available!"),
    // );
  }
}
