import 'package:project_2/modules/orders/models/order_data.dart';

class OrderResponse {
  final List<OrderData> data;

  OrderResponse({required this.data});

  factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
    data: List<OrderData>.from(json['data'].map((x) => OrderData.fromJson(x))),
  );
}
