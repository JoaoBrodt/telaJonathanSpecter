import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:demeter_app/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(HomeState initialState) : super(initialState);

  void changeIndex(int index) => emit(state.copyWith(pageIndex: index));

  void dashboardScreen() => emit(state.copyWith(pageIndex: 0));

  void rhScreen() => emit(state.copyWith(pageIndex: 1));

  void refundScreen() => emit(state.copyWith(pageIndex: 2));

  void moreScreen() => emit(state.copyWith(pageIndex: 3));
}
