import 'package:demeter_app/core/navigation/screens_enum.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final Screens screen;

  const HomeState({this.screen = Screens.dashboard});

  HomeState copyWith({
    required Screens screen,
  }) {
    return HomeState(screen: screen);
  }

  @override
  List<Object?> get props => [screen];
}
