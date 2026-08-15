import 'package:project_2/modules/profile/models/profile_data.dart';

class ProfileResponse {
  final ProfileData data;

  ProfileResponse({required this.data});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      ProfileResponse(data: ProfileData.fromJson(json['data']));
}
