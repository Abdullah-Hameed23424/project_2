import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_periods.dart';
import 'package:project_2/core/localization/language_constraints.dart';
import 'package:project_2/core/theme/app_status_bar_theme.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/widgets/cached_image.dart';
import 'package:project_2/core/widgets/custom_button.dart';
import 'package:project_2/modules/home/view/widgets/balance_widget.dart';
import 'package:project_2/modules/home/view/widgets/home_body.dart';
import 'package:project_2/modules/home/view/widgets/tech_tracking_widget.dart';
import 'package:project_2/modules/profile/cubit/profile_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: AppColors.lightBlue,
          systemOverlayStyle: AppStatusBarTheme.lightnessStatusBar,
          leading: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileSuccess) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Container(
                    width: 25.w,
                    height: 25.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.lightBlue,
                    ),
                    child: CachedImage(
                      state.profileResponse.data.profileImageUrl,
                    ),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
          title: Text(
            translate('home.welcome', context),
            style: context.titleSmall26.copyWith(fontWeight: FontWeight.normal),
          ),
          centerTitle: false,
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_outlined),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
              /// Balance Widget
              SliverToBoxAdapter(
                child: FadeInLeft(
                  child: BalanceWidget(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(translate('home.current_balance', context)),
                              Text.rich(
                                TextSpan(
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: '1,250.00',
                                      style: context.titleSmall26,
                                    ),
                                    WidgetSpan(child: SizedBox(width: 5.w)),
                                    const TextSpan(text: 'SAR'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: CustomButton(
                            label: translate('home.balance_btn_label', context),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// Technician Tracking
              const TechTrackingWidget(),
            ],
            body: FadeInLeft(
              delay: AppPeriods.animationDelay(3),
              child: const HomeBody(),
            ),
          ),
        ),
      ),
    );
  }
}
