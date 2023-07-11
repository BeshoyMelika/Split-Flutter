part of 'groups_manger_bloc.dart';

abstract class GroupsMangerState extends Equatable {
  const GroupsMangerState();

  @override
  List<Object> get props => [];
}

// these the states of QuickAccessGroups list

class QuickAccessGroupsListLoading extends GroupsMangerState {
  const QuickAccessGroupsListLoading();
}

class QuickAccessGroupsListEmpty extends GroupsMangerState {
  const QuickAccessGroupsListEmpty();
}

class QuickAccessGroupsListLoadedField extends GroupsMangerState {
  const QuickAccessGroupsListLoadedField();
}

///
/// these are the states of allGroups list
///
class GroupsMangerInitial extends GroupsMangerState {}

class AllGroupsListLoading extends GroupsMangerState {}

class AllGroupsListLoadedState extends GroupsMangerState {
  final List<GroupItemDate> allGroupsList;
  final List<GroupItemDate> quickAccessGroupsList;

  const AllGroupsListLoadedState(
      this.allGroupsList, this.quickAccessGroupsList);

  @override
  List<Object> get props => [allGroupsList, quickAccessGroupsList];
}

class GroupsListLoadingFailed extends GroupsMangerState {}
