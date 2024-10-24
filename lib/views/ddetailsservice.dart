import 'package:cached_network_image/cached_network_image.dart';
import 'package:omogamo/data/data.dart';
import 'package:omogamo/model/country_model.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:discounttour/';
import 'package:url_launcher/url_launcher.dart';
// import 'package:vector_math/vector_math.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
// import 'package:flutter_share/flutter_share.dart';
// import 'mapScreen.dart';
// import 'dart:math';

class Detailsservice extends StatefulWidget {
 final String imgUrl;
  final String placeName;
  final double rating;
  final String fullname;
  final String zone;
  final int code;
  final String phoneLine;
  final String phoneNobile;
  final String website;
  final String img;
  final double xcoordinates;
  final double ycoordinates;
  final String wereda;
 

  Detailsservice(
      {
       required this.wereda,
    required this.phoneNobile,
    required this.rating,
    required this.website,
    required this.imgUrl,
    required this.placeName,
    required this.fullname,
    required this.zone,
    required this.code,
    required this.phoneLine,
    required this.img,
    required this.xcoordinates,
    required this.ycoordinates,

       });
handleShare() {
    Share.share(
        'Check out ${"Dave"},App. https://play.google.com/store/apps/details?id=com.essti.visitethiopia ${"Thank you"} ');
  }
  @override
  _Detailsservice createState() => _Detailsservice();
}
//_DetailsState

class _Detailsservice extends State<Detailsservice> {
  List<CountryModel> country = [];
  late double xy;
  late double lat;
  late double lon;
  late double latDigree;
  late double lonDigree;
  
  int r = 6371;

  handleShare() {
    Share.share(
        'Check out ${"Dave"},App. https://play.google.com/store/apps/details?id=com.essti.visitethiopia ${"Thank you"} ');
  }
  @override
  void initState() {
    country = getCountrys();
    super.initState();
    print(widget.placeName);
    
    
    // print(widget.dy);
    // print(widget.dz);
    
    // lat = asin(widget.dz / r);
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
            children: [
              Stack(
                children: [
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
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            left: 24,
                            right: 24,
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  child: const Icon(
                                    Icons.arrow_back,
                                    // color: Color(0xFF5D7FE4),
                                    size: 24,
                                  ),
                                ),
                              ),
                              Spacer(),
                         CircleAvatar(
                        // backgroundColor: Colors.blue.withOpacity(0.9),
                        child: IconButton(
                          padding: const EdgeInsets.all(0),
                          icon: const Icon(
                            Icons.share,
                            size: 22,
                          ),
                           onPressed: () {
                            handleShare();
                          },
                        )
                        ),
                              
                              const SizedBox(
                                width: 24,
                              ),
                              // Image.asset(
                              //   "assets/heart.png",
                              //   height: 24,
                              //   width: 24,
                              // )
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 24,
                            right: 24,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.fullname,
                                style: const TextStyle(
                                    // color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 23),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              const Row(
                                children: [
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
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  RatingBar(widget.rating.round()),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Text(
                                    "Estimated: 13712",
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
                        const SizedBox(
                          height: 18,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
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
                children: [
                  FeaturesTile(
                    icon: const Icon(Icons.phone, color: Color(0xff5A6C64)),
                    label: widget.phoneLine.toString(),
                    latitude: lat,
                    longitude: lon
                  ),
                  Link(
                    icon: const Icon(Icons.details, color: Color(0xff5A6C64)),
                    label: widget.website.toString(),
                    latitude: lat,
                    longitude: lon
                  ),
                  Sharetofrd(
                    icon: const Icon(Icons.share, color: Color(0xff5A6C64)),
                    label: "Share to friends",
                    latitude: lat,
                    longitude: lon
                  ),

                  FeaturesTile(
                    icon: const Icon(Icons.recommend, color: Color(0xff5A6C64)),
                    label: "Travel Package",
                    latitude: lat,
                    longitude: lon
                  )
                ],
              ),
          Container(
  margin: const EdgeInsets.symmetric(vertical: 24),
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

              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: const Text(
                  "Haile-Arba Minch is a 107 room four-star resort located at a grand view overlooking the twin lakes of Abaya and Chamo along the beautiful evergreen vegetation and chain of mountains that form the most beautiful pattern. Haile- Arba Minch is an all inclusive concept that provides five star services to its guests. Our new resort features food and beverage outlets on view points; complete health club",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff879D95)),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              // Container(
              //   height: 240,
              //   child: ListView.builder(
              //       padding: EdgeInsets.symmetric(horizontal: 24),
              //       itemCount: country.length,
              //       shrinkWrap: true,
              //       physics: ClampingScrollPhysics(),
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context, index) {
              //         return ImageListTile(
              //           imgUrl: country[index].imgUrl,
              //         );
              //       }
              //       ),
              // ),
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: const Color(0xffE9F4F9), borderRadius: BorderRadius.circular(16)),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row(
          //   children: [
          //     Container(
          //       padding: EdgeInsets.all(8),
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
          //       children: [
          //         Text(
          //           "Booking",
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
          // SizedBox(
          //   height: 8,
          // ),
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
  FeaturesTile({required this.label, required this.icon, required this.latitude, required this.longitude});
 
                                        
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: InkWell(
        onTap: () async {
        var phoneNo = label;
          await FlutterPhoneDirectCaller
              .callNumber(phoneNo);

        },
          child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff5A6C64).withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(40)),
                child: icon,
              ),
              const SizedBox(
                height: 9,
              ),
              Container(
                  width: 70,
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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

//share to friends
class Sharetofrd extends StatelessWidget {
  final Icon icon;
  final String label;
  final double latitude;
  final double longitude;
  Sharetofrd({required this.label, required this.icon, required this.latitude, required this.longitude});

                           
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

        // onPressed: () {
        //                     handleShare();
        //                   },
          child: Container(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff5A6C64).withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(40)),
                child: icon,
              ),
              const SizedBox(
                height: 9,
              ),
              Container(
                  width: 70,
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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

//link
//share to friends
class Link extends StatelessWidget {
  final Icon icon;
  final String label;
  final double latitude;
  final double longitude;
  
  Link({required this.label, required this.icon, required this.latitude, required this.longitude});


                           
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: InkWell(
       onTap: () async {
         var phoneNo = label;
          String url = phoneNo;
          //  "google.navigation:q=${widget.place.latitude},${widget.place.longitude}";
           
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            print('cannot launch');
          }
        },
        // onPressed: () {
        //                     handleShare();
        //                   },
          child: Container(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff5A6C64).withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(40)),
                child: icon,
              ),
              const SizedBox(
                height: 9,
              ),
              Container(
                  width: 70,
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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
        child: const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
        child: CachedNetworkImage(
          imageUrl: imgUrl,
          height: 220,
          width: 150,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
