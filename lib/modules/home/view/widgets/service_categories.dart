import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/routing/app_routes.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/widgets/cached_image.dart';
import 'package:project_2/core/widgets/no_data.dart';
import 'package:project_2/core/widgets/try_again.dart';
import 'package:project_2/modules/home/view/widgets/categories_shimmer.dart';
import 'package:project_2/modules/services/cubit/services_cubit.dart';
import 'package:project_2/modules/services/models/category_data.dart';

class ServiceCategories extends StatefulWidget {
  const ServiceCategories({super.key});

  @override
  State<ServiceCategories> createState() => _ServiceCategoriesState();
}

class _ServiceCategoriesState extends State<ServiceCategories> {
  late final ServicesCubit _servicesCubit;

  @override
  void initState() {
    _servicesCubit = ServicesCubit()..getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ServicesCubit>.value(
      value: _servicesCubit,
      child: BlocBuilder<ServicesCubit, ServicesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return const CategoriesShimmer();
          } else if (state is CategoriesError) {
            return SliverToBoxAdapter(
              child: TryAgain(
                onTap: () {
                  _servicesCubit.getCategories();
                },
                message: state.message,
              ),
            );
          } else if (state is CategoriesSuccess) {
            if (state.categoriesResponse.data.isEmpty) {
              return const SliverToBoxAdapter(child: NoData());
            }
            return SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.h,
                crossAxisSpacing: 12.w,
                childAspectRatio: 1.05,
              ),
              itemCount: state.categoriesResponse.data.length,
              itemBuilder: (context, index) {
                final CategoryData category =
                    state.categoriesResponse.data[index];
                return GestureDetector(
                  onTap: () {
                    AppRoutes.toServicesScreen(categoryId: category.id);
                  },
                  child: Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          AppColors.primary.withValues(alpha: 0.90),
                          AppColors.primary.withValues(alpha: 0.50),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(18.r),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: AppColors.lightBlue.withValues(alpha: 0.20),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 46.w,
                          height: 46.h,
                          padding: EdgeInsets.all(8.h),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.25),
                            shape: BoxShape.circle,
                          ),
                          child: CachedImage(category.iconUrl),
                        ),

                        Text(
                          category.name,
                          style: context.bodyMedium16.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
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
    );
  }
}
