// import 'package:elf_doger/components/game.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
//
// class MenuOverlay extends StatelessWidget {
//   const MenuOverlay({Key? key, required this.game}) : super(key: key);
//
//   final MyGame game;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Row(
//           children: [
//             IconButton(
//               onPressed: () {
//                 game.playerData.mobile.value += 10;
//               },
//               icon: Icon(
//                 Icons.arrow_back_ios,
//                 size: 100,
//               ),
//             ),
//             IconButton(
//               onPressed: () {
//                 game.playerData.mobile.value -= 10;
//               },
//               icon: const Icon(
//                 Icons.keyboard_arrow_right,
//                 size: 100,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
