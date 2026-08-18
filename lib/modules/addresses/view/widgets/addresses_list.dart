import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/widgets/confirmation_dialog.dart';
import 'package:project_2/modules/addresses/cubit/addresses_cubit.dart';
import 'package:project_2/modules/addresses/models/address_data.dart';

class AddressesList extends StatelessWidget {
  final List<AddressData> addresses;
  const AddressesList({super.key, required this.addresses});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w, vertical: 16.h),
      sliver: SliverList.separated(
        itemCount: addresses.length,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(width: 1, color: const Color(0xffE2E2EA)),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 30.r,
                backgroundColor: AppColors.lightBlue,
                child: Icon(Icons.location_on_outlined, size: 32.sp),
              ),
              SizedBox(width: 8.w),
              Text(addresses[index].label, style: context.bodyLarge20),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit_outlined,
                  color: AppColors.primary,
                  size: 28.sp,
                ),

                style: IconButton.styleFrom(
                  backgroundColor: AppColors.lightBlue.withAlpha(100),
                ),
              ),
              SizedBox(width: 5.w),
              IconButton(
                onPressed: () {
                  ConfirmationDialog.show(
                    context,
                    title: 'Delete',
                    content: 'Are you sure?',
                    status: ConfirmationStatus.danger,
                    onConfirm: () {
                      context.read<AddressesCubit>().deleteAddress(
                        addressId: addresses[index].id,
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.delete_outline,
                  color: AppColors.errorColor,
                ),
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.errorColor.withAlpha(40),
                ),
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(height: 10.h),
      ),
    );
  }
}
