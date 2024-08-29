import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:omogamo/data/data.dart';
import 'package:omogamo/model/country_model.dart';
import 'package:omogamo/model/destination_model.dart';
import 'package:omogamo/model/service_model.dart';
import 'package:omogamo/views/details.dart';
import 'package:omogamo/views/menu.dart';
import 'package:omogamo/views/detailsservice.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// void main() => runApp(SearchBarDemoApp());

class AllDestinations extends StatefulWidget {
  @override
  _AllDestinations createState() => _AllDestinations();
}

class _AllDestinations extends State<AllDestinations> {
  bool isItemAvailable = true;
  late SearchBar searchBar;

  List<PopularTours> popularTourModels = [];
  List<CountryModel> country = [];
  List<Service> services = [];
  List<Destination> destination = [];
  List<Destination> originalDestination = [];

  bool loading = true;

  Future<void> getData() async {
    try {
      final response = await http.get(Uri.parse("https://raw.githubusercontent.com/davekassaw/servicegithub.json/main/s.json"));
      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        
        if (decodedData['features'] != null && decodedData['features'].isNotEmpty) {
          for (var feature in decodedData['features']) {
            Service serv = Service(
              feature['properties']['full_name'] ?? '',
              feature['properties']['short_name'] ?? '',
              feature['properties']['zone'] ?? '',
              feature['properties']['wereda'] ?? '',
              feature['properties']['kebele'] ?? '',
              feature['properties']['locality_n'] ?? '',
              feature['properties']['phone_line'] ?? '',
              feature['properties']['email'] ?? '',
              feature['properties']['Service'] ?? '',
              feature['properties']['service_ty'] ?? '',
              feature['properties']['code'] ?? '',
              feature['properties']['img'] ?? '',
              feature['properties']['website'] ?? '',
              feature['geometry']['coordinates']?[0] ?? 0.0,
              feature['geometry']['coordinates']?[1] ?? 0.0,
            );
            services.add(serv);
          }
        }
      } else {
        print("Failed to get a successful response");
      }
    } catch (e) {
      print("Error occurred: $e");
    }
  }

  Future<void> getdestinationData() async {
    try {
      final response = await http.get(Uri.parse("https://raw.githubusercontent.com/davekassaw/datafinal/main/finaldata.json"));
      if (response.statusCode == 200) {
        String data = response.body;
        var decodedDatatwo = jsonDecode(data);
        
        if (decodedDatatwo != null && decodedDatatwo.isNotEmpty) {
          for (var item in decodedDatatwo) {
            Destination destiny = Destination(
              item['full_name'] ?? '',
              item['short_name'] ?? '',
              item['zone'] ?? '',
              item['wereda'] ?? '',
              item['kebele'] ?? '',
              item['organizati'] ?? '',
              item['status'] ?? '',
              item['area_sqkm'] ?? '',
              item['unesco_reg'] ?? '',
              item['descriptio'] ?? '',
              item['destinatio'] ?? '',
              item['x'] ?? 0.0,
              item['y'] ?? 0.0,
              item['image1'] ?? '',
            );
            destination.add(destiny);
          }
        }
      } else {
        print("Failed to get a successful response");
      }
    } catch (e) {
      print("Error occurred: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
    getdestinationData().then((_) {
      originalDestination.addAll(destination);
      country = getCountrys();
      popularTourModels = getPopularTours().cast<PopularTours>();
      hotReload();
    });
  }

  Future<void> hotReload() async {
    Future.delayed(Duration(seconds: 6)).then((_) {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          color: Color(0xffC4CEDD),
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
            Image.asset(
              "assets/images/logo.png",
              height: 25,
            ),
          ],
        ),
        actions: [
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: const Icon(
                Icons.more_vert,
                color: Color(0xff000000),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MenuPage(key: UniqueKey()),
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
                autofocus: false,
                onChanged: (searchText) {
                  searchText = searchText.toLowerCase();
                  setState(() {
                    if (searchText.isEmpty) {
                      destination = List.from(originalDestination);
                    } else {
                      destination = originalDestination.where((u) {
                        var fName = u.dfullname.toLowerCase();
                        return fName.contains(searchText);
                      }).toList();
                    }
                    isItemAvailable = destination.isNotEmpty;
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search Places',
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                "Natural Destinations",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Divider(color: Colors.blue),
              loading
                  ? Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 0,
                      ),
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: destination.length,
                      itemBuilder: (BuildContext context, int index) {
                        var currentDestination = destination[index];
                        if (currentDestination.dzone == "Gamo") {
                          return PopularTours(
                            dfullname: currentDestination.dfullname,
                            ddestinatio: currentDestination.ddestinatio,
                            dunescoreg: currentDestination.dunescoreg,
                            dshortname: currentDestination.dshortname,
                            dcoordinates: currentDestination.dcoordinates,
                            dcoordinatesy: currentDestination.dcoordinatesy,
                            destinationnnn: currentDestination.destinationnnn,
                            dzone: currentDestination.dzone,
                            imgdest: currentDestination.imgdest,
                          );
                        } else {
                          return SizedBox.shrink();
                        }
                      },
                    ),
              if (!loading && !isItemAvailable)
                const Center(
                  child: Text(
                    'Destination not available',
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(
              imgUrl: imgdest,
              placeName: dfullname.length > 15
                  ? dfullname.substring(0, 15) + '...'
                  : dfullname,
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
        height: 130,
        margin: const EdgeInsets.only(left: 0, top: 10),
        decoration: const BoxDecoration(
          color: Colors.brown,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
              child: CachedNetworkImage(
                imageUrl: imgdest,
                height: 100,
                width: 210,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 7),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                dfullname,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                dshortname,
                style: const TextStyle(
                  fontSize: 8,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
