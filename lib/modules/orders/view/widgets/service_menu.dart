import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/widgets/app_loading.dart';
import 'package:project_2/core/widgets/try_again.dart';
import 'package:project_2/modules/addresses/cubit/addresses_cubit.dart';
import 'package:project_2/modules/addresses/models/address_data.dart';

class ServiceMenu extends StatelessWidget {
  final ValueNotifier<int> id;
  const ServiceMenu({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddressesCubit>(
      create: (context) => AddressesCubit()..getMyAddresses(),
      child: SizedBox(
        child: BlocBuilder<AddressesCubit, AddressesState>(
          builder: (context, state) {
            if (state is AddressesError) {
              return TryAgain(
                onTap: () {
                  context.read<AddressesCubit>().getMyAddresses();
                },
                message: state.message,
              );
            } else if (state is AddressesLoading) {
              return const AppLoading();
            } else if (state is AddressesSuccess) {
              final addresses = context.read<AddressesCubit>().addresses;
              return DropdownMenu<AddressData>(
                width: 1.sw - 32.w,
                hintText: 'Location',
                leadingIcon: const Icon(Icons.location_on_outlined),
                textStyle: context.bodyMedium16,
                onSelected: (value) {
                  id.value = value?.id ?? -1;
                },
                menuStyle: const MenuStyle(
                  backgroundColor: WidgetStatePropertyAll(AppColors.white),
                ),
                inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                dropdownMenuEntries: addresses
                    .map(
                      (address) => DropdownMenuEntry(
                        value: address,
                        label: address.label,
                      ),
                    )
                    .toList(),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
