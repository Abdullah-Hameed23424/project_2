class OrderResponse {
  final List<OrderData> data;

  OrderResponse({required this.data});

  factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
    data: List<OrderData>.from(json['data'].map((x) => OrderData.fromJson(x))),
  );
}

class OrderData {
  final int id;
  final String status; //
  final String type; //
  final String kind; //
  final int serviceCategoryId;

  final String description; //
  final dynamic scheduledAt;
  final dynamic arrivedAt;
  final dynamic partsWaitingUntil;

  final DateTime createdAt;

  OrderData({
    required this.id,
    required this.status,
    required this.type,
    required this.kind,
    required this.serviceCategoryId,
    required this.description,
    required this.scheduledAt,
    required this.arrivedAt,
    required this.partsWaitingUntil,
    required this.createdAt,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
    id: json['id'],
    status: json['status'],
    type: json['type'],
    kind: json['kind'],
    serviceCategoryId: json['service_category_id'],
    description: json['description'],
    scheduledAt: json['scheduled_at'],
    arrivedAt: json['arrived_at'],
    partsWaitingUntil: json['parts_waiting_until'],
    createdAt: DateTime.parse(json['created_at']),
  );
}
