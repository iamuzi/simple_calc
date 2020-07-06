// import 'package:flutter/material.dart';
// import 'package:simple_calc/styling.dart';

// class ThemeButton extends StatefulWidget {
//   @override
//   _ThemeButtonState createState() => _ThemeButtonState();
// }

// class _ThemeButtonState extends State<ThemeButton> {
  
//   bool themeButton = false;
//   Color themeStyle() {
//     if (themeButton) {
//       return Colors.grey[850];
//     } else {
//       return Colors.white;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           setState(() {
//             themeButton = !themeButton;
//           });
//         },
//         icon: themeButton
//             ? Icon(
//                 Icons.brightness_3,
//                 color: themeButton ? dtIconColor : ltIconColor,
//               )
//             : Icon(
//                 Icons.wb_sunny,
//                 color: themeButton ? dtIconColor : ltIconColor,
//               ));
//   }
// }
