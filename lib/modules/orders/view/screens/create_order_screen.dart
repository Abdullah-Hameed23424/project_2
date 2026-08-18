import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_periods.dart';
import 'package:project_2/core/routing/app_routes.dart';
import 'package:project_2/core/services/snackbar_service.dart';
import 'package:project_2/core/theme/app_status_bar_theme.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/widgets/app_loading.dart';
import 'package:project_2/core/widgets/custom_button.dart';
import 'package:project_2/core/widgets/custom_textfield.dart';
import 'package:project_2/core/widgets/pop_button.dart';
import 'package:project_2/modules/orders/cubit/orders_cubit.dart';
import 'package:project_2/modules/orders/view/widgets/fee_widget.dart';
import 'package:project_2/modules/orders/view/widgets/image_picker_boxes.dart';
import 'package:project_2/modules/orders/view/widgets/picking_date_time.dart';
import 'package:project_2/modules/orders/view/widgets/service_menu.dart';
import 'package:project_2/modules/orders/view/widgets/service_timing.dart';

class CreateOrderScreen extends StatefulWidget {
  final int serviceCategoryId;
  final int opId;
  const CreateOrderScreen({
    super.key,
    required this.serviceCategoryId,
    required this.opId,
  });

  @override
  State<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  late final ValueNotifier<int> id;
  late final ValueNotifier<String> type;
  late final TextEditingController dateController;
  late final TextEditingController timeController;
  late final ValueNotifier<List<XFile>> images;
  late final TextEditingController problemDescriptionController;

  @override
  void initState() {
    id = ValueNotifier<int>(-1);
    type = ValueNotifier<String>('urgent');
    dateController = TextEditingController();
    timeController = TextEditingController();
    images = ValueNotifier<List<XFile>>([]);
    problemDescriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    id.dispose();
    type.dispose();
    dateController.dispose();
    timeController.dispose();
    images.dispose();
    problemDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: AppStatusBarTheme.lightnessStatusBar,
        leading: const PopButton(color: AppColors.black),
        title: Text(
          'Create Request',
          style: context.titleSmall26.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: BlocProvider<OrdersCubit>(
        create: (context) => OrdersCubit(),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadeInLeft(
                child: Text('Service Location', style: context.bodyMedium16),
              ),
              FadeInLeft(child: ServiceMenu(id: id)),

              SizedBox(height: 20.h),
              FadeInLeft(
                delay: AppPeriods.animationDelay(2),
                child: Text('Service Timing', style: context.bodyMedium16),
              ),
              FadeInLeft(
                delay: AppPeriods.animationDelay(2),
                child: ServiceTiming(type: type),
              ),

              SizedBox(height: 20.h),
              ValueListenableBuilder<String>(
                valueListenable: type,
                builder: (context, value, child) {
                  if (value == 'by_appointment') {
                    return FadeInLeft(
                      child: PickingDateTime(
                        dateController: dateController,
                        timeController: timeController,
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),

              SizedBox(height: 20.h),
              FadeInLeft(
                delay: AppPeriods.animationDelay(3),
                child: Text('Problem Description', style: context.bodyMedium16),
              ),
              FadeInLeft(
                delay: AppPeriods.animationDelay(3),
                child: CustomTextField(
                  controller: problemDescriptionController,
                  radius: 12.r,
                  hintText:
                      'Please describe the problem in detail to assist the technician...',
                  keyboardType: TextInputType.text,
                  maxLines: 4,
                ),
              ),

              SizedBox(height: 20.h),
              FadeInLeft(
                delay: AppPeriods.animationDelay(4),
                child: Text('Attach photos', style: context.bodyMedium16),
              ),
              FadeInLeft(
                delay: AppPeriods.animationDelay(4),
                child: ImagePickerBoxes(images: images),
              ),

              SizedBox(height: 20.h),
              const FeeWidget(fee: '50'),

              SizedBox(height: 40.h),
              BlocConsumer<OrdersCubit, OrdersState>(
                listener: (context, state) {
                  if (state is CreateOrderError) {
                    snackBarService.showError(message: state.message);
                  } else if (state is CreateOrderSuccess) {
                    snackBarService.showSuccess(message: 'Done');
                    AppRoutes.toNavBarScreen();
                  }
                },
                builder: (context, state) {
                  if (state is CreateOrderLoading) {
                    return const AppLoading();
                  }
                  return CustomButton(
                    label: 'Confirm Order',
                    onPressed: () async {
                      final addressId = id.value;
                      final selectedImages = images.value;
                      final orderType = type.value;

                      final formData = FormData.fromMap({
                        'service_category_id': widget.serviceCategoryId,
                        'address_id': addressId,
                        'type': orderType.toLowerCase(),
                        'description': problemDescriptionController.text.trim(),
                        'operation_id': widget.opId,
                        'images': [
                          for (final image in selectedImages)
                            await MultipartFile.fromFile(
                              image.path,
                              filename: image.name,
                            ),
                        ],
                      });

                      context.read<OrdersCubit>().createOrder(
                        formData: formData,
                      );
                      log(formData.fields.toString());
                      log(formData.files.toString());
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
