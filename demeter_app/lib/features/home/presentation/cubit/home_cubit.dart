import 'package:demeter_app/core/navigation/screens_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:demeter_app/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(HomeState initialState) : super(initialState);

  void changeScreen(Screens screen) => emit(state.copyWith(screen: screen));

  void dashboardScreen() => emit(state.copyWith(screen: Screens.dashboard));

  void rhScreen() => emit(state.copyWith(screen: Screens.rh));

  void refundScreen() => emit(state.copyWith(screen: Screens.refund));

  void moreScreen() => emit(state.copyWith(screen: Screens.more));
}
