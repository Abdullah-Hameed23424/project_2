enum OrderType {
  urgent,
  scheduled;

  String get value {
    switch (this) {
      case OrderType.urgent:
        return 'urgent';
      case OrderType.scheduled:
        return 'scheduled';
    }
  }

  static OrderType fromValue(String value) {
    switch (value) {
      case 'urgent':
        return OrderType.urgent;
      case 'scheduled':
        return OrderType.scheduled;
      default:
        return OrderType.urgent;
    }
  }
}
