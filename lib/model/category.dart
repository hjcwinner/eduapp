class Category {
  final String name;
  final int numOfCourses;
  final String image;

  Category(this.name, this.numOfCourses, this.image);
}

List<Category> categories = categoriesData
    .map((item) => Category(item['name'], item['coureses'], item['image']))
    .toList();

var categoriesData = [
  {"name": "Marketing", 'coureses': 17, 'image': "assets/images/marketing.png"}, 
  {"name": "UX Design", 'coureses': 25, 'image': "assets/images/marketing.png"}, 
  {"name": "Photography", 'coureses': 13, 'image': "assets/images/photography.png"}, 
  {"name": "Business", 'coureses': 17, 'image': "assets/images/business.png"}
  ];
