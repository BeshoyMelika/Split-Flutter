part of 'groups_manger_bloc.dart';

abstract class GroupsMangerEvent extends Equatable {
  const GroupsMangerEvent();

  @override
  List<Object> get props => [];
}

class PinItemSwitcherEvent extends GroupsMangerEvent {
  final int index;

  const PinItemSwitcherEvent(this.index);
  @override
  List<Object> get props => [index];
}

class AddItemEvent extends GroupsMangerEvent {
  final GroupItemDate groupItemDate;

  const AddItemEvent(this.groupItemDate);
  @override
  List<Object> get props => [groupItemDate];
}

class StartBlocEvent extends GroupsMangerEvent {}
