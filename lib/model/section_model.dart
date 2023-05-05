class SectionModel {
  final int id;
  final String name;
  final String description;

  SectionModel(
      {required this.id, required this.name, required this.description});

  factory SectionModel.fromJson(jsonData) {
    return SectionModel(
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
