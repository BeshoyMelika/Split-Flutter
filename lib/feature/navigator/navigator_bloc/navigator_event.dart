import 'package:equatable/equatable.dart';

abstract class NavigatorEvent extends Equatable {}

class NavigateToGroupScreenEvent extends NavigatorEvent {
  @override
  List<Object?> get props => [];
}

class NavigateToFriendsScreenEvent extends NavigatorEvent {
  @override
  List<Object?> get props => [];
}

class NavigateToActivityScreenEvent extends NavigatorEvent {
  @override
  List<Object?> get props => [];
}

class NavigateToProfileScreenEvent extends NavigatorEvent {
  @override
  List<Object?> get props => [];
}
