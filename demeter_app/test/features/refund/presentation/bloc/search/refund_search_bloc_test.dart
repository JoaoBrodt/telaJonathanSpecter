import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:demeter_app/features/refund/domain/entities/refund_model.dart';
import 'package:demeter_app/features/refund/domain/export.dart';

import 'package:demeter_app/features/refund/domain/services/search_refund_service.dart';
import 'package:demeter_app/features/refund/presentation/bloc/export.dart';

import 'package:demeter_app/features/refund/presentation/dtos/refund_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class SearchRefundServiceMock extends Mock implements SearchRefundService {}

void main() {
  late SearchRefundService searchRefundServiceMock;
  const approvedParam = 'APPROVED';
  const pendingParam = 'PENDING';
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    searchRefundServiceMock = SearchRefundServiceMock();
    when(() => searchRefundServiceMock(approvedParam)).thenAnswer(
        (_) async => Right([_createRefundEntity(), _createRefundEntity()]));
    when(() => searchRefundServiceMock(pendingParam)).thenAnswer(
        (_) async => Right([_createRefundEntity(), _createRefundEntity()]));
  });
  group('HomeCubit Tests', () {
    test('initial state is correct', () {
      final refundSearchBlock = RefundSearchBloc(SearchRefundServiceMock());
      expect(refundSearchBlock.state, RefundSearchInitialState());
    });
  });

  group('RefundSearchBloc search for approved', () {
    blocTest<RefundSearchBloc, RefundSearchState>(
      'emits refund search for approved',
      build: () => RefundSearchBloc(searchRefundServiceMock),
      act: (bloc) => bloc.searchApproved(),
      expect: () => [
        RefundSearchLoadingState(),
        RefundSearchSuccessState([_createRefundDto(), _createRefundDto()])
      ],
    );

    blocTest<RefundSearchBloc, RefundSearchState>(
      'emits refund search for approved RefundException',
      setUp: () {
        when(() => searchRefundServiceMock(approvedParam)).thenAnswer(
          (_) async => Left(RefundException(message: 'Error')),
        );
      },
      build: () => RefundSearchBloc(searchRefundServiceMock),
      act: (bloc) => bloc.searchApproved(),
      expect: () => [RefundSearchLoadingState(), RefundSearchFailureState()],
    );
  });

  group('RefundSearchBloc search for pending', () {
    blocTest<RefundSearchBloc, RefundSearchState>(
      'emits refund search for pending',
      build: () => RefundSearchBloc(searchRefundServiceMock),
      act: (bloc) => bloc.searchPending(),
      expect: () => [
        RefundSearchPedingLoadingState(),
        RefundSearchPedingSuccessState([_createRefundDto(), _createRefundDto()])
      ],
    );

    blocTest<RefundSearchBloc, RefundSearchState>(
      'emits refund search for pending RefundException',
      setUp: () {
        when(() => searchRefundServiceMock(pendingParam)).thenAnswer(
          (_) async => Left(RefundException(message: 'Error')),
        );
      },
      build: () => RefundSearchBloc(searchRefundServiceMock),
      act: (bloc) => bloc.searchPending(),
      expect: () =>
          [RefundSearchPedingLoadingState(), RefundSearchFailureState()],
    );
  });
}

RefundEntity _createRefundEntity() {
  return RefundEntity(
      description: "description",
      type: 'BUY',
      status: 'APPROVED',
      value: '310.00',
      date: '',
      dateStart: '2021-02-12T02:00:00',
      dateEnd: '2021-02-12T02:00:00');
}

RefundDto _createRefundDto() {
  return RefundDto(
      description: "description",
      type: 'BUY',
      status: 'APPROVED',
      value: '310.00',
      date: '',
      dateStart: '2021-02-12T02:00:00',
      dateEnd: '2021-02-12T02:00:00');
}
