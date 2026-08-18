import 'package:project_2/core/utils/model_parser.dart';

class CategoryData {
  final int id;
  final String name;
  final String iconUrl;
  final String guidePrice;
  final List<CategoryData>? children;

  CategoryData({
    required this.id,
    required this.name,
    required this.iconUrl,
    required this.guidePrice,
    this.children,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
    id: ModelParser.intValue(json['id']),
    name: ModelParser.stringValue(json['name']),
    iconUrl: ModelParser.stringValue(json['icon_url']),
    guidePrice: ModelParser.stringValue(json['guide_price']),
    children: json['children'] == null
        ? []
        : List<CategoryData>.from(
            json['children']!.map((x) => CategoryData.fromJson(x)),
          ),
  );
}
