import 'package:flutter/material.dart';
import 'package:split/feature/groups/screen/group_manger_screen.dart';

// here list of available screens
//but your screen here
List<Widget> bottomNavScreen = <Widget>[
  GroupsMangerScreen(),
  const Center(child: Text('friends')),
  const Center(child: Text('activity')),
  const Center(child: Text('account')),
];
