import 'package:demeter_app/core/navigation/screens_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:demeter_app/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeCubit extends Cubit<HomeState> {
  final AppLocalizations _localizations;
  HomeCubit(HomeState initialState, AppLocalizations localizations)
      : _localizations = localizations,
        super(initialState);

  void changeScreen(Screens screen) {
    switch (screen) {
      case Screens.dashboard:
        dashboardScreen();
        break;
      case Screens.rh:
        rhScreen();
        break;
      case Screens.refund:
        refundScreen();
        break;
      default:
        moreScreen();
    }
  }

  void dashboardScreen() => emit(state.copyWith(
      screen: Screens.dashboard, title: _localizations.dashboardScreen));

  void rhScreen() =>
      emit(state.copyWith(screen: Screens.rh, title: _localizations.rhScreen));

  void refundScreen() => emit(state.copyWith(
      screen: Screens.refund, title: _localizations.refundScreen));

  void moreScreen() => emit(
      state.copyWith(screen: Screens.more, title: _localizations.moreScreen));
}
