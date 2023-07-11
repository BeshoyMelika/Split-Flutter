// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:split/core/widgets/base_stateless_widget.dart';
// import 'package:split/feature/app_widgets/global_app_bar.dart';
// import 'package:split/feature/navigator/navigator_bloc/navigator_state.dart';
// import 'package:split/res/app_colors.dart';

// import 'navigator_bloc/navigator_bloc.dart';
// import 'navigator_bloc/navigator_event.dart';
// import 'navigator_widget_list.dart';

// List<BottomNavigationBarItem> bottomNavItems = const <BottomNavigationBarItem>[
//   BottomNavigationBarItem(
//     icon: Icon(Icons.people_alt_outlined),
//     label: 'Home',
//   ),
//   BottomNavigationBarItem(
//     icon: Icon(Icons.person),
//     label: 'friends',
//   ),
//   BottomNavigationBarItem(
//     icon: Icon(Icons.auto_graph),
//     label: 'activity',
//   ),
//   BottomNavigationBarItem(
//     icon: Icon(Icons.person_3),
//     label: 'profile',
//   ),
// ];

// class Navigator extends BaseStatelessWidget {
//   Navigator({super.key});

//   @override
//   Widget baseBuild(BuildContext context) {
//     return BlocConsumer<NavigatorBloc, NavigatorState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return Scaffold(
//           //  appBar: GlobalAppBar(title: '', emptyGroupList: false),
//           backgroundColor: AppColors.scaffoldBackGround,
//           //
//           body: Center(child: bottomNavScreen.elementAt(state.tabIndex)),

//           floatingActionButtonLocation:
//               FloatingActionButtonLocation.centerDocked,
//           floatingActionButton: Padding(
//             padding: EdgeInsets.all(5),
//             child: FloatingActionButton(
//               onPressed: () {
//                 // FAB onPressed action
//               },
//               child: Icon(Icons.book_online),
//             ),
//           ),
//           bottomNavigationBar: customBottomNavBar(context, state),
//         );
//       },
//     );
//   }

// ////////////////////
//   ///Helper Methods
//   ///
//   Widget customBottomNavBar(BuildContext context, NavigatorState state) {
//     return Container(
//       color: Colors.amber,
//       height: 50,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           IconButton(
//             onPressed: () {
//               BlocProvider.of<NavigatorBloc>(context)
//                   .add(TabChange(tabIndex: 0));
//             },
//             icon: Icon(Icons.people_alt_outlined),
//             color: state.tabIndex == 0 ? Colors.blue : Colors.grey,
//           ),
//           IconButton(
//             onPressed: () {
//               BlocProvider.of<NavigatorBloc>(context)
//                   .add(TabChange(tabIndex: 1));
//             },
//             icon: Icon(Icons.person),
//             color: state.tabIndex == 1 ? Colors.blue : Colors.grey,
//           ),
//           IconButton(
//             onPressed: () {
//               BlocProvider.of<NavigatorBloc>(context)
//                   .add(TabChange(tabIndex: 2));
//             },
//             icon: Icon(Icons.auto_graph),
//             color: state.tabIndex == 2 ? Colors.blue : Colors.grey,
//           ),
//           IconButton(
//             onPressed: () {
//               BlocProvider.of<NavigatorBloc>(context)
//                   .add(TabChange(tabIndex: 3));
//             },
//             icon: Icon(Icons.person_3),
//             color: state.tabIndex == 3 ? Colors.blue : Colors.grey,
//           ),
//         ],
//       ),
//     );
//   }
// }
