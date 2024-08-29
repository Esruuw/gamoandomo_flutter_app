import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
// import 'package:gamoandomo/model/destination_model.dart';

class LoadingView extends StatelessWidget {
  get child => null;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*0.2,
        ),
        Container(
          // child: Lottie.asset('assets/loading.json'),
      child: child ("https://raw.githubusercontent.com/davekassaw/davekassaw.github.io/main/destination_old.json"),
        ),
        Text('Loading ...',
        style: TextStyle(
          fontSize: 16.0,
        ),),
      ],
    );
  }
}
