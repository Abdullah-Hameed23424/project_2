import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/widgets/app_loading.dart';
import 'package:project_2/core/widgets/cached_image.dart';
import 'package:project_2/core/widgets/try_again.dart';
import 'package:project_2/modules/profile/cubit/profile_cubit.dart';
import 'package:project_2/modules/profile/models/profile_data.dart';

class MainInfoCard extends StatefulWidget {
  const MainInfoCard({super.key});

  @override
  State<MainInfoCard> createState() => _MainInfoCardState();
}

class _MainInfoCardState extends State<MainInfoCard> {
  late final ProfileCubit profileCubit;

  @override
  void initState() {
    profileCubit = ProfileCubit()..getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>.value(
      value: profileCubit,
      child: Container(
        height: 260.h,
        width: 1.sw,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.lightBlue.withAlpha(150),
        ),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileError) {
              return TryAgain(
                message: state.message,
                onTap: () {
                  profileCubit.getProfile();
                },
              );
            } else if (state is ProfileLoading) {
              return const AppLoading();
            } else if (state is ProfileSuccess) {
              final ProfileData data = state.profileResponse.data;
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 100.h,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: <Widget>[
                        Container(
                          width: 100.w,
                          height: 100.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary.withAlpha(75),
                          ),
                          child: CachedImage(data.profileImageUrl),
                        ),

                        Positioned(
                          right: -10.w,
                          bottom: -10.h,
                          child: IconButton(
                            onPressed: () {},
                            iconSize: 22.5.sp,
                            constraints: BoxConstraints(
                              maxHeight: 40.h,
                              maxWidth: 40.h,
                            ),
                            style: IconButton.styleFrom(
                              backgroundColor: AppColors.primary,
                            ),
                            icon: const Icon(
                              Icons.edit,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 12.h),

                  Text(
                    'Abdullah Hameed',
                    style: context.bodyLarge20.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12.h),

                  Text(
                    '+963 987 654 321',
                    textDirection: TextDirection.ltr,
                    style: context.bodyMedium16.copyWith(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              );
            } else {
              return SizedBox.fromSize();
            }
          },
        ),
      ),
    );
  }
}
