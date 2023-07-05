abstract class NavigatorEvent {}

class TabChange extends NavigatorEvent {
  final int tabIndex;

  TabChange({required this.tabIndex});
}
