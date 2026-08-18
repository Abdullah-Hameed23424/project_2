import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_2/core/api/api_endpoints.dart';
import 'package:project_2/core/api/network_client.dart';
import 'package:project_2/core/error/error_handler/exception_handler.dart';
import 'package:project_2/modules/addresses/models/address_data.dart';
import 'package:project_2/modules/addresses/models/addresses_response.dart';

part 'addresses_state.dart';

class AddressesCubit extends Cubit<AddressesState> {
  AddressesCubit() : super(AddressesInitial());

  List<AddressData> addresses = [];
  Future<void> getMyAddresses() async {
    emit(AddressesLoading());
    try {
      final Response<dynamic> response = await NetworkClient.get(
        url: ApiEndpoints.addresses,
      );

      addresses = AddressesResponse.fromJson(response.data).data;
      if (isClosed) return;
      emit(AddressesSuccess());
    } catch (e, s) {
      if (isClosed) return;
      logApiName('getMyAddresses');
      emit(AddressesError(message: handleError(e, stackTrace: s)));
    }
  }

  Future<void> deleteAddress({required int addressId}) async {
    emit(DeleteAddressLoading());
    try {
      await NetworkClient.delete(url: '${ApiEndpoints.addresses}/$addressId');

      addresses.removeWhere((element) => element.id == addressId);
      if (isClosed) return;
      emit(DeleteAddressSuccess());
    } catch (e, s) {
      if (isClosed) return;
      logApiName('deleteAddress');
      emit(DeleteAddressError(message: handleError(e, stackTrace: s)));
    }
  }
}
