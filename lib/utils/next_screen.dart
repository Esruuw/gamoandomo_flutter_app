import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void nextScreen (context, page, Text text){
  Navigator.push(context, MaterialPageRoute(
    builder: (context) => page));
}


void nextScreeniOS (context, page){
  Navigator.push(context, CupertinoPageRoute(
    builder: (context) => page));
}


void nextScreenCloseOthers (context, page){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => page), (route) => false);
}

void nextScreenReplace (context, page){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));
}


void nextScreenPopup (context, page){
  Navigator.push(context, MaterialPageRoute(
    fullscreenDialog: true,
    builder: (context) => page),
  );
}