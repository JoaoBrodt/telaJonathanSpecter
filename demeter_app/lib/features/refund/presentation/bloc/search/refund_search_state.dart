import 'package:demeter_app/features/refund/presentation/dtos/refund_dto.dart';
import 'package:equatable/equatable.dart';

abstract class RefundSearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

//Approved
class RefundSearchInitialState extends RefundSearchState {
  RefundSearchInitialState() : super();
}

class RefundSearchLoadingState extends RefundSearchState {
  RefundSearchLoadingState();
}

class RefundSearchSuccessState extends RefundSearchState {
  List<RefundDto> _refundsApproved;
  List<RefundDto> get refunds => _refundsApproved;

  RefundSearchSuccessState(List<RefundDto> refundsApproved)
      : _refundsApproved = refundsApproved;

  @override
  List<Object> get props => [_refundsApproved];
}

class RefundSearchFailureState extends RefundSearchState {
  RefundSearchFailureState();
}

//Pending
class RefundSearchPedingLoadingState extends RefundSearchState {
  RefundSearchPedingLoadingState();
}

class RefundSearchPedingSuccessState extends RefundSearchState {
  List<RefundDto> _refundsPending;
  RefundSearchPedingSuccessState(List<RefundDto> refundsPending)
      : _refundsPending = refundsPending;

  List<RefundDto> get refunds => _refundsPending;

  @override
  List<Object> get props => [_refundsPending];
}

//refused
