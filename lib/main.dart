import 'package:courses_app/pages/loading_page.dart';
import 'package:courses_app/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cubit/student_cubit.dart';
import 'pages/course_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget page = LoadingPage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? token = _prefs.getString('token');
    if (token != null) {
      setState(() {
        page = LoginPage();
      });
    } else {
      setState(() {
        page = LoginPage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var RegisterPage;
    var HomePage;
    return BlocProvider(
      create: (context) => StudentCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: page,
        routes: {
          RegisterPage.id: (context) => RegisterPage(),
          LoginPage.id: (context) => LoginPage(),
          HomePage.id: (context) => HomePage(),
          CourseDetails.id: (context) => CourseDetails(),
        },
      ),
    );
  }
}
