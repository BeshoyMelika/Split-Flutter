import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class GroupSendUIModel extends Equatable {
  String? imageURL;
  String groupName;
  String type;
  String typeOfSplit;
  String currency;
  String discription;

  GroupSendUIModel(
      {required this.imageURL,
      required this.groupName,
      required this.type,
      required this.currency,
      required this.discription,
      required this.typeOfSplit});
  static GroupSendUIModel groupModel = GroupSendUIModel(
    imageURL: "",
    groupName: "",
    type: "",
    currency: "",
    discription: "",
    typeOfSplit: "",
  );

  @override
  List<Object?> get props => [
        imageURL,
        groupName,
        groupName,
        type,
        typeOfSplit,
        currency,
        discription,
      ];
}
