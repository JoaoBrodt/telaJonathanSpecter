import 'package:demeter_app/features/refund/domain/entities/refund_model.dart';

extension RefundDto on RefundEntity {
  static RefundEntity fromJson(Map<String, dynamic> json) {
    return RefundEntity(
      description: json['description'] ?? "",
      type: json['type'] ?? "",
      status: json['status'] ?? "",
      value: json['value'] ?? "",
      date: json['date'] ?? "",
      dateStart: json['dateStart'] ?? "",
      dateEnd: json['dateEnd'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['description'] = description;
    _data['type'] = type;
    _data['status'] = status;
    _data['value'] = value;
    _data['date'] = date;
    _data['dateStart'] = dateStart;
    _data['dateEnd'] = dateEnd;
    return _data;
  }
}
