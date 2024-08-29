// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:line_icons/line_icons.dart';
// import 'package:gamoandomo/config/config.dart';
// import 'package:gamoandomo/views/SpinCheck.dart';
// import 'package:gamoandomo/views/about_us.dart';
// import 'package:gamoandomo/views/important_links.dart';
// import 'package:gamoandomo/views/home.dart';
// import 'package:gamoandomo/utils/next_screen.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:gamoandomo/utils/colors.dart';
// import 'package:gamoandomo/views/emergency_contact.dart';

// class MenuPage extends StatefulWidget {
//   const MenuPage({required Key key}) : super(key: key);

//   @override
//   _MenuPageState createState() => _MenuPageState();
// }

// class _MenuPageState extends State<MenuPage> with AutomaticKeepAliveClientMixin {
//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return Scaffold(
//       appBar: AppBar(),
//       body: ListView(
//         padding: EdgeInsets.fromLTRB(20, 20, 20, 50),
//         children: [
//           Text(
//             "Travel Essentials",
//             style: TextStyle(fontSize: 20, color: Color(0xff5B7489), fontWeight: FontWeight.w600),
//           ),
//           SizedBox(height: 15),
//           Divider(height: 5),
//           Divider(height: 5),
//           ListTile(
//             title: Text('Important Links'),
//             leading: Container(
//               height: 30,
//               width: 30,
//               decoration: BoxDecoration(
//                 color: Color(0xff5B7489),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               child: Icon(LineIcons.link, size: 20, color: Colors.white),
//             ),
//           onTap: () {
//   Navigator.push(context, MaterialPageRoute(builder: (context) => ImportantLinks(key: Key('important_links'))));
// },
//           ),
//           Divider(height: 5),
//           ListTile(
//             title: Text('About Zone'),
//             leading: Container(
//               height: 30,
//               width: 30,
//               decoration: BoxDecoration(
//                 color: Color(0xff5B7489),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               child: Icon(LineIcons.infoCircle, size: 20, color: Colors.white),
//             ),
//             trailing: Icon(LineIcons.angleRight, size: 20),
//             onTap: () => Home(),
//           ),
//           Divider(height: 5),
//           ListTile(
//             title: Text('Emergency Contact'),
//             leading: Container(
//               height: 30,
//               width: 30,
//               decoration: BoxDecoration(
//                 color: Color(0xff5B7489),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               child: Icon(LineIcons.phone, size: 20, color: Colors.white),
//             ),
//             trailing: Icon(LineIcons.angleRight, size: 20),
//          onTap: () {
//   Navigator.push(context, MaterialPageRoute(builder: (context) => EmergencyContact(key: Key('emergency_contact'))));
// },
//           ),
//           SizedBox(height: 15),
//           Divider(height: 5),
//           ListTile(
//             title: Text('Privacy Policy'),
//             leading: Container(
//               height: 30,
//               width: 30,
//               decoration: BoxDecoration(
//                 color: Color(0xff5B7489),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               child: Icon(LineIcons.lock, size: 20, color: Colors.white),
//             ),
//             trailing: Icon(LineIcons.angleRight, size: 20),
//             onTap: () async {
//               if (await canLaunch(Config().privacyPolicyUrl)) {
//                 launch(Config().privacyPolicyUrl);
//               }
//             },
//           ),
//           Divider(height: 5),
//           ListTile(
//             title: Text('About Us'),
//             leading: Container(
//               height: 30,
//               width: 30,
//               decoration: BoxDecoration(
//                 color: Color(0xff5B7489),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               child: Icon(LineIcons.infoCircle, size: 20, color: Colors.white),
//             ),
//             trailing: Icon(LineIcons.angleRight, size: 20),
//           ),
//           Divider(height: 5),
//           ListTile(
//             title: Text('Contact Us'),
//             leading: Container(
//               height: 30,
//               width: 30,
//               decoration: BoxDecoration(
//                 color: Color(0xff5B7489),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               child: Icon(LineIcons.envelope, size: 20, color: Colors.white),
//             ),
//             trailing: Icon(LineIcons.angleRight, size: 20),
//             onTap: () async => await launch(
//               'mailto:${Config().supportEmail}?subject=About ${Config().appName} App&body=',
//             ),
//           ),
//           Divider(height: 5),
//         ],
//       ),
//     );
//   }

//   @override
//   bool get wantKeepAlive => true;
// }

// class Lucky_Draw extends StatelessWidget {
//   final Icon icon;
//   final String label;
//   final double latitude;
//   final double longitude;

//   Lucky_Draw({required this.label, required this.icon, required this.latitude, required this.longitude});

//   @override
//   Widget build(BuildContext context) {
//     return Opacity(
//       opacity: 0.7,
//       child: InkWell(
//         child: Container(
//           width: 40,
//           height: 90,
//           margin: EdgeInsets.only(right: 280),
//           child: Column(
//             children: [
//               Container(
//                 padding: EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Color(0xff5A6C64).withOpacity(0.5)),
//                   borderRadius: BorderRadius.circular(40),
//                 ),
//                 child: icon,
//               ),
//               SizedBox(height: 9),
//               Container(
//                 width: 150,
//                 child: Text(
//                   label,
//                   textAlign: TextAlign.end,
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xff5A6C64),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class GuestUserUI extends StatelessWidget {
//   const GuestUserUI({required Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // SizedBox(height: 20),
//       ],
//     );
//   }
// }
