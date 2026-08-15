import 'package:project_2/core/utils/model_parser.dart';

class ProfileData {
  final int id;
  final String name;
  final String phone;
  final String role;
  final String profileImageUrl;

  ProfileData({
    required this.id,
    required this.name,
    required this.phone,
    required this.role,
    required this.profileImageUrl,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
    id: ModelParser.intValue(json['id']),
    name: ModelParser.stringValue(json['name']),
    phone: ModelParser.stringValue(json['phone']),
    role: ModelParser.stringValue(json['role']),
    profileImageUrl: ModelParser.stringValue(json['profile_image_url']),
  );
}
