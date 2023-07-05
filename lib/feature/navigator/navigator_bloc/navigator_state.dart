abstract class NavigatorStates {
  final int tabIndex;

  const NavigatorStates({required this.tabIndex});
}

class NavigatorInitialState extends NavigatorStates {
  const NavigatorInitialState({required super.tabIndex});
}
