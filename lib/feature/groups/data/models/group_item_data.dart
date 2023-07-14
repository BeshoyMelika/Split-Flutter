import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class GroupItemDate {
  final String imagePath;
  final String groupName;
  final int friendsNumber;
  final String expensesValue;
  bool isPinned;

  GroupItemDate({
    required this.groupName,
    required this.imagePath,
    required this.friendsNumber,
    required this.expensesValue,
    required this.isPinned,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'groupName': groupName,
      'imagePath': imagePath,
      'friendsNumber': friendsNumber,
      'expensesValue': expensesValue,
      'isPined': isPinned,
    };
  }

  factory GroupItemDate.fromMap(Map<String, dynamic> map) {
    return GroupItemDate(
      groupName: map['groupName'] as String,
      imagePath: map['imagePath'] as String,
      friendsNumber: map['friendsNumber'] as int,
      expensesValue: map['expensesValue'] as String,
      isPinned: map['isPined'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory GroupItemDate.fromJson(String source) =>
      GroupItemDate.fromMap(json.decode(source) as Map<String, dynamic>);
}
