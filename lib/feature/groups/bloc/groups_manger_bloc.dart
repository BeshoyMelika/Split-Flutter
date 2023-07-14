import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:split/feature/groups/data/models/group_item_data.dart';
import 'package:split/feature/groups/data/repositories/groups_parent_repo.dart';

part 'groups_manger_event.dart';
part 'groups_manger_state.dart';

class GroupsMangerBloc extends Bloc<GroupsMangerEvent, GroupsMangerState> {
  final GroupsParentRepo groupsParentRepo;
  List<GroupItemDate> allGroupsList = [];
  List<GroupItemDate> pinnedGroupsList = [];
  GroupsMangerBloc(this.groupsParentRepo) : super(GroupsMangerInitialState()) {
    ///
    on<PinItemSwitcherEvent>(_onPinItemSwitcherEvent);
    //
    on<GetGroupsDataEvent>(_onGetGroupsData);
    //
    on<CheckGroupPinnedOrNotEvent>(_onCheckGroupPinnedOrNotEvent);
  }
//
  void _onGetGroupsData(
    GetGroupsDataEvent event,
    Emitter<GroupsMangerState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    emit(AllGroupsListLoadingState());
    allGroupsList = groupsParentRepo.allGroupsList;
    pinnedGroupsList = groupsParentRepo.pinnedGroupsList;
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
    //
    debugPrint(event.groupItemDate.friendsNumber.toString());
    event.groupItemDate.isPinned = !event.groupItemDate.isPinned;
    if (event.groupItemDate.isPinned) {
      // this action for unPin the group and make back to it's old index
      pinnedGroupsList.add(event.groupItemDate);
      allGroupsList.remove(event.groupItemDate);
      // this action for pin group
    } else {
      allGroupsList.add(event.groupItemDate);
      pinnedGroupsList.remove(event.groupItemDate);
    }

    emit(AllGroupsListLoadedState(allGroupsList, pinnedGroupsList));
  }

  void _onCheckGroupPinnedOrNotEvent(
    CheckGroupPinnedOrNotEvent event,
    Emitter<GroupsMangerState> emit,
  ) async {
    final List<GroupItemDate> pinnedGroupsList =
        groupsParentRepo.pinnedGroupsList;
    if (pinnedGroupsList.contains(event.groupItemDate)) {
      emit(const GroupItemIsPinnedState(isPinned: true));
    } else {
      emit(const GroupItemIsPinnedState(isPinned: false));
    }
  }
}
