// import 'package:flutter/material.dart';
// import 'package:simple_calc/widget/home.dart';
// import '../styling.dart';
// //import 'package:simple_calc/widget/home.dart';

// class Info extends StatefulWidget {
//   @override
//   _InfoState createState() => _InfoState();
// }

// class _InfoState extends State<Info> {
  
//   @override
//   Widget build(BuildContext context) {    
//     return IconButton(
//         icon: Icon(Icons.info, color: themeButton ? dtIconColor : ltIconColor),
//         onPressed: () {
//           showDialog(
//               context: context,
//               builder: (BuildContext context) => Dialog(
//                     backgroundColor: Colors.transparent,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     elevation: 0,
//                     child: Stack(children: <Widget>[
//                       Container(
//                         padding: const EdgeInsets.only(
//                           top: 66.0 + 16.0,
//                           bottom: 16.0,
//                           right: 16.0,
//                           left: 16.0,
//                         ),
//                         margin: EdgeInsets.only(top: 30.0),
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             shape: BoxShape.rectangle,
//                             borderRadius: BorderRadius.circular(16),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black26,
//                                 blurRadius: 16.0,
//                                 offset: const Offset(0.0, 16.0),
//                               )
//                             ]),
//                         child: Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Text(
//                             'Author: Ibrahim Usman \n \n Github : @Uzi_ibm \n Code Clan Nigeria',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 20,
//                               //fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         left: 28.0 + 64.0,
//                         right: 30.0 + 64.0,
//                         child: CircleAvatar(
//                           backgroundImage: AssetImage('assets/dp.jpg'),
//                           radius: 50.0,
//                         ),
//                       )
//                     ]),
//                   ));
//         });
//   }
// }
