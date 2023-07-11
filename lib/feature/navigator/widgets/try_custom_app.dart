///  Widget customBottomNavBar(BuildContext context, NavigatorState state) {
//     return Container(
//       color: Color.fromARGB(255, 255, 255, 255),
//       height: 50,
//       child: CustomPaint(
//         painter: BottomNavBarPainter(),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             IconButton(
//               onPressed: () {},
//               icon: Icon(Icons.people_alt_outlined),
//               color: state.tabIndex == 0 ? Colors.blue : Colors.grey,
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: Icon(Icons.person),
//               color: state.tabIndex == 1 ? Colors.blue : Colors.grey,
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: Icon(AppIcons.activity, size: 50),
//               color: state.tabIndex == 2 ? Colors.blue : Colors.grey,
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: Icon(Icons.person_3),
//               color: state.tabIndex == 3 ? Colors.blue : Colors.grey,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BottomNavBarPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final gapSize = 70.0;
//     final gapRect = Rect.fromLTWH(
//       (size.width - gapSize) / 2,
//       (size.height - gapSize) / .7,
//       gapSize,
//       gapSize,
//     );
//     canvas.clipRect(Rect.fromLTWH(0, 0, size.width, size.height));
//     canvas.drawCircle(Offset(size.width * 5, size.height / 4), size.height / 2,
//         Paint()..color = Colors.white);
//     canvas.drawOval(gapRect, Paint()..blendMode = BlendMode.clear);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
