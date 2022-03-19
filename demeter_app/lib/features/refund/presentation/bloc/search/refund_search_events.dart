import 'package:equatable/equatable.dart';

abstract class RefundEvent extends Equatable {
  const RefundEvent();

  @override
  List<Object> get props => [];
}

class RefundEventStart extends RefundEvent {
  const RefundEventStart();
}

class RefundSearchEvent extends RefundEvent {}

class RefundSearchPendingEvent extends RefundEvent {}
