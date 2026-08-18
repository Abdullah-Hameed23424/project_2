import 'package:flutter/material.dart';
import 'package:project_2/core/localization/language_constraints.dart';
import 'package:project_2/core/routing/app_routes.dart';
import 'package:project_2/modules/profile/models/profile_option_model.dart';

abstract class ProfileHelper {
  static List<ProfileOptionModel> getProfileOption(BuildContext context) {
    return <ProfileOptionModel>[
      ProfileOptionModel(
        iconData: Icons.location_on_outlined,
        title: 'My Addresses',
        onTap: AppRoutes.toAddressesScreen,
      ),
      ProfileOptionModel(
        iconData: Icons.language,
        title: translate('profile.lang_label', context),
        subtitle: 'English',
        onTap: AppRoutes.toLanguageScreen,
      ),
      ProfileOptionModel(
        iconData: Icons.description_outlined,
        title: translate('profile.termconditions_tile_label', context),
        onTap: () {},
      ),
      ProfileOptionModel(
        iconData: Icons.privacy_tip_outlined,
        title: translate('profile.privacy_tile_label', context),
        onTap: () {},
      ),
    ];
  }
}
