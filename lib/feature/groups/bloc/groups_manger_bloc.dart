import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:split/feature/groups/models/group_item_data.dart';

part 'groups_manger_event.dart';
part 'groups_manger_state.dart';

class GroupsMangerBloc extends Bloc<GroupsMangerEvent, GroupsMangerState> {
  List<GroupItemDate> quickAccessGroupsList = [];
  List<GroupItemDate> allGroupsList = [
    GroupItemDate(
        imagePath: 'imagePath',
        groupName: 'home',
        friendsNumber: 1,
        expensesValue: '5',
        isPined: false),
    GroupItemDate(
        imagePath: 'imagePath',
        friendsNumber: 2,
        expensesValue: '55',
        groupName: 'home',
        isPined: true),
    GroupItemDate(
        imagePath: 'imagePath',
        groupName: 'home',
        friendsNumber: 3,
        expensesValue: '555',
        isPined: false),
    GroupItemDate(
        imagePath: 'imagePath',
        friendsNumber: 4,
        expensesValue: '55',
        groupName: 'home',
        isPined: true),
    // Add more items here
  ];
  GroupsMangerBloc() : super(GroupsMangerInitial()) {
    on<PinItemSwitcherEvent>(_onPinItemSwitcherEvent);
    // this is a temporary event to stater the block only
    // this will change wile fixing bug of hot start
    on<StartBlocEvent>(_onStartBlocEvent);
  }

  // GroupsMangerState get getInitial =>
  //     AllGroupsListItemsLoaded(allGroupsList, quickAccessGroupsList);

  FutureOr<void> _onPinItemSwitcherEvent(
      PinItemSwitcherEvent event, Emitter<GroupsMangerState> emit) {
    // if (event.index >= 0 && event.index < allGroupsList.length) {
    GroupItemDate groupItemDate = allGroupsList[event.index];

    // this action for unPin the group and make back to it's old index
    int originalIndex = allGroupsList.indexOf(groupItemDate);
    if (quickAccessGroupsList.contains(groupItemDate)) {
      quickAccessGroupsList.remove(groupItemDate);
      allGroupsList.insert(originalIndex, groupItemDate);

      // this action for pin group
    } else if (allGroupsList.contains(groupItemDate)) {
      allGroupsList.remove(groupItemDate);
      quickAccessGroupsList.add(groupItemDate);

      emit(AllGroupsListLoadedState(allGroupsList, quickAccessGroupsList));
      //}
    }
  }

  void _onStartBlocEvent(
      StartBlocEvent event, Emitter<GroupsMangerState> emit) {
    emit(AllGroupsListLoadedState(allGroupsList, quickAccessGroupsList));
  }

  /// class
}
