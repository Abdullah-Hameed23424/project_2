import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_images.dart';
import 'package:project_2/core/theme/app_status_bar_theme.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/widgets/pop_button.dart';
import 'package:project_2/modules/addresses/view/widgets/addresses_list.dart';
import 'package:project_2/modules/addresses/view/widgets/demo_image.dart';
import 'package:project_2/modules/addresses/view/widgets/no_addresses.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: AppStatusBarTheme.lightnessStatusBar,
        leading: const PopButton(color: AppColors.black),
        title: Text(
          'My Addresses',
          style: context.titleSmall26.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),

      body: const CustomScrollView(
        slivers: <Widget>[
          // SliverToBoxAdapter(child: NoAddresses()),
          DemoImage(), AddressesList(),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add_location, color: AppColors.white),
      ),
    );
  }
}
