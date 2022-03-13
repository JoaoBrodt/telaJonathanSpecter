import 'package:bloc_test/bloc_test.dart';
import 'package:demeter_app/core/navigation/pages_enum.dart';
import 'package:demeter_app/features/home/presentation/cubit/export.dart';
import 'package:demeter_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeCubit Tests', () {
    test('initial state is correct', () {
      final homeCubit = HomeCubit(const HomeState());
      expect(homeCubit.state, const HomeState(screen: Screens.dashboard));
    });
  });

  group('HomeCubit screens index', () {
    const dashboardScreenSelected = HomeState(screen: Screens.dashboard);
    const rhScreenSelected = HomeState(screen: Screens.rh);
    const refundScreenSelected = HomeState(screen: Screens.refund);
    const moreScreenSelected = HomeState(screen: Screens.more);
    blocTest<HomeCubit, HomeState>(
      'emits screen dashboard select',
      build: () => HomeCubit(const HomeState()),
      act: (cubit) => cubit.dashboardScreen(),
      expect: () => [dashboardScreenSelected],
    );

    blocTest<HomeCubit, HomeState>(
      'emits screen rh select',
      build: () => HomeCubit(const HomeState()),
      act: (cubit) => cubit.rhScreen(),
      expect: () => [rhScreenSelected],
    );

    blocTest<HomeCubit, HomeState>(
      'emits screen refund select',
      build: () => HomeCubit(const HomeState()),
      act: (cubit) => cubit.refundScreen(),
      expect: () => [refundScreenSelected],
    );

    blocTest<HomeCubit, HomeState>(
      'emits screen more select',
      build: () => HomeCubit(const HomeState()),
      act: (cubit) => cubit.moreScreen(),
      expect: () => [moreScreenSelected],
    );
  });
}
