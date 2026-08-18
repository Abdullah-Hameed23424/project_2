import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/theme/app_status_bar_theme.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/widgets/app_loading.dart';
import 'package:project_2/core/widgets/cached_image.dart';
import 'package:project_2/core/widgets/no_data.dart';
import 'package:project_2/core/widgets/pop_button.dart';
import 'package:project_2/core/widgets/try_again.dart';
import 'package:project_2/modules/services/cubit/services_cubit.dart';

class ServicesScreen extends StatelessWidget {
  final int categoryId;
  const ServicesScreen({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ServicesCubit>(
      create: (context) => ServicesCubit()..getServices(categoryId: categoryId),
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: AppStatusBarTheme.lightnessStatusBar,
          leading: const PopButton(color: AppColors.primaryDark),
          title: BlocBuilder<ServicesCubit, ServicesState>(
            builder: (context, state) {
              if (state is ServicesLoading) {
                return SizedBox(width: 75.w, child: const AppLoading());
              } else if (state is ServicesSuccess) {
                return Text(
                  state.catName,
                  style: context.titleSmall26.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
          centerTitle: false,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              /// Search
              // SliverToBoxAdapter(
              //   child: Padding(
              //     padding: EdgeInsets.only(bottom: 20.h),
              //     child: CustomTextField(
              //       radius: 12.r,
              //       controller: TextEditingController(),
              //       hintText: translate('services.search_field_hint', context),
              //       prefixIcon: const Icon(Icons.search),
              //       color: AppColors.lightBlue.withValues(alpha: 0.35),
              //     ),
              //   ),
              // ),

              /// Services
              BlocBuilder<ServicesCubit, ServicesState>(
                builder: (context, state) {
                  if (state is ServicesLoading) {
                    return const SliverToBoxAdapter(child: AppLoading());
                  } else if (state is ServicesError) {
                    return SliverToBoxAdapter(
                      child: TryAgain(
                        onTap: () {
                          context.read<ServicesCubit>().getServices(
                            categoryId: categoryId,
                          );
                        },
                        message: state.message,
                      ),
                    );
                  } else if (state is ServicesSuccess) {
                    if (state.children.isEmpty) {
                      return const SliverToBoxAdapter(child: NoData());
                    }
                    return SliverList.builder(
                      itemCount: state.children.length,
                      itemBuilder: (context, index) {
                        final service = state.children[index];

                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 16.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withAlpha(150),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 48.w,
                                  height: 48.h,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.25),
                                    shape: BoxShape.circle,
                                  ),
                                  child: CachedImage(service.iconUrl),
                                ),
                                SizedBox(width: 14.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        service.name,
                                        style: context.bodyMedium16.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: 4.h),
                                      Text(
                                        'With prices starting from: ${service.guidePrice}',
                                        style: context.bodyMedium16.copyWith(
                                          color: Colors.white.withValues(
                                            alpha: 0.85,
                                          ),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 16.sp,
                                  color: Colors.white.withValues(alpha: 0.8),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const SliverToBoxAdapter(child: SizedBox.shrink());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
