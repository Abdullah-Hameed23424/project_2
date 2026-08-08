import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_sizes.dart';
import 'package:project_2/core/theme/app_theme.dart';

class PhoneNumberPrefix extends StatelessWidget {
  const PhoneNumberPrefix({
    super.key,
    required this.countryCode,
    required this.isoCode,
  });

  final ValueNotifier<String> countryCode;
  final ValueNotifier<IsoCode> isoCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      decoration: BoxDecoration(
        color: const Color.fromARGB(80, 225, 226, 236),
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(AppSizes.radius),
        ),
      ),
      child: Row(
        children: <Widget>[
          Directionality(
            textDirection: TextDirection.ltr,
            child: CountryCodePicker(
              enabled: true,
              onChanged: (code) {
                this.countryCode.value = code.dialCode ?? '+963';
                final countryCode = code.code ?? 'SY';
                isoCode.value = IsoCode.values.firstWhere(
                  (e) => e.name == countryCode,
                  orElse: () => IsoCode.SY,
                );
              },
              initialSelection: 'SY',
              favorite: const ['SY'],
              showCountryOnly: false,
              showFlagMain: false,
              showOnlyCountryWhenClosed: false,
              alignLeft: false,
              padding: EdgeInsets.zero,
              textStyle: context.bodyMedium16.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
              barrierColor: Colors.black26,
              dialogBackgroundColor: Colors.white,
              dialogSize: Size(300.w, 600.h),
              searchStyle: context.bodyMedium16,
            ),
          ),
          const Spacer(),
          Container(
            width: 1,
            height: 24.h,
            color: AppColors.primary.withValues(alpha: 0.3),
          ),
        ],
      ),
    );
  }
}
