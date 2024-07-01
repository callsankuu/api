class Postmethod {
  int? categoryId;
  String? category;
  String? description;
  int? createdBy;

  Postmethod(
      {this.categoryId, this.category, this.description, this.createdBy});

  Postmethod.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    category = json['category '];
    description = json[' description'];
    createdBy = json['createdBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    data['category '] = this.category;
    data['description'] = this.description;
    data['createdBy'] = this.createdBy;
    return data;
  }
}
