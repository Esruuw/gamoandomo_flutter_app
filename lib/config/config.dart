// import 'package:google_maps_flutter/google_maps_flutter.dart';

class Config {
  final String appName = 'GO Gamo & Omo zone tourist map';
  final String mapAPIKey = 'AIzaSyAF6iglNBPqBkCx9EnNM1ouGQnXLY_H8dA';
  // final String mapAPIKey = 'AIzaSyD5ucd8P4YBKfua-ExPuluua5Gg66oBIkA';
  // final String mapAPIKey = 'AIzaSyDDd8nNmEkEsu5q8NIQ8SDSxLkfs1b_80E';
  final String countryName = 'Ethiopia';
  final String splashIcon = 'assets/images/splash.png';
  // final String pharmacyIcon = 'assets/images/pharmacy.png';
  final String supportEmail = 'dawitkassaw60@gmail.com';
  final String privacyPolicyUrl =
      'https://docs.google.com/document/d/1ASFOTtuZm44C_qTm4IHP0AqsHeK_eZ2j63HxbEghMpI/edit';
  final String ourWebsiteUrl = 'https://etssti.org/';
  final String iOSAppId = '000000000';

  final String specialState1 = 'ADDIS ABABA';
  final String specialState2 = 'HARAR';
  final String message = 'Press back again to exit';

  // Reward points
  final int registerPoint = 200;
  final int initialTotalPoint = 200;
  final int firstTimePostPoint = 100;
  final int firstTimeLikePoint = 80;
  final int firstTimeCommentPoint = 90;
  final int firstTimeSharePoint = 120;
  final int firstTimeFollowPoint = 110;
  final int postPoint = 50;
  // final int likePoint = 30;
  final int commentPoint = 40;
  // final int sharePoint = 70;
  final int followPoint = 60;

  // Reward Points - from Aman
  final newComerPoint = 5000;
  final int postVideoPoint = 50;
  final int postPhotoPoint = 30;
  final int likePoint = 5;
  final int reviewAndRatePoint = 10;
  final int sharePoint = 10;

  final int postPointCounter = 5;
  final int likePointCounter = 5;
  final int reviewAndRatePointCounter = 5;
  final int sharePointCounter = 5;

  // Responsive Fonts

  // small screens
  final double smallScreenSmallText = 12;
  final double smallScreenMediumText = 14;
  final double smallScreenExtraMediumText = 17;
  final double smallScreenLargeText = 20;
  final double smallScreenExtraLargeText = 24;

  // medium screens
  final double mediumScreenSmallText = 11;
  final double mediumScreenMediumText = 14;
  final double mediumScreenLargeText = 20;

  // large screens
  final double largeScreenExtraSmallText = 12;
  final double largeScreenSmallText = 15;
  final double largeScreenMediumText = 20;
  final double largeScreenExtraMediumText = 18;
  final double largeScreenLargeText = 20;
  final double largeScreenExtraLargeText = 24;

  // your country lattidtue & logitude
  // final CameraPosition initialCameraPosition = CameraPosition(
  //   target: LatLng(8.49, 38.40),
  //   zoom: 10,
  // );

  //google maps marker icons
  final String hotelIcon = 'assets/images/hotel.png';
  final String restaurantIcon = 'assets/images/restaurant.png';
  final String pharmacyIcon = 'assets/images/shop.png';
  final String hotelPinIcon = 'assets/images/hotel_pin.png';
  final String restaurantPinIcon = 'assets/images/restaurant_pin.png';
  final String pharmacypin = 'assets/images/location.png';
  final String drivingMarkerIcon = 'assets/images/driving_pin.png';
  final String destinationMarkerIcon ='assets/images/destination_map_marker.png';

  //Intro images
  final String introImage1 = 'assets/images/travel1.png';
  final String introImage2 = 'assets/images/travel2.png';
  final String introImage3 = 'assets/images/travel3.png';

  //User Profile Images' URL
  final List<String> user_profiles = [
    // 'https://visitethiopia.s3.af-south-1.amazonaws.com/Avator/user.png',
    'https://visitethiopia.s3.af-south-1.amazonaws.com/Avator/user_profile_image.png',
    'https://visitethiopia.s3.af-south-1.amazonaws.com/Avator/user_avatar_2.png'
    'https://visitethiopia.s3.af-south-1.amazonaws.com/Avator/user_avatar.png',
    'https://visitethiopia.s3.af-south-1.amazonaws.com/Avator/user_avatar3.png',
    'https://visitethiopia.s3.af-south-1.amazonaws.com/Avator/user_avatar4.png',
    'https://visitethiopia.s3.af-south-1.amazonaws.com/Avator/user_avatar5.png',
    'https://visitethiopia.s3.af-south-1.amazonaws.com/Avator/user_avatar6.png',
    'https://visitethiopia.s3.af-south-1.amazonaws.com/Avator/user_avatar7.png',
    'https://visitethiopia.s3.af-south-1.amazonaws.com/Avator/user_avatar8.png',
    'https://visitethiopia.s3.af-south-1.amazonaws.com/Avator/user_avatar9.png',
    'https://visitethiopia.s3.af-south-1.amazonaws.com/Avator/user_avatar10.png',
    'https://visitethiopia.s3.af-south-1.amazonaws.com/Avator/user_avatar11.png'
  ];

  //Language Setup

  final List<String> languages = [
    'English',
    'አማርኛ',
    'Oromiffa',
    'Somali',
    'ትግርኛ',
    'Afaraf',
    'French',
    'German',
    '中国人',
  ];

//  Tour package type

  final List<String> touritems = [
    'Hiking',
    'City Tours',
    'Bird watching',
    'Wildlife Safari',
    'Dramatic Landscapes',
    'NAture and Adventure',
    'Local Culture',
    'Caving Tours',
    'Bike Tours',
    'Volcano and Desert Expeditions',
    'Nightlife',
    'Trekking and Horse riding',
    'Research and Educational Trave',
    'Sporting events',
    'Events and Festivals'
  ];

  // final List<String> languages = ['English', 'Spanish', 'አማርኛ'];

  // Ads Setup

  final int userClicksAmountsToShowEachAd = 5;

  //-- admob ads --
  final String admobAppId = 'ca-app-pub-3940256099942544~3347511713';
  final String admobInterstitialAdId = 'ca-app-pub-3940256099942544/1033173712';

  //fb ads
  final String fbInterstitalAdIDAndroid = '193186341991913_351138***********';

  get _items => null;
  //final String fbInterstitalAdIDiOS = '193186341991913_351139692863243';

}
