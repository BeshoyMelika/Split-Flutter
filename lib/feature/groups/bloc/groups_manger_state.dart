// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'groups_manger_bloc.dart';

abstract class GroupsMangerState extends Equatable {
  const GroupsMangerState();

  @override
  List<Object> get props => [];
}

///
/// these are the states of allGroups list
///
class GroupsMangerInitialState extends GroupsMangerState {}

class AllGroupsListLoadingState extends GroupsMangerState {}

class EmptyGroupsListState extends GroupsMangerState {}

class AllGroupsListLoadedState extends GroupsMangerState {
  final List<GroupItemDate> allGroupsList;
  final List<GroupItemDate> pinnedGroupsList;

  const AllGroupsListLoadedState(this.allGroupsList, this.pinnedGroupsList);

  @override
  List<Object> get props => [allGroupsList, pinnedGroupsList];
}

class GroupsListLoadingFailedState extends GroupsMangerState {
  final String filedMsg;
  const GroupsListLoadingFailedState({
    required this.filedMsg,
  });
}
