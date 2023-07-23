part of 'groups_manger_bloc.dart';

abstract class GroupsMangerState extends Equatable {
  const GroupsMangerState();

  @override
  List<Object> get props => [];
}

class GroupItemIsPinnedState extends GroupsMangerState {
  final bool isPinned;
  const GroupItemIsPinnedState({
    required this.isPinned,
  });

  @override
  List<Object> get props => [isPinned];
}

///
/// these are the states of allGroups list
///
class GroupsMangerInitialState extends GroupsMangerState {}

class AllGroupsListLoadingState extends GroupsMangerState {}

class GroupsListIsEmptyState extends GroupsMangerState {
  @override
  List<Object> get props => [];
}

class AllGroupsListLoadedState extends GroupsMangerState {
  final List<GroupItemDate> allGroupsList;
  final List<GroupItemDate> pinnedGroupsList;

  const AllGroupsListLoadedState(this.allGroupsList, this.pinnedGroupsList);

  @override
  List<Object> get props => [
        allGroupsList, pinnedGroupsList,
        //this to make the state rebuild after every pin or unPin event
        identityHashCode(this)
      ];
}

class GroupsListLoadingFailedState extends GroupsMangerState {
  final String filedMsg;
  const GroupsListLoadingFailedState({
    required this.filedMsg,
  });
  @override
  List<Object> get props => [filedMsg];
}
