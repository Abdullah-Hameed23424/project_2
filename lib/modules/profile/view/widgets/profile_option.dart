import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/modules/profile/models/profile_option_model.dart';
import 'package:project_2/modules/profile/view/screens/helper/profile_helper.dart';

class ProfileOption extends StatelessWidget {
  const ProfileOption({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProfileOptionModel> items = ProfileHelper.getProfileOption(
      context,
    );
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: const <BoxShadow>[
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 1)),
        ],
      ),
      child: Column(
        children: <Widget>[
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12.r),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
              leading: Icon(items[index].iconData),
              title: Text.rich(
                TextSpan(
                  children: <InlineSpan>[
                    TextSpan(text: items[index].title),
                    if (items[index].subtitle != null)
                      TextSpan(text: ': ${items[index].subtitle!}'),
                  ],
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios, size: 25.sp),
              onTap: items[index].onTap,
            ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: items.length,
          ),
        ],
      ),
    );
  }
}
