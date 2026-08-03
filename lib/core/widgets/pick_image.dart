import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:image_picker/image_picker.dart';

class PickImageBottomSheet extends StatelessWidget {
  const PickImageBottomSheet({super.key, required this.onSelect});
  final void Function({required ImageSource imageSource}) onSelect;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.horizontal(
                right: Radius.circular(13.r),
                left: Radius.circular(13.r),
              ),
            ),
            leading: const Icon(
              Icons.photo_library,
              color: AppColors.primaryBase,
            ),
            title: Text(
              'اختر من المعرض',
              style: context.headlineSmall14.copyWith(
                color: AppColors.primaryBase,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () async {
              Navigator.pop(context);
              onSelect(imageSource: ImageSource.gallery);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.photo_camera,
              color: AppColors.primaryBase,
            ),
            title: Text(
              'التقط صورة',
              style: context.headlineSmall14.copyWith(
                color: AppColors.primaryBase,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () async {
              Navigator.pop(context);
              onSelect(imageSource: ImageSource.camera);
            },
          ),
        ],
      ),
    );
  }
}
