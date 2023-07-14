// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'groups_manger_bloc.dart';

abstract class GroupsMangerEvent extends Equatable {
  const GroupsMangerEvent();

  @override
  List<Object> get props => [];
}

class PinItemSwitcherEvent extends GroupsMangerEvent {
  final GroupItemDate groupItemDate;

  const PinItemSwitcherEvent(this.groupItemDate);
  @override
  List<Object> get props => [identityHashCode(this)];
}

class AddItemEvent extends GroupsMangerEvent {
  final GroupItemDate groupItemDate;

  const AddItemEvent(this.groupItemDate);
  @override
  List<Object> get props => [groupItemDate];
}

class GetGroupsDataEvent extends GroupsMangerEvent {}

class CheckGroupPinnedOrNotEvent extends GroupsMangerEvent {
  final GroupItemDate groupItemDate;
  const CheckGroupPinnedOrNotEvent({
    required this.groupItemDate,
  });
}
