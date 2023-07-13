import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:split/feature/groups/data/models/group_item_data.dart';
import 'package:split/feature/groups/data/repositories/groups_parent_repo.dart';

part 'groups_manger_event.dart';
part 'groups_manger_state.dart';

class GroupsMangerBloc extends Bloc<GroupsMangerEvent, GroupsMangerState> {
  final GroupsParentRepo groupsParentRepo;
  GroupsMangerBloc(this.groupsParentRepo) : super(GroupsMangerInitialState()) {
    ///
    on<PinItemSwitcherEvent>(_onPinItemSwitcherEvent);
    //
    on<GetGroupsDataEvent>(_onGetGroupsData);
  }
//
  void _onGetGroupsData(
    GetGroupsDataEvent event,
    Emitter<GroupsMangerState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    emit(AllGroupsListLoadingState());
    final List<GroupItemDate> allGroupsList = groupsParentRepo.allGroupsList;
    final List<GroupItemDate> pinnedGroupsList =
        groupsParentRepo.pinnedGroupsList;
    try {
      if (allGroupsList.isEmpty && pinnedGroupsList.isEmpty) {
        emit(EmptyGroupsListState());
      } else {
        emit(AllGroupsListLoadedState(allGroupsList, pinnedGroupsList));
      }
    } catch (e) {
      emit(const GroupsListLoadingFailedState(filedMsg: ''));
    }
  }

  FutureOr<void> _onPinItemSwitcherEvent(
      PinItemSwitcherEvent event, Emitter<GroupsMangerState> emit) {
    final List<GroupItemDate> allGroupsList = groupsParentRepo.allGroupsList;
    GroupItemDate groupItemDate = allGroupsList[event.index];

    // this action for unPin the group and make back to it's old index
    int originalIndex = allGroupsList.indexOf(groupItemDate);
    final List<GroupItemDate> pinnedGroupsList =
        groupsParentRepo.pinnedGroupsList;
    if (pinnedGroupsList.contains(groupItemDate)) {
      pinnedGroupsList.remove(groupItemDate);
      allGroupsList.add(groupItemDate);

      // this action for pin group
    } else if (allGroupsList.contains(groupItemDate)) {
      allGroupsList.remove(groupItemDate);
      pinnedGroupsList.add(groupItemDate);

      emit(AllGroupsListLoadedState(allGroupsList, pinnedGroupsList));
      //}
    }
  }
}
