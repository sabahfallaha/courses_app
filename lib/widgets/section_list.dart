import 'package:flutter/material.dart';

import '../constant.dart';
import '../model/section_model.dart';

class SectionCard extends StatelessWidget {
  SectionCard({required this.section, Key? key}) : super(key: key);
  SectionModel section;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //  Navigator.pushNamed(context, CourseDetails.id, arguments: course);
      },
      child: Container(
        decoration: BoxDecoration(
          color: KSecondaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          // course.name
          title: Text(
            section.name,
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          // course description
          subtitle: Text(
            section.description,
            style: TextStyle(color: KSecondaryColor),
          ),
        ),
      ),
    );
  }
}
