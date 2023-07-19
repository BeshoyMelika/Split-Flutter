import 'package:split/feature/groups/data/models/group_item_data.dart';
import 'package:split/feature/groups/data/repositories/groups_data_parent_repo.dart';

class DemyGroupsDataRepo extends GroupsDataParentRepo {
  @override
  List<GroupItemDate> get allGroupsList => [
        GroupItemDate(
            imagePath:
                'https://cdn2.vectorstock.com/i/1000x1000/03/11/home-house-building-and-family-design-vector-10680311.jpg',
            groupName: 'home',
            friendsNumber: 1,
            expensesValue: '5',
            isPinned: false),
        GroupItemDate(
            imagePath:
                'https://cdn2.vectorstock.com/i/1000x1000/03/11/home-house-building-and-family-design-vector-10680311.jpg',
            friendsNumber: 2,
            expensesValue: '55',
            groupName: 'home',
            isPinned: false),
        GroupItemDate(
            imagePath:
                'https://cdn2.vectorstock.com/i/1000x1000/03/11/home-house-building-and-family-design-vector-10680311.jpg',
            groupName: 'home',
            friendsNumber: 3,
            expensesValue: '555',
            isPinned: false),
        GroupItemDate(
            imagePath:
                'https://cdn2.vectorstock.com/i/1000x1000/03/11/home-house-building-and-family-design-vector-10680311.jpg',
            friendsNumber: 4,
            expensesValue: '55',
            groupName: 'home',
            isPinned: false),
        GroupItemDate(
            imagePath:
                'https://cdn2.vectorstock.com/i/1000x1000/03/11/home-house-building-and-family-design-vector-10680311.jpg',
            friendsNumber: 4,
            expensesValue: '55',
            groupName: 'home',
            isPinned: false),
        GroupItemDate(
            imagePath:
                'https://cdn2.vectorstock.com/i/1000x1000/03/11/home-house-building-and-family-design-vector-10680311.jpg',
            friendsNumber: 4,
            expensesValue: '55',
            groupName: 'home',
            isPinned: false),
        GroupItemDate(
            imagePath:
                'https://cdn2.vectorstock.com/i/1000x1000/03/11/home-house-building-and-family-design-vector-10680311.jpg',
            friendsNumber: 4,
            expensesValue: '55',
            groupName: 'home',
            isPinned: false),
      ];

  @override
  List<GroupItemDate> get pinnedGroupsList => [
        GroupItemDate(
            imagePath:
                'https://cdn2.vectorstock.com/i/1000x1000/03/11/home-house-building-and-family-design-vector-10680311.jpg',
            friendsNumber: 4,
            expensesValue: '55',
            groupName: 'home',
            isPinned: true),
      ];
}
