import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:omogamo/data/data.dart';
import 'package:omogamo/model/country_model.dart';
import 'package:omogamo/model/destination_model.dart';
import 'package:omogamo/model/service_model.dart';
import 'package:omogamo/model/popular_tours_model.dart';
import 'package:omogamo/views/details.dart';
import 'package:omogamo/views/menu.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:http/http.dart' as http;

class SearchBarDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search Bar Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: GamoDestinations(),
    );
  }
}

class GamoDestinations extends StatefulWidget {
  @override
  _GamoDestinations createState() => _GamoDestinations();
}

class _GamoDestinations extends State<GamoDestinations> {
  late SearchBar searchBar;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<PopularTourModel> popularTourModels = [];
  List<CountryModel> country = [];
  List<Service> services = [];
  List<Destination> destinations = [];
  bool loading = true;

  Future<void> getServiceData() async {
    final response = await http.get(Uri.parse("https://raw.githubusercontent.com/davekassaw/servicegithub.json/main/s.json"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['features'].isNotEmpty) {
        for (var feature in data['features']) {
          Service service = Service(
            feature['properties']['full_name'],
            feature['properties']['short_name'],
            feature['properties']['zone'],
            feature['properties']['wereda'],
            feature['properties']['kebele'],
            feature['properties']['locality_n'],
            feature['properties']['phone_line'],
            feature['properties']['email'],
            feature['properties']['Service'],
            feature['properties']['service_ty'],
            feature['properties']['code'],
            feature['properties']['img'],
            feature['properties']['website'],
            feature['geometry']['coordinates'][0],
            feature['geometry']['coordinates'][1],
          );
          services.add(service);
        }
      }
    } else {
      print("Failed to load service data");
    }
  }

  Future<void> getDestinationData() async {
    final response = await http.get(Uri.parse("https://raw.githubusercontent.com/davekassaw/datafinal/main/finaldata.json"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data.isNotEmpty) {
        for (var item in data) {
          Destination destination = Destination(
            item['full_name'],
            item['short_name'],
            item['zone'],
            item['wereda'],
            item['kebele'],
            item['organizati'],
            item['status'],
            item['area_sqkm'],
            item['unesco_reg'],
            item['descriptio'],
            item['destinatio'],
            item['x'],
            item['y'],
            item['image1'],
          );
          destinations.add(destination);
        }
      }
    } else {
      print("Failed to load destination data");
    }
  }

  @override
  void initState() {
    super.initState();
    getServiceData();
    getDestinationData();
    country = getCountrys();
    popularTourModels = getPopularTours();
    hotReload();
  }

  Future<void> hotReload() async {
    Future.delayed(Duration(seconds: 6)).then((_) {
      setState(() {
        loading = false;
      });
    });
  }

Widget buildServiceTile(int index) {
  return ServiceListTile(
    fullname: services[index].fullname,
    shortname: services[index].shortname,
    img: services[index].img,
    zone: services[index].zone,
    code: services[index].code.toString(), // Convert int to String
    wereda: services[index].wereda,
    xcoordinates: services[index].xcoordinates,
    ycoordinates: services[index].ycoordinates,
    phoneLine: services[index].phoneLine,
    phoneNobile: services[index].phoneNobile,
    website: services[index].website,
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.all(1),
          child: Image.asset(
            "assets/images/logomenu.png",
            height: 40,
            width: 40,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png", height: 25),
          ],
        ),
        actions: [
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.more_vert, color: Color(0xff000000)),
            ),
           onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MenuPage(key: UniqueKey()), // Added key argument
    ),
  );
},

          ),
        ],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                onChanged: (searchText) {
                  searchText = searchText.toLowerCase();
                  setState(() {
                    destinations = destinations.where((u) {
                      var fName = u.dfullname.toLowerCase();
                      var lName = u.dfullname.toLowerCase();
                      return fName.contains(searchText) || lName.contains(searchText);
                    }).toList();
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search Places',
                ),
              ),
              SizedBox(height: 18),
              const Text(
                "Gamo Zone Hotels",
                style: TextStyle(fontSize: 20, color: Colors.black54, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 15),
              loading
                  ? Center(child: CircularProgressIndicator())
                  : Container(
                      height: 250,
                      child: ListView.builder(
                        itemCount: services.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return buildServiceTile(index);
                        },
                      ),
                    ),
              SizedBox(height: 20),
              const Text(
                "Gamo Zone Sites",
                style: TextStyle(fontSize: 20, color: Colors.black54, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              loading
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 0,
                      ),
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: destinations.length,
                      itemBuilder: (BuildContext context, int index) {
                        return PopularTours(
                          dfullname: destinations[index].dfullname,
                          dshortname: destinations[index].dshortname,
                          ddestinatio: destinations[index].ddestinatio,
                          dunescoreg: destinations[index].dunescoreg,
                          destinationnnn: destinations[index].destinationnnn,
                          dcoordinates: destinations[index].dcoordinates,
                          dcoordinatesy: destinations[index].dcoordinatesy,
                          dzone: destinations[index].dzone,
                          imgdest: destinations[index].imgdest,
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class PopularTours extends StatelessWidget {
  final String dfullname;
  final String dshortname;
  final String ddestinatio;
  final String dunescoreg;
  final double dcoordinates;
  final double dcoordinatesy;
  final String destinationnnn;
  final String dzone;
  final String imgdest;

  PopularTours({
    required this.dfullname,
    required this.dshortname,
    required this.ddestinatio,
    required this.dunescoreg,
    required this.destinationnnn,
    required this.dcoordinates,
    required this.dcoordinatesy,
    required this.dzone,
    required this.imgdest,
  });

  @override
  Widget build(BuildContext context) {
    if (dzone == "Gamo") {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Details(
                imgUrl: imgdest,
                placeName: dfullname.length > 15 ? '${dfullname.substring(0, 15)}...' : dfullname,
                rating: 4.5,
                dcoordinates: dcoordinates,
                dcoordinatesy: dcoordinatesy,
                ddestinatio: ddestinatio,
                dfullname: dfullname,
                imgdest: imgdest,
              ),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.only(left: 0, top: 10),
          decoration: const BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(0),
                  bottomLeft: Radius.circular(0),
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                child: CachedNetworkImage(
                  imageUrl: imgdest,
                  height: 110,
                  width: 220,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                dfullname.length > 15 ? '${dfullname.substring(0, 15)}...' : dfullname,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "Unesco Register $dunescoreg",
                style: TextStyle(color: Colors.yellow, fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}

class ServiceListTile extends StatelessWidget {
  final String fullname;
  final String shortname;
  final String img;
  final String zone;
  final String code;
  final String wereda;
  final double xcoordinates;
  final double ycoordinates;
  final String phoneLine;
  final String phoneNobile;
  final String website;

  ServiceListTile({
    required this.fullname,
    required this.shortname,
    required this.img,
    required this.zone,
    required this.code,
    required this.wereda,
    required this.xcoordinates,
    required this.ycoordinates,
    required this.phoneLine,
    required this.phoneNobile,
    required this.website,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(
              imgUrl: img,
              placeName: fullname,
              rating: 4.5,
              dcoordinates: xcoordinates,
              dcoordinatesy: ycoordinates,
              ddestinatio: "Destination Details",
              dfullname: fullname,
              imgdest: img,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 0, top: 10),
        decoration: BoxDecoration(
          color: Colors.brown,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: img,
                height: 110,
                width: 220,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              fullname.length > 15 ? '${fullname.substring(0, 15)}...' : fullname,
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
            ),
            Text(
              "Code $code",
              style: TextStyle(color: Colors.yellow, fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
