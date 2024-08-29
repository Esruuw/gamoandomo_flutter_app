// import 'package:cached_network_image/cached_network_image.dart';
import 'package:omogamo/data/data.dart';
// import 'package:omogamo/main.dart';
import 'package:omogamo/model/country_model.dart';
import 'package:flutter/material.dart';
// import 'package:omogamo/views/weather_forcast.dart';
// import 'package:omogamo/utils/next_screen.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:omogamo/views/home.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:vector_math/vector_math.dart';
// import 'mapScreen.dart';
// import 'dart:math';

class Details extends StatefulWidget {
  final String imgUrl;
  final String placeName;
  final double rating;
  final double dcoordinates;
  final double dcoordinatesy;
  final String ddestinatio;
  final String dfullname;
  final String imgdest;
  
 

  Details(
      {
required this.rating, required this.imgUrl, required this.placeName, required this.dcoordinates, required this.dcoordinatesy, required this.ddestinatio, required this.dfullname, required this.imgdest});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<CountryModel> country = [];
  late double xy;
  late double lat;
  late double lon;
  late double latDigree;
  late double lonDigree;
  
  int r = 6371;
  @override
  void initState() {
    country = getCountrys();
    super.initState();
    print("detail page print");
    print(widget.dcoordinates);
    print(widget.dcoordinatesy);
    // var latt = widget.dcoordinates [0,1];
    // var lonn = widget.dcoordinates [1];
    // print(widget.dy);
    // print(widget.dz);
    // print("your latttttttt"+latt);
    // print("your lottttttttttt"+lonn);
    // // lat = asin(widget.dz / r);
    // lon = atan2(widget.dy, widget.dx);
    // PI = 3.14159266;
    // latDigree = lat * 180 / 3.14159266;
    // // lonDigree = lon * 180 / 3.14159266;
    // print(latDigree);
    // print(latDigree);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children:<Widget> [
              Stack(
                children: <Widget>[
                  Image.network(
                    widget.imgUrl,
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 350,
                    // color: Colors.black12,
                    padding: EdgeInsets.only(top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:<Widget> [
                        Container(
                          padding: EdgeInsets.only(
                            left: 24,
                            right: 24,
                          ),
                          child: Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  child: Icon(
                                    Icons.arrow_back,
                                    // color: Color(0xFF5D7FE4),
                                    size: 24,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.share,
                                // color: Colors.white,
                                size: 24,
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              Image.asset(
                                "assets/heart.png",
                                height: 24,
                                width: 24,
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.only(
                            left: 24,
                            right: 24,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.placeName,
                                style: TextStyle(
                                    // color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 23),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    // color: Colors.white70,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Arbaminch Zuriya",
                                    style: TextStyle(
                                        // color: Colors.white70,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget> [
                                  RatingBar(widget.rating.round()),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    widget.dcoordinatesy.toString(),
                                    style: TextStyle(
                                        // color: Colors.white70,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              // color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          height: 50,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FeaturesTile(
                    icon: Icon(Icons.map, color: Color(0xff5A6C64)),
                    label: "View Map",
                    latitude: widget.dcoordinates,
                    longitude: widget.dcoordinatesy,
                    dfullname: widget.dfullname 
                  ),
                  FeaturesTile(
                    icon: Icon(Icons.details, color: Color(0xff5A6C64)),
                    label: "Destination Info",
                    latitude: widget.dcoordinates,
                    longitude: widget.dcoordinatesy,
                    dfullname: widget.dfullname 
                  ),
                  FeaturesTile(
                    icon: Icon(Icons.share, color: Color(0xff5A6C64)),
                    label: "Share to friends",
                    latitude: widget.dcoordinates,
                    longitude: widget.dcoordinatesy,
                    dfullname: widget.dfullname 
                  ),
                ],
              ),




// Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Newpage(
//                     icon: Icon(Icons.map, color: Color(0xff5A6C64)),
//                     label: "new one",
//                     latitude: widget.dcoordinates,
//                     longitude: widget.dcoordinatesy
//                   ),
//                   Newpage(
//                     icon: Icon(Icons.details, color: Color(0xff5A6C64)),
//                     label: "new two",
//                     latitude: widget.dcoordinates,
//                     longitude: widget.dcoordinatesy
//                   ),
//                   Newpage(
//                     icon: Icon(Icons.share, color: Color(0xff5A6C64)),
//                     label: "New Three",
                    
                     
//                   ),
//                 ],
//               ),

            Container(
  margin: EdgeInsets.symmetric(vertical: 24),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      DetailsCard(
        rating: 4.5, // Replace with your rating value
        title: "Sample Title", // Replace with your title
        noOfReviews: "200 reviews", // Replace with your review count
      ),
      DetailsCard(
        rating: 4.0, // Replace with your rating value
        title: "Another Title", // Replace with your title
        noOfReviews: "150 reviews", // Replace with your review count
      ),
    ],
  ),
),

              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  widget.ddestinatio,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff879D95)),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 240,
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    itemCount: country.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ImageListTile(
                        imgUrl: country[index].imgUrl,
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsCard extends StatelessWidget {
  final String title;
  final String noOfReviews;
  final double rating;
  DetailsCard({required this.rating, required this.title, required this.noOfReviews});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: Color(0xffE9F4F9), borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Row(
          //   children: <Widget>[
          //     Container(
          //       padding: EdgeInsets.all(1),
          //       decoration: BoxDecoration(
          //           color: Color(0xffD5E6F2),
          //           borderRadius: BorderRadius.circular(10)),
          //       child: Image.asset(
          //         "assets/card1.png",
          //         height: 30,
          //       ),
          //     ),
          //     SizedBox(
          //       width: 8,
          //     ),
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: <Widget>[
          //         Text(
          //           "Bookingjj",
          //           textAlign: TextAlign.center,
          //           style: TextStyle(
          //               fontSize: 16,
          //               fontWeight: FontWeight.w600,
          //               color: Color(0xff5A6C64)),
          //         ),
          //         SizedBox(
          //           height: 6,
          //         ),
          //         Text(
          //           "8.0/10",
          //           textAlign: TextAlign.center,
          //           style: TextStyle(
          //               fontSize: 14,
          //               fontWeight: FontWeight.w600,
          //               color: Color(0xff5A6C64)),
          //         )
          //       ],
          //     )
          //   ],
          // ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Organization: Public",
            // textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                // fontWeight: FontWeight.w600,
                color: Color(0xff879D95)),
          ),
        ],
      ),
    );
  }
}

class FeaturesTile extends StatelessWidget {
  final Icon icon;
  final String label;
  final double latitude;
  final double longitude;
  final String dfullname;

  


 
  FeaturesTile({required this.label, required this.icon, required this.latitude, required this.longitude, required this.dfullname}); 

  @override
  Widget build(BuildContext context) {
    
    
        return Opacity(
          opacity: 0.7,
          child: InkWell(
            
  
        onTap: () async {
          String url =
          //  "google.navigation:q=${widget.place.latitude},${widget.place.longitude}";
            "https://www.google.com/maps/search/?api=1&query=$longitude,$latitude";
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            print('cannot launch');
          }
        },
          child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff5A6C64).withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(40)),
                child: icon,
              ),
              SizedBox(
                height: 9,
              ),
              Container(
                  width: 70,
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff5A6C64)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  final int rating;
  RatingBar(this.rating);

  @override
  Widget build(BuildContext context) {
    return Container( 
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // Icon(
        //   Icons.star,
        //   color: rating >= 1 ? Colors.white70 : Colors.white30,
        // ),
        // SizedBox(
        //   width: 3,
        // ),
        // Icon(
        //   Icons.star,
        //   color: rating >= 2 ? Colors.white70 : Colors.white30,
        // ),
        // SizedBox(
        //   width: 3,
        // ),
        // Icon(
        //   Icons.star,
        //   color: rating >= 3 ? Colors.white70 : Colors.white30,
        // ),
        // SizedBox(
        //   width: 3,
        // ),
        // Icon(
        //   Icons.star,
        //   color: rating >= 4 ? Colors.white70 : Colors.white30,
        // ),
        SizedBox(
          width: 3,
        ),
        // Icon(
        //   Icons.star,
        //   color: rating >= 5 ? Colors.white70 : Colors.white30,
        // ),
      ],
    ));
  }
}

class ImageListTile extends StatelessWidget {
  final String imgUrl;
  ImageListTile({required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        // child: CachedNetworkImage(
        //   imageUrl: imgUrl,
        //   height: 220,
        //   width: 150,
        //   fit: BoxFit.cover,
        // ),
      ),
    );
  }
}


//Dave
// class Newpage extends StatelessWidget {
//   final Icon icon;
//   final String label;
//   final double latitude;
//   final double longitude;
//   final String  placeData;

  
// Newpage({this.label, this.icon, this.latitude, this.longitude, this.placeData}); 

//   @override
//   Widget build(BuildContext context) {
    
//     return Opacity(
//       opacity: 0.7,
//       child: InkWell(
  
// //                      onTap: () {
// //   Navigator.pop(context);
// // },                  
// // onTap: () => Home,
//               )

//     );
//   }
// }

// // 