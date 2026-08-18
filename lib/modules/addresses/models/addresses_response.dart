import 'package:project_2/modules/addresses/models/address_data.dart';

class AddressesResponse {
  final List<AddressData> data;

  AddressesResponse({required this.data});

  factory AddressesResponse.fromJson(Map<String, dynamic> json) =>
      AddressesResponse(
        data: List<AddressData>.from(
          json['data'].map((x) => AddressData.fromJson(x)),
        ),
      );
}
