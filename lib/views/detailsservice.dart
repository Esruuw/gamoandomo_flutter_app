import 'package:omogamo/data/data.dart';
import 'package:omogamo/model/country_model.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

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

  Detailsservice({
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
        'Check out ${"Dave"}, App. https://play.google.com/store/apps/details?id=com.essti.visitethiopia ${"Thank you"}');
  }

  @override
  _Detailsservice createState() => _Detailsservice();
}

class _Detailsservice extends State<Detailsservice> {
  List<CountryModel> country = [];
  late double xy;
  double lat = 0.0; // Default value
  double lon = 0.0; // Default value
  late double latDigree;
  late double lonDigree;
  int r = 6371;

  handleShare() {
    Share.share(
        'Check out ${"Dave"}, App. https://play.google.com/store/apps/details?id=com.essti.visitethiopia ${"Thank you"}');
  }

  @override
  void initState() {
    country = getCountrys();
    super.initState();
    print(widget.placeName);

    // Initialize lat and lon
    lat = widget.xcoordinates;
    lon = widget.ycoordinates;

    // Example: Additional calculations for latDigree and lonDigree if needed
    // lat = asin(widget.ycoordinates / r);
    // lon = atan2(widget.ycoordinates, widget.xcoordinates);
    // latDigree = lat * 180 / 3.14159266;
    // lonDigree = lon * 180 / 3.14159266;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(
                    widget.imgUrl,
                    height: 295,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 350,
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 2,
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.arrow_back,
                                    size: 24,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              CircleAvatar(
                                child: IconButton(
                                  padding: EdgeInsets.all(0),
                                  icon: const Icon(
                                    Icons.share,
                                    size: 22,
                                  ),
                                  onPressed: () {
                                    handleShare();
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 24,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 14,
                            right: 24,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.fullname,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Color(0xff1A4160),
                                    size: 19,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    widget.wereda,
                                    style: const TextStyle(
                                        color: Color(0xff1A4160),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 1,
                              ),
                              Row(
                                crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                children: [
                                  RatingBar(widget.rating.round()),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FeaturesTile(
                    icon: Icon(
                      Icons.phone,
                      color: Color(0xff1A4160),
                    ),
                    label: widget.phoneLine.toString(),
                    latitude: lat,
                    longitude: lon,
                  ),
                  Link(
                    icon: Icon(
                      Icons.link_sharp,
                      color: Color(0xff1A4160),
                    ),
                    label: widget.website.toString(),
                    latitude: lat,
                    longitude: lon,
                  ),
                  Sharetofrd(
                    icon: Icon(
                      Icons.merge_type_sharp,
                      color: Color(0xff1A4160),
                    ),
                    label: "Go to Map",
                    latitude: widget.xcoordinates,
                    longitude: widget.ycoordinates,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DetailsCard(
                      rating: widget.rating,
                      title: widget.fullname,
                      noOfReviews: "13712 reviews",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: const Text(
                  "The hotel located at a grand view overlooking the twin lakes of Abaya and Chamo along the beautiful evergreen vegetation and chain of mountains that form the most beautiful pattern. Haile-Arba Minch is an all-inclusive concept that provides five-star services to its guests. Our new resort features food and beverage outlets on view points; complete health club",
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

  DetailsCard({
    required this.rating,
    required this.title,
    required this.noOfReviews,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 8),
      decoration: BoxDecoration(
          color: const Color(0xffE9F4F9),
          borderRadius: BorderRadius.circular(1)),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Details about the place",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff000000),
            ),
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

  FeaturesTile({
    required this.label,
    required this.icon,
    required this.latitude,
    required this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: InkWell(
        onTap: () async {
          var phoneNo = label;
          await FlutterPhoneDirectCaller.callNumber(phoneNo);
        },
        child: Container(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color(0xff5A6C64).withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: icon,
              ),
              const SizedBox(
                height: 9,
              ),
              Container(
                width: 100,
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff5A6C64)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Sharetofrd extends StatelessWidget {
  final Icon icon;
  final String label;
  final double latitude;
  final double longitude;

  Sharetofrd({
    required this.label,
    required this.icon,
    required this.latitude,
    required this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: InkWell(
        onTap: () async {
          var url =
              'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        },
        child: Container(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color(0xff5A6C64).withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: icon,
              ),
              const SizedBox(
                height: 9,
              ),
              Container(
                width: 100,
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff5A6C64)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Link extends StatelessWidget {
  final Icon icon;
  final String label;
  final double latitude;
  final double longitude;

  Link({
    required this.label,
    required this.icon,
    required this.latitude,
    required this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: InkWell(
        onTap: () async {
          var url = label;
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        },
        child: Container(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color(0xff5A6C64).withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: icon,
              ),
              const SizedBox(
                height: 9,
              ),
              Container(
                width: 100,
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff5A6C64)),
                ),
              ),
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
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.yellow,
          size: 16,
        );
      }),
    );
  }
}
