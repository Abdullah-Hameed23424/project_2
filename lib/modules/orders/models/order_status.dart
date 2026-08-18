enum OrderStatus {
  pending,
  scheduled,
  accepted,
  inProgress,
  waitingForParts,
  completed,
  disputed,
  canceled,
  inspectionOnly,
  noShow,
  expired,
  resolved;

  String get value {
    switch (this) {
      case OrderStatus.pending:
        return 'pending';
      case OrderStatus.scheduled:
        return 'scheduled';
      case OrderStatus.accepted:
        return 'accepted';
      case OrderStatus.inProgress:
        return 'in_progress';
      case OrderStatus.waitingForParts:
        return 'waiting_for_parts';
      case OrderStatus.completed:
        return 'completed';
      case OrderStatus.disputed:
        return 'disputed';
      case OrderStatus.canceled:
        return 'canceled';
      case OrderStatus.inspectionOnly:
        return 'inspection_only';
      case OrderStatus.noShow:
        return 'no_show';
      case OrderStatus.expired:
        return 'expired';
      case OrderStatus.resolved:
        return 'resolved';
    }
  }

  static OrderStatus fromValue(String? value) {
    switch (value) {
      case 'pending':
        return OrderStatus.pending;
      case 'scheduled':
        return OrderStatus.scheduled;
      case 'accepted':
        return OrderStatus.accepted;
      case 'in_progress':
        return OrderStatus.inProgress;
      case 'waiting_for_parts':
        return OrderStatus.waitingForParts;
      case 'completed':
        return OrderStatus.completed;
      case 'disputed':
        return OrderStatus.disputed;
      case 'canceled':
        return OrderStatus.canceled;
      case 'inspection_only':
        return OrderStatus.inspectionOnly;
      case 'no_show':
        return OrderStatus.noShow;
      case 'expired':
        return OrderStatus.expired;
      case 'resolved':
        return OrderStatus.resolved;
      default:
        return OrderStatus.pending;
    }
  }
}
