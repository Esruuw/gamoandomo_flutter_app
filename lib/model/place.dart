// import 'package:cloud_firestore/cloud_firestore.dart';

class Place {
  String state;
  String attractiontype;
  String name;
  String location;
  double latitude;
  double longitude;
  String description;
  String imageUrl1;
  String imageUrl2;
  String imageUrl3;
  int loves;
  int commentsCount;
  String date;
  String timestamp;

  Place(
      {required this.state,
      required this.attractiontype,
      required this.name,
      required this.location,
      required this.latitude,
      required this.longitude,
      required this.description,
      required this.imageUrl1,
      required this.imageUrl2,
      required this.imageUrl3,
      required this.loves,
      required this.commentsCount,
      required this.date,
      required this.timestamp});

  
}
