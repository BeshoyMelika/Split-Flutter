import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class GroupModel extends Equatable {
  String? image;
  String groupName;
  String type;
  String typeOfSplit;

  String currency;
  String discription;

  GroupModel(
      {required this.image,
      required this.groupName,
      required this.type,
      required this.currency,
      required this.discription,
      required this.typeOfSplit});
  static GroupModel groupModel = GroupModel(
      image: "",
      groupName: "",
      type: "",
      currency: "",
      discription: "",
      typeOfSplit: "");

  @override
  List<Object?> get props => [];
}
