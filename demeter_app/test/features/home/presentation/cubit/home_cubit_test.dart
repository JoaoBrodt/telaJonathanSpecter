import 'package:bloc_test/bloc_test.dart';
import 'package:demeter_app/core/navigation/screens_enum.dart';
import 'package:demeter_app/features/home/presentation/cubit/export.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mocktail/mocktail.dart';

class MockAppLocalizations extends Mock implements AppLocalizations {
  @override
  final dashboardScreen = 'Dashboard';
  @override
  final rhScreen = 'RH';
  @override
  final refundScreen = 'Refund';
  @override
  final historicScreen = 'Historic';
  @override
  final moreScreen = 'More';
  MockAppLocalizations();
}

void main() {
  final MockAppLocalizations mockAppLocalizations = MockAppLocalizations();
  group('HomeCubit Tests', () {
    test('initial state is correct', () {
      final homeCubit = HomeCubit(const HomeState(), mockAppLocalizations);
      expect(homeCubit.state, const HomeState(screen: Screens.dashboard));
    });
  });

  group('HomeCubit screens index', () {
    const dashboardScreenSelected =
        HomeState(screen: Screens.dashboard, title: 'Dashboard');
    const rhScreenSelected = HomeState(screen: Screens.rh, title: 'RH');
    const refundScreenSelected =
        HomeState(screen: Screens.refund, title: 'Refund');
    const historicScreenSelected =
        HomeState(screen: Screens.historic, title: 'Historic');
    const moreScreenSelected = HomeState(screen: Screens.more, title: 'More');
    blocTest<HomeCubit, HomeState>(
      'emits screen dashboard select',
      build: () => HomeCubit(const HomeState(), mockAppLocalizations),
      act: (cubit) => cubit.dashboardScreen(),
      expect: () => [dashboardScreenSelected],
    );

    blocTest<HomeCubit, HomeState>(
      'emits screen rh select',
      build: () => HomeCubit(const HomeState(), mockAppLocalizations),
      act: (cubit) => cubit.rhScreen(),
      expect: () => [rhScreenSelected],
    );

    blocTest<HomeCubit, HomeState>(
      'emits screen refund select',
      build: () => HomeCubit(const HomeState(), mockAppLocalizations),
      act: (cubit) => cubit.refundScreen(),
      expect: () => [refundScreenSelected],
    );

    blocTest<HomeCubit, HomeState>(
      'emits screen historic select',
      build: () => HomeCubit(const HomeState(), mockAppLocalizations),
      act: (cubit) => cubit.historicScreen(),
      expect: () => [historicScreenSelected],
    );

    blocTest<HomeCubit, HomeState>(
      'emits screen more select',
      build: () => HomeCubit(const HomeState(), mockAppLocalizations),
      act: (cubit) => cubit.moreScreen(),
      expect: () => [moreScreenSelected],
    );
  });
}
