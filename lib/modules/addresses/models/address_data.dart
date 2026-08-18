import 'package:project_2/core/utils/model_parser.dart';

class AddressData {
  final int id;
  final String label;

  AddressData({required this.id, required this.label});

  factory AddressData.fromJson(Map<String, dynamic> json) => AddressData(
    id: ModelParser.intValue(json['id']),
    label: ModelParser.stringValue(json['label']),
  );
}
