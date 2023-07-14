import 'package:flutter/material.dart';
import 'package:split/feature/groups/data/models/group_item_data.dart';
import 'package:split/feature/groups/data/repositories/demy_group_data_repo.dart';
import 'package:split/feature/groups/widgets/group_item_view.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<dynamic> listToSearch = DemyGroupsDataRepo().allGroupsList;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      // this to clear the current query
      IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<GroupItemDate> matchQuery = [];
    for (var group in listToSearch) {
      if (group.groupName.toLowerCase().contains(query)) {
        matchQuery.add(group);
      }
    }
    return ListView.builder(itemBuilder: (context, index) {
      var currentGroup = matchQuery[index];
      return GroupItemView(groupItemDate: currentGroup);
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<GroupItemDate> matchQuery = [];
    for (var group in listToSearch) {
      if (group.groupName.contains(query)) {
        matchQuery.add(group);
      }
    }
    return ListView.builder(itemBuilder: (context, index) {
      var currentGroup = matchQuery[index];
      return GroupItemView(groupItemDate: currentGroup);
    });
  }
}
