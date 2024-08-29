import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:omogamo/config/config.dart';
import 'package:omogamo/utils/next_screen.dart';
import 'package:omogamo/views/home.dart';
import 'package:omogamo/utils/colors.dart';

class IntroPage extends StatefulWidget {
  //const IntroPage({required Key key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int _currentIndex = 0;

  Future<void> checkIntroStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool introShown = prefs.getBool('introShown') ?? false;
    if (introShown) {
      nextScreenReplace(context, Home());
    }
  }

  @override
  void initState() {
    super.initState();
    checkIntroStatus();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    final List<Widget> introSlides = [
      IntroView(
        key: UniqueKey(),
        title: "Welcome to GO travel app",
        description: "Access to important information about your destination before and during your travel...",
        image: Config().introImage1,
      ),
      IntroView(
        key: UniqueKey(),
        title: "Explore Nearby Stuffs",
        description: "Explore hotels & restaurants at every tourist spot in the easiest way...",
        image: Config().introImage2,
      ),
      IntroView(
        key: UniqueKey(),
        title: "Realtime Travel Guide",
        description: "Get directions, addresses, costs, and other travel-related information in one place...",
        image: Config().introImage3,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            height: h * 0.82,
            child: CarouselSlider(
              options: CarouselOptions(
                height: h * 0.82,
                autoPlay: false,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: introSlides,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: introSlides.map((url) {
              int index = introSlides.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? Color(0xFF5D7FE4)
                      : Colors.grey,
                ),
              );
            }).toList(),
          ),
          SizedBox(
            height: 21,
          ),
          Container(
            height: 45,
            width: w * 0.70,
            decoration: BoxDecoration(
              color: Color(0xFF5D7FE4),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF5D7FE4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                "Let's Go...",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool('introShown', true);
                nextScreenReplace(context, Home());
              },
            ),
          ),
          SizedBox(
            height: 0.15,
          ),
        ],
      ),
    );
  }
}

class IntroView extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const IntroView({
    required Key key,
    required this.title,
    required this.description,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Container(
            alignment: Alignment.center,
            height: h * 0.38,
            child: Image(
              image: AssetImage(image),
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w900, color: Colors.grey[800]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            height: 3,
            width: 150,
            decoration: BoxDecoration(
                color: Color(0xFF5D7FE4), borderRadius: BorderRadius.circular(40)),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: tr1),
            ),
          ),
        ],
      ),
    );
  }
}
