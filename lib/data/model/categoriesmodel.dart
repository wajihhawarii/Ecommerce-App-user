class CategoriesModel {
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatatime;

  CategoriesModel(
      {this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesImage,
      this.categoriesDatatime});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDatatime = json['categories_datatime'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['categories_id'] = categoriesId;
    data['categories_name'] = categoriesName;
    data['categories_name_ar'] = categoriesNameAr;
    data['categories_image'] = categoriesImage;
    data['categories_datatime'] = categoriesDatatime;
    return data;
  }
}
