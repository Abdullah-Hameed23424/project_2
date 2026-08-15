import 'package:flutter/material.dart';
import 'package:project_2/core/routing/app_routes.dart';
import 'package:project_2/modules/profile/models/profile_option_model.dart';

abstract class ProfileHelper {
  static final List<ProfileOptionModel> profileOptionItems =
      <ProfileOptionModel>[
        ProfileOptionModel(
          iconData: Icons.language,
          title: 'Language',
          subtitle: 'English',
          onTap: () {
            AppRoutes.toLanguageScreen();
          },
        ),
        ProfileOptionModel(
          iconData: Icons.description_outlined,
          title: 'Terms & Conditions',
          onTap: () {},
        ),
        ProfileOptionModel(
          iconData: Icons.privacy_tip_outlined,
          title: 'Privacy Policy',
          onTap: () {},
        ),
      ];
}
