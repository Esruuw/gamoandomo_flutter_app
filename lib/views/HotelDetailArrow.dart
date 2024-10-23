import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:omogamo/data/data.dart';
import 'package:omogamo/model/country_model.dart';
import 'package:omogamo/model/destination_model.dart';
import 'package:omogamo/model/new_service_model.dart'; // Change the import to your new model
import 'package:omogamo/model/popular_tours_model.dart';
import 'package:omogamo/views/detailsservice.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'package:http/http.dart' as http;
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

class HotelDetailArrow extends StatefulWidget {
  @override
  _HotelDetailArrow createState() => _HotelDetailArrow();
   _HotelDetailArrow createStatte() => new _HotelDetailArrow();
}

class _HotelDetailArrow extends State<HotelDetailArrow> {

  
 late SearchBar searchBar;  // Declaring searchBar as late
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Search Bar Demo'),
      actions: [searchBar.getSearchAction(context)],
    );
  }

  List<PopularTourModel> popularTourModels = [];
  List<CountryModel> country = [];
  List<New_Service> services = [];
  List<Destination> destination = [];
  bool loading = true;
Future<void> getData() async {
  try {
    final response = await http.get(Uri.parse("https://esruuw.github.io/new_tourism_g_omo_service/ga_omo_service.json"));

    if (response.statusCode == 200) {
      String data = response.body;
      // Removed print("Response body: $data");

      var decodedData = jsonDecode(data);

      if (decodedData == null) {
        // Removed print("Error: Decoded data is null");
        return;
      }

      if (decodedData.isEmpty) {
        // Removed print("Empty data received");
      } else if (decodedData is List) {  // Ensure it's a List
        // Removed print("Data is a list");

        for (var i = 0; i < decodedData.length; i++) {
          var properties = decodedData[i] ?? {};  // Safely get the properties
          if (properties.isEmpty) {
            continue;
          }

          // Safely access each property
            New_Service serv = New_Service(
            int.tryParse(properties['id'].toString()) ?? 0,
            properties['geom'] ?? '',
            int.tryParse(properties['objectid'].toString()) ?? 0,
            double.tryParse(properties['x'].toString()) ?? 0.0,
            double.tryParse(properties['y'].toString()) ?? 0.0,
            double.tryParse(properties['z'].toString()) ?? 0.0,
            int.tryParse(properties['code'].toString()) ?? 0,
            properties['full_name'] ?? '',
            properties['short_name'] ?? '',
            properties['zone'] ?? '',
            properties['wereda'] ?? '',
            properties['kebele'] ?? '',
            properties['phone_line'] ?? '',
            properties['email'] ?? '',
            properties['website'] ?? '',
            properties['service_ty'] ?? '',
            properties['owner_name'] ?? '',
            properties['moto'] ?? '',
            properties['image1'] ?? ''
          );

          services.add(serv);
        }
      } 
      else
       {
      }
    } else {
    }
  }
   catch (e) 
   {
    // Removed print("An error occurred: $e");
  }
}



  @override
  void initState() {
    super.initState();
    getData();
    country = getCountrys();
    popularTourModels = getPopularTours();
    loading = true;
    hotReload();
  }

  Future<void> hotReload() async {
    Future.delayed(const Duration(seconds: 6)).then((value) {
      setState(() {
        loading = false;
      });
    });
  }

  listOfServices(index) {
    return CountryListTile(
      fullname: services[index].fullName,
      shortname: services[index].shortName ?? '',
      // img: 'img_url', // Use a valid image URL
      zone: services[index].zone,
      code: services[index].code,
      wereda: services[index].wereda,
      xcoordinates: services[index].x,
      ycoordinates: services[index].y,
      phoneLine: services[index].phoneLine ?? '',
      phoneNobile: 'mobile_number', // Add a proper field for mobile number
      website: services[index].website ?? '',
      img: services[index].img,

    );
  }

   @override
  Widget build(BuildContext context) {
    var inkWell = InkWell(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Icon(
              Icons.more_vert,
             color: Color(0xff000000),
            ),
          ),
          // onTap: () {
          //           nextScreen(context, MenuPage());
          //         },
          
                     onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MenuPage(key: UniqueKey()),
    ),
  );
},
          
          // onTap: () => Home(),
          );
      
     
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          color: const Color(0xffC4CEDD),
          padding: const EdgeInsets.all(1),
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
          inkWell,
        ],
      
        elevation: 0.0,
        
      ),
           
      body:SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                  child: Container(
              
                    
      child: TextField(
        autofocus: false,
        onChanged: (searchText) {
          searchText = searchText.toLowerCase();
          setState(() {
            services = services.where((u) {
              var fName = u.fullName.toLowerCase();
              var lName = u.fullName.toLowerCase();
              var job = u.fullName.toLowerCase();
              return fName.contains(searchText) || lName.contains(searchText) || job.contains(searchText);
            }).toList();
          });
        },
        // controller: _textController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
          hintText: 'Search Places',
        ),
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
                const SizedBox(
                height: 18,
              ),
              const Divider(
color: Colors.blue, 
),

 
                       const Row(children: [

                          Text(
                                 "Hotel and Restaurant",
                                 style: TextStyle(
                                 fontSize: 20,
                                 color: Colors.black54,
                                 fontWeight: FontWeight.w600),
                               ),
               
                     ],),
                         
    loading == true ? Center(child: CircularProgressIndicator()) :
                                                  SingleChildScrollView(
                                                    child:Container(
                                                  // height: 1000,
                                                   width: double.infinity,
                                                   child: ListView.builder(
                                                   itemCount: services.length,
                                                   shrinkWrap: true,
                                                   physics: ClampingScrollPhysics(),
                                                   scrollDirection: Axis.vertical,
                                                    itemBuilder: (BuildContext context, int index) {
                                                    return  listOfServices(index);
                                                       }),
                                                 ),
                                                ),

                              ],
                             )
                                                                  
                              ),
                                 ),
                                                              
                            );  
                                                       
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
              xcoordinates: xcoordinates,
              ycoordinates: ycoordinates,
              wereda: wereda,
              img: img,
            ),
          ),
        );
      },
     child:Container(

        margin: const EdgeInsets.only(left: 0,top: 10),
        decoration: const BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight:Radius.circular(10),topLeft:Radius.circular(5), topRight:Radius.circular(5), )),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
               borderRadius:BorderRadius.circular(5),
               
              child: CachedNetworkImage(
                imageUrl: img,
                width: 344,
                height: 150,
                fit: BoxFit.cover,
              ),
               ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                 // maqaa isa duree
                  
                  const SizedBox(
                    height: 3,
                  ),
                                    Text(
                    fullname.length > 15 ? fullname.substring(0, 15) + '...' : fullname,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),

                 
                  const SizedBox(
                    height: 6,
                  ),
 
                  Text(
                    //dunescoreg + "sdafl",
                    "Zone: " + zone,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  )
                ],
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
