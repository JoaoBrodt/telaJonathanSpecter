import 'package:demeter_app/features/refund/domain/entities/refund_model.dart';
import 'package:demeter_app/features/refund/domain/export.dart';
import 'package:demeter_app/features/refund/presentation/bloc/export.dart';
import 'package:demeter_app/features/refund/presentation/dtos/refund_dto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RefundSearchBloc extends Bloc<RefundEvent, RefundSearchState> {
  final SearchRefundService _searchRefund;
  RefundSearchBloc(SearchRefundService searchRefund)
      : _searchRefund = searchRefund,
        super(RefundSearchInitialState()) {
    on<RefundEventStart>(_onStart);
    on<RefundSearchEvent>(_onSearch);
    on<RefundSearchPendingEvent>(_onSearchPending);
  }

  _onStart(RefundEventStart event, Emitter<RefundSearchState> emit) {
    emit(RefundSearchSuccessState([]));
  }

  Future<void> _onSearch(
      RefundEvent event, Emitter<RefundSearchState> emit) async {
    emit(RefundSearchLoadingState());
    final result = await _searchRefund('APPROVED');
    result.fold((error) {
      emit(RefundSearchFailureState());
    }, (result) {
      emit(RefundSearchSuccessState(result.map(createSearchDto).toList()));
    });
  }

  Future<void> _onSearchPending(
      RefundEvent event, Emitter<RefundSearchState> emit) async {
    emit(RefundSearchPedingLoadingState());
    final result = await _searchRefund('PENDING');
    result.fold((error) {
      emit(RefundSearchFailureState());
    }, (result) {
      emit(
          RefundSearchPedingSuccessState(result.map(createSearchDto).toList()));
    });
  }

  RefundDto createSearchDto(RefundEntity e) {
    return RefundDto(
      description: e.description,
      type: e.type,
      date: e.date,
      dateEnd: e.dateEnd,
      dateStart: e.dateStart,
      status: e.status,
      value: e.value,
    );
  }

  void searchApproved() {
    add(RefundSearchEvent());
  }

  void searchPending() {
    add(RefundSearchPendingEvent());
  }
}
