import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:http/http.dart' as http;
import 'package:omogamo/data/data.dart';
import 'package:omogamo/model/country_model.dart';
import 'package:omogamo/model/destination_model.dart';
import 'package:omogamo/model/popular_tours_model.dart';
import 'package:omogamo/model/service_model.dart';
import 'package:omogamo/views/detailsservice.dart';
import 'package:omogamo/views/details.dart';
import 'package:omogamo/views/menu.dart';

class SearchBarDemoApp extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    return new MaterialApp(
      // double totalSearchBarSize;
        title: 'Search Bar Demo',
        theme: new ThemeData(primarySwatch: Colors.blue),
        home: new SearchBarDemoApp()
        
        );
  }
  
}

class OmoDestinations extends StatefulWidget {
  @override
  _OmoDestinations createState() => _OmoDestinations();
   _OmoDestinations createStatte() => new _OmoDestinations();
}

class _OmoDestinations extends State<OmoDestinations> {

  bool isItemAvailable = true;
  late SearchBar searchBar;

  List<PopularTourModel> popularTourModels = [];
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
      print("Got the response from destination");
      var decodedData = jsonDecode(data);
      print("The below is decoded Destination Data");

      if (decodedData['features'].isEmpty) {
        print("Empty");
      } else {
        for (var i = 0; i < decodedData['features'].length; i++) {
          var feature = decodedData['features'][i];
          var properties = feature['properties'];
          var geometry = feature['geometry'];

          Service serv = Service(
            properties['full_name'] ?? '',
            properties['short_name'] ?? '',
            properties['zone'] ?? '',
            properties['wereda'] ?? '',
            properties['kebele'] ?? '',
            properties['locality_n'] ?? '',
            properties['phone_line'] ?? '',
            properties['email'] ?? '',
            properties['Service'] ?? '',
            properties['service_ty'] ?? '',
            properties['code'] ?? '',
            properties['img'] ?? '',
            properties['website'] ?? '',
            geometry['coordinates'][0] ?? 0.0,
            geometry['coordinates'][1] ?? 0.0,
          );
          services.add(serv);
        }
        print("not empty");
      }
    } else {
      print("Oops, we didn't get a successful response");
    }
  } catch (e) {
    print("An error occurred: $e");
  }
}

  Future<void> getDestinationData() async {
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
        destination = destination;
        print(destination.length);
    
    getData();
    getDestinationData();
    country = getCountrys();
    popularTourModels = getPopularTours();
    loading = true;
    print("Init state");
    print(loading);
    hotReload();
    }

  Future<void> hotReload() async {
    Future.delayed(Duration(seconds: 6)).then((_) {
      setState(() {
        loading = false;
      });
    });
  }
  listOfServices(index) { 
    return CountryListTile(
            fullname: services[index].fullname,
            shortname: services[index].shortname,
            img: services[index].img,
            // myData[index]['logo_url'],
            zone: services[index].zone,
            code: services[index].code,
            wereda: services[index].wereda,
            xcoordinates: services[index].xcoordinates,
            ycoordinates: services[index].ycoordinates,
            phoneLine: services[index].phoneLine,
            phoneNobile:services[index].phoneNobile,
            website: services[index].website,

          );
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
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
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
                "Gamo Zone Hotels",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              const Divider(color: Colors.blue),
              loading
                  ? Center(child: CircularProgressIndicator())
                  :   Container(
                       height: 250,
                       width: double.infinity,
                      child: ListView.builder(
                      // itemCount: services.length,
                        itemCount: services.length,
                        shrinkWrap: true,
                       //physics:NeverScrollableScrollPhysics(),
                         scrollDirection: Axis.horizontal,
                         itemBuilder: (BuildContext context, int index) {
                         return  listOfServices(index);
                           }),
                            ),
                   
              if (!loading && !isItemAvailable)
                const Center(
                  child: Text(
                    'Destination not available',
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                ),
              const SizedBox(height: 18),
              const Text(
                "All Gamo Destinations",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              const Divider(color: Colors.blue),
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

  const PopularTours({
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
                placeName: dfullname.length > 15 ? dfullname.substring(0, 15) + '...' : dfullname,
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
          margin: const EdgeInsets.only(left: 0, top: 10),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 167, 11, 133),
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
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  imageUrl: imgdest,
                  width: 170,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 3),
                    Text(
                      dfullname.length > 15 ? dfullname.substring(0, 15) + '...' : dfullname,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "" + dzone,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 6),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
class CountryListTile extends StatelessWidget {
  final String fullname;
  final double xcoordinates;
  final double ycoordinates;
  final String shortname;
  final String img;
  final String zone;
  final String phoneLine;
  final String phoneNobile;
  final int code;
  final String wereda;
  final String website;
 
  CountryListTile({
      required this.fullname,
      required this.xcoordinates,
      required this.ycoordinates,
      required this.shortname,
      required this.img,
      required this.zone,
      required this.phoneLine,
      required this.phoneNobile,
      required this.code,
      required this.wereda,
      required this.website,

      });
@override
  Widget build(BuildContext context) {
    return GestureDetector(
      //ontap hotel and restaurant
onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Detailsservice(
        imgUrl: img,
        placeName: fullname.length > 15 ? fullname.substring(0, 15) + '...' : fullname,
        rating: 4.5,
        fullname: fullname,
        zone: zone,
        code: code,
        phoneLine: phoneLine,
        phoneNobile: phoneNobile,
        website: website,
        xcoordinates: xcoordinates, // Ensure this is passed correctly
        ycoordinates: ycoordinates, // Ensure this is passed correctly
        wereda: wereda,
        img: img,
      ),
    ),
  );
},
      child:Container(
               margin: const EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
            color: Colors.blueGrey[100], borderRadius: BorderRadius.circular(0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
               borderRadius:BorderRadius.circular(10),
               
              child: CachedNetworkImage(
                imageUrl: img,
                width: 170,
                height: 195,
                fit: BoxFit.cover,
              ),
               ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 // maqaa isa duree
                  Text(
                    fullname.length > 15 ? fullname.substring(0, 15) + '...' : fullname,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
            //       //maqaa zoonii attaraction site kan qabatee jiru
                  Text(
                    //"description", // desc
                    "Zone:" + zone,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
     
    );
  }

}
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: "https://pix10.agoda.net/hotelImages/5502207/0/9118b486f9ffd30d0a49b1860822fdfc.jpg",
              height: 220,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 200,
            width: 150,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 8, top: 8),
                        padding:
                            const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white38),
                        child: const Text(
                           "New",
                          style: TextStyle(color: Colors.white),
                         ) ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10, left: 8, right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: const Text(
                              "Thailand",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text(
                            "Keble:Lante Achole",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                        margin: const EdgeInsets.only(bottom: 10, right: 8),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.white38),
                        child: const Column(
                          children: [
                            Text(
                              "46",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 20,
                            )
                          ],
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
      
    );
  
  }