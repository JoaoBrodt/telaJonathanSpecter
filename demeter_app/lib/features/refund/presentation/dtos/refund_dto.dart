import 'package:demeter_app/core/date_worker.dart';

class RefundDto {
  final String description;
  final String type;
  final String status;
  final String value;
  final String date;
  final String dateStart;
  final String dateEnd;
  String dateStartFormatted = '';
  String dateEndFormatted = '';
  String dateFormatted = '';

  RefundDto({
    this.description = "",
    this.type = "",
    this.status = "",
    this.value = "",
    this.date = "",
    this.dateStart = "",
    this.dateEnd = "",
  }) {
    final parser = DateWorker.parser();
    final formatter = DateWorker.formmatter();
    if (dateStart.isNotEmpty) {
      dateStartFormatted = formatter.format(parser.parse(dateStart));
      dateEndFormatted = formatter.format(parser.parse(dateEnd));
    }
    if (date.isNotEmpty) {
      dateFormatted = formatter.format(parser.parse(date));
    }
  }

  RefundDto copyWith({
    String? description,
    String? type,
    String? status,
    String? value,
    String? date,
    String? dateStart,
    String? dateEnd,
  }) {
    return RefundDto(
      description: description ?? this.description,
      type: type ?? this.type,
      status: status ?? this.status,
      value: value ?? this.value,
      date: date ?? this.date,
      dateStart: dateStart ?? this.dateStart,
      dateEnd: dateEnd ?? this.dateStart,
    );
  }
}
