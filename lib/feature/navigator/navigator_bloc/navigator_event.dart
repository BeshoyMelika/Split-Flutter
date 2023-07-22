import 'package:equatable/equatable.dart';

abstract class NavigatorEvent extends Equatable {}

class MakeGroupsTheCurrentScreenEvent extends NavigatorEvent {
  @override
  List<Object?> get props => [];
}

class MakeFriendsTheCurrentScreenEvent extends NavigatorEvent {
  @override
  List<Object?> get props => [];
}

class MakeActivityTheCurrentScreenEvent extends NavigatorEvent {
  @override
  List<Object?> get props => [];
}

class MakeProfileTheCurrentScreenEvent extends NavigatorEvent {
  @override
  List<Object?> get props => [];
}
