import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:easy_localization/easy_localization.dart';
class AboutUs extends StatefulWidget {
  const AboutUs({required Key key}) : super(key: key);
   @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  late String name;
  late String imageUrl;

  late File imageFile;
  late String fileName;
  bool loading = false;

  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var nameCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameCtrl.text = name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text('about us'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(40.0),
          children: <Widget>[
            Text(
                "This app is developed by Ethiopian Space Science and Technology Instiute for Ministry of Tourism "),
            SizedBox(
              height: 100,
            ),
            Ink(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/images/ssgi.jpg'),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Ink(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/images/tourism.png'),
                ],
              ),
            ),
          ],
        ));
  }
}
