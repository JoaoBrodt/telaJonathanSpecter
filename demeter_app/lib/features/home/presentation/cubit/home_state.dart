import 'package:demeter_app/core/navigation/screens_enum.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final Screens screen;
  final String title;
  final bool showAppBar;

  const HomeState({
    this.screen = Screens.dashboard,
    this.title = '',
    this.showAppBar = true,
  });

  HomeState copyWith({
    required Screens screen,
    String title = '',
    bool showAppBar = true,
  }) {
    return HomeState(screen: screen, title: title, showAppBar: showAppBar);
  }

  HomeState copyState({
    required HomeState homeState,
  }) {
    return HomeState(
        screen: homeState.screen,
        title: homeState.title,
        showAppBar: homeState.showAppBar);
  }

  @override
  List<Object?> get props => [screen];
}
