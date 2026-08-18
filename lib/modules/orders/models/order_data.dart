import 'package:project_2/core/utils/model_parser.dart';
import 'package:project_2/modules/orders/models/order_status.dart';
import 'package:project_2/modules/orders/models/order_type.dart';

class OrderData {
  final int id;
  final OrderStatus status;
  final OrderType type;
  final String kind;
  final int serviceCategoryId;
  final String serviceCategoryName;

  final String description;
  final dynamic scheduledAt;

  final String inspectionFee;

  OrderData({
    required this.id,
    required this.status,
    required this.type,
    required this.kind,
    required this.serviceCategoryId,
    required this.serviceCategoryName,

    required this.description,
    required this.scheduledAt,
    required this.inspectionFee,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
    id: ModelParser.intValue(json['id']),
    status: OrderStatus.fromValue(json['status']),
    type: OrderType.fromValue(json['type']),
    kind: ModelParser.stringValue(json['kind']),
    serviceCategoryId: json['service_category_id'],
    serviceCategoryName: ModelParser.stringValue(json['service_category_name']),
    description: ModelParser.stringValue(json['description']),
    scheduledAt: ModelParser.stringValue(json['scheduled_at']),
    inspectionFee: json['inspection_fee'],
  );
}
