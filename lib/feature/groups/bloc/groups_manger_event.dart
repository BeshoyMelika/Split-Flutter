// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'groups_manger_bloc.dart';

abstract class GroupsMangerEvent extends Equatable {
  const GroupsMangerEvent();

  @override
  List<Object> get props => [];
}

class PinGroupSwitcherEvent extends GroupsMangerEvent {
  final GroupItemDate groupItemDate;

  const PinGroupSwitcherEvent(this.groupItemDate);
  @override
  List<Object> get props => [groupItemDate];
}

class GetGroupsDataEvent extends GroupsMangerEvent {}

class CheckIsGroupPinnedOrNotEvent extends GroupsMangerEvent {
  final GroupItemDate groupItemDate;
  const CheckIsGroupPinnedOrNotEvent({
    required this.groupItemDate,
  });
  @override
  List<Object> get props => [groupItemDate];
}
