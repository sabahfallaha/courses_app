import 'package:flutter/material.dart';

import '../model/course_model.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    required this.course,
    Key? key,
  }) : super(key: key);

  CourseModel course;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CourseDetails.id, arguments: course);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 50,
                color: Colors.grey.withOpacity(.1),
                spreadRadius: 20,
                offset: Offset(10, 10),
              ),
            ]),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // name
                    Text(
                      course.name,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //description
                        Text(
                          'description',
                          // course.description,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),

                        // Icon(
                        //   Icons.favorite,
                        //   color: Colors.red,
                        // ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 62,
            top: -60,
            child: Image.asset(
              'assets/p.jpg',
              // height: ,
              width: 20,
              // course.image
            ),
            height: 100,
            width: 100,
          ),
        ],
      ),
    );
  }
}

// class CustomCard extends StatelessWidget {
//   CustomCard({required this.course, Key? key}) : super(key: key);
//   CourseModel course;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.pushNamed(context, CourseDetails.id, arguments: course);
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: kPrimaryColor,
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: ListTile(
//           // course.name
//           title: Text(
//             course.name,
//             style: TextStyle(
//                 color: KSecondaryColor,
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold),
//           ),
//           // course description
//           subtitle: Text(
//             course.description,
//             style: TextStyle(color: KSecondaryColor),
//           ),
//         ),
//       ),
//     );
//   }
// }
