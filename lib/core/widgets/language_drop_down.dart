import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_icons.dart';
import 'package:project_2/core/localization/cubit/localization_cubit.dart';
import 'package:project_2/core/localization/language_constraints.dart';
import 'package:project_2/core/theme/app_theme.dart';

class LanguageDropDown extends StatefulWidget {
  const LanguageDropDown({super.key});

  @override
  State<LanguageDropDown> createState() => _LanguageDropDownState();
}

class _LanguageDropDownState extends State<LanguageDropDown>
    with TickerProviderStateMixin {
  String _selectedSort = 'en';
  bool _isMenuOpen = false;
  late AnimationController _arrowController;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<LocalizationCubit>();
    _selectedSort = cubit.appLocale?.languageCode ?? 'en';

    _arrowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _arrowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocalizationCubit, LocalizationState>(
      listener: (context, state) {
        if (state is ChangeLocaleState) {
          // AppRoutes.toPreOnBoardingScreen();
        }
      },
      builder: (context, state) {
        final LocalizationCubit cubit = context.read<LocalizationCubit>();
        final currentLocale = cubit.appLocale?.languageCode ?? 'en';

        if (_selectedSort != currentLocale) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              setState(() {
                _selectedSort = currentLocale;
              });
            }
          });
        }

        return Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
          ),
          child: PopupMenuButton<String>(
            surfaceTintColor: Colors.transparent,
            padding: EdgeInsets.zero,
            color: Colors.white,
            elevation: 3,
            offset: Offset(0, 35.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            tooltip: 'تغيير اللغة',
            onOpened: () {
              setState(() {
                _isMenuOpen = true;
              });
              _arrowController.forward();
            },
            onCanceled: () {
              setState(() {
                _isMenuOpen = false;
              });
              _arrowController.reverse();
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  _selectedSort == 'en' ? AppIcons.gb : AppIcons.ar,
                  width: 24.w,
                ),
                SizedBox(width: 8.w),
                Text(
                  _selectedSort == 'en'
                      ? translate('en', context)
                      : translate('ar', context),
                  style: context.headlineSmall14.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 8.w),
                const Icon(
                  Icons.arrow_drop_down,
                  size: 14,
                  color: Colors.black,
                ),
              ],
            ),
            onSelected: (value) {
              cubit.changeLocale(locale: Locale(value));
              setState(() {
                _selectedSort = value;
                _isMenuOpen = false;
              });
              _arrowController.reverse();
            },
            itemBuilder: (context) => [
              _buildLanguageItem(context, 'en', AppIcons.gb),
              const PopupMenuDivider(height: 1),
              _buildLanguageItem(context, 'ar', AppIcons.ar),
            ],
          ),
        );
      },
    );
  }

  PopupMenuItem<String> _buildLanguageItem(
    BuildContext context,
    String value,
    String iconPath,
  ) {
    final isSelected = _selectedSort == value;
    return PopupMenuItem(
      value: value,
      height: 40.h,
      child: Row(
        children: [
          SvgPicture.asset(iconPath, width: 20.w),
          SizedBox(width: 8.w),
          Text(
            translate(value, context),
            style: context.headlineSmall14.copyWith(
              fontSize: 14.sp,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              color: isSelected ? AppColors.primary : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
