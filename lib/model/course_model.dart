class CourseModel {
  final dynamic id;
  final String name;
  final dynamic description;
  // final String image;
  // final String sections_count;
  //final String duration;
  // final String price;

  CourseModel({
    required this.name,
    this.description,
    required this.id,
    // required this.duration,
    // required this.image,
    // required this.price,
    // required this.sections_count
  });

  factory CourseModel.fromJson(jsonData) {
    return CourseModel(
      id: jsonData['id'],
      name: jsonData['name'],
      description: jsonData['description'],
      //  sections_count: jsonData['sections_count'],
      // duration: jsonData['duration'],
      // price: jsonData['price'],
      // image: jsonData['image']
    );
  }
}
