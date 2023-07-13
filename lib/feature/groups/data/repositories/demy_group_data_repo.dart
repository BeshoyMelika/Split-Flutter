import 'package:split/feature/groups/data/models/group_item_data.dart';
import 'package:split/feature/groups/data/repositories/groups_parent_repo.dart';

class DemyGroupsDataRepo extends GroupsParentRepo {
  /// beshoy I was trying to make a singleton pattern
  /// but it gives me error in first call at GroupsMangerScreen line 27
  // static final DemyRepoGroupsData _instance = DemyRepoGroupsData._instance;

  // ///singleton pattern
  // factory DemyRepoGroupsData() => _instance;
  // DemyRepoGroupsData._internal();

  @override
  List<GroupItemDate> get allGroupsList => [
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

        GroupItemDate(
            imagePath: 'imagePath',
            friendsNumber: 4,
            expensesValue: '55',
            groupName: 'home',
            isPined: true),
        GroupItemDate(
            imagePath: 'imagePath',
            friendsNumber: 4,
            expensesValue: '55',
            groupName: 'home',
            isPined: true),
        GroupItemDate(
            imagePath: 'imagePath',
            friendsNumber: 4,
            expensesValue: '55',
            groupName: 'home',
            isPined: true),

        // Add more items here
      ];

  @override
  List<GroupItemDate> get pinnedGroupsList => [];
}
