import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateful_widget.dart';
import 'package:split/feature/home/widget/home_screen_list_item.dart';

class TypesItemsList extends BaseStatefulWidget {
  const TypesItemsList(this.listIcons, this.listStrings, this.scrollPhysics,
      {Key? key})
      : super(key: key);
  final List<IconData>? listIcons;
  final List<String> listStrings;
  final ScrollPhysics scrollPhysics;
  @override
  BaseState<TypesItemsList> baseCreateState() => _TypesItemsListState();
}

class _TypesItemsListState extends BaseState<TypesItemsList> {
  int isSelected = -1;

  @override
  Widget baseBuild(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: ListView.builder(
          physics: widget.scrollPhysics,
          scrollDirection: Axis.horizontal,
          itemExtent: 110,
          itemCount: widget.listStrings.length,
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  setState(() {
                    isSelected = index;
                  });
                },
                child: widget.listIcons == null
                    ? HomeScreenListItem(
                        null,
                        text: translate(widget.listStrings[index])!,
                        selected: isSelected == index,
                      )
                    : HomeScreenListItem.withIcon(
                        icon: widget.listIcons![index],
                        text: translate(widget.listStrings[index])!,
                        selected: isSelected == index,
                      ),
              )),
    );
  }
}
