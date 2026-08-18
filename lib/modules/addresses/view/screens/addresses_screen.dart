import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/services/snackbar_service.dart';
import 'package:project_2/core/theme/app_status_bar_theme.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/widgets/app_loading.dart';
import 'package:project_2/core/widgets/loading_dialog.dart';
import 'package:project_2/core/widgets/pop_button.dart';
import 'package:project_2/core/widgets/try_again.dart';
import 'package:project_2/modules/addresses/cubit/addresses_cubit.dart';
import 'package:project_2/modules/addresses/view/widgets/addresses_list.dart';
import 'package:project_2/modules/addresses/view/widgets/demo_image.dart';
import 'package:project_2/modules/addresses/view/widgets/no_addresses.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({super.key});

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  late final GlobalKey<LoadingDialogState> loadKey;

  @override
  void initState() {
    loadKey = GlobalKey<LoadingDialogState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddressesCubit>(
      create: (context) => AddressesCubit()..getMyAddresses(),
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: AppStatusBarTheme.lightnessStatusBar,
          leading: const PopButton(color: AppColors.black),
          title: Text(
            'My Addresses',
            style: context.titleSmall26.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),

        body: BlocConsumer<AddressesCubit, AddressesState>(
          listener: (context, state) {
            if (state is DeleteAddressLoading) {
              LoadingDialog.show(loadKey);
            } else if (state is DeleteAddressError) {
              snackBarService.showError(message: state.message);
            } else if (state is DeleteAddressSuccess) {
              snackBarService.showSuccess(message: 'Deleted successfully');
            }
            LoadingDialog.hide(loadKey);
          },
          builder: (context, state) {
            final AddressesCubit cubit = context.read<AddressesCubit>();
            if (state is AddressesLoading) {
              return const AppLoading();
            } else if (state is AddressesError) {
              return TryAgain(
                onTap: cubit.getMyAddresses,
                message: state.message,
              );
            }
            if (cubit.addresses.isEmpty) {
              return const NoAddresses();
            }
            return CustomScrollView(
              slivers: <Widget>[
                const DemoImage(),
                AddressesList(addresses: cubit.addresses),
              ],
            );
          },
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.primary,
          child: const Icon(Icons.add_location, color: AppColors.white),
        ),
      ),
    );
  }
}
