import 'package:courses_app/model/section_model.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../model/course_model.dart';
import '../widgets/section_list.dart';

class CourseDetails extends StatelessWidget {
  CourseDetails({Key? key}) : super(key: key);
  static String id = 'coursePage';
  @override
  Widget build(BuildContext context) {
    CourseModel course =
        ModalRoute.of(context)!.settings.arguments as CourseModel;
    List<SectionModel> list = [
      SectionModel(id: 1, name: 'sec 1', description: 'description'),
      SectionModel(id: 2, name: 'sec 2', description: 'description')
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KSecondaryColor,
        iconTheme: IconThemeData(color: kPrimaryColor),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Course details',
          style: TextStyle(
            color: kPrimaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset('assets/p.jpg'
              //course.image
              ),
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Text(
                          //   course.name,
                          //   style: TextStyle(
                          //     fontSize: 25,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                //teacher
                                course.name,
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomBox(
                                num: '3', //course.sections_count,
                                text: 'الأقسام',
                              ),
                              CustomBox(
                                num: "20"
                                //course.duration
                                ,
                                text: 'عدد الساعات',
                              ),
                              CustomBox(
                                num: "50000"
                                //course.price
                                ,
                                text: 'السعر',
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            course.description,
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.justify,
                          ),

                          SizedBox(
                            height: 30,
                          ),
                          SectionCard(section: list[0]),
                          SizedBox(
                            height: 30,
                          ),
                          SectionCard(section: list[1]),
                          SizedBox(
                            height: 30,
                          ),
                          SectionCard(section: list[1]),
                          SizedBox(
                            height: 30,
                          ),
                          SectionCard(section: list[1]),
                          SizedBox(
                            height: 30,
                          ),
                        ]),
                  ),
                ),
              ),
              // Positioned(
              //   left: MediaQuery.of(context).size.width / 1.3,
              //   child: Container(
              //     padding: const EdgeInsets.all(12),
              //     decoration: const BoxDecoration(
              //         color: Color(0xff00a7f2),
              //         shape: BoxShape.circle,
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.black12,
              //             blurRadius: 6,
              //             spreadRadius: 4,
              //           )
              //         ]),
              //     child: const Icon(
              //       Icons.favorite_rounded,
              //       color: Colors.white,
              //       size: 30,
              //     ),
              //   ),
              // )
            ],
          )
        ]),
      ),
    );
  }
}

class CustomBox extends StatelessWidget {
  CustomBox({Key? key, required this.num, required this.text})
      : super(key: key);
  String num, text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            num,
            style: TextStyle(
              fontSize: 18,
              color: KSecondaryColor,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
