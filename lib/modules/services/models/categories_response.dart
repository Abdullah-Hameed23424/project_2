import 'package:project_2/modules/services/models/category_data.dart';

class CategoriesResponse {
  final List<CategoryData> data;

  CategoriesResponse({required this.data});

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      CategoriesResponse(
        data: List<CategoryData>.from(
          json['data'].map((x) => CategoryData.fromJson(x)),
        ),
      );
}
