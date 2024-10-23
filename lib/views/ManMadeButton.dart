import 'dart:convert';
// import 'dart:html';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:omogamo/data/data.dart';
import 'package:omogamo/model/country_model.dart';
import 'package:omogamo/model/destination_model.dart';
import 'package:omogamo/model/service_model.dart';
// import 'package:omogamo/views/home.dart';
// import 'package:omogamo/views/hhome.dart';

// import 'package:omogamo/model/imagedb.dart';
import 'package:omogamo/model/popular_tours_model.dart';
import 'package:omogamo/views/details.dart';
// import 'package:omogamo/utils/colors.dart';
import 'package:omogamo/views/menu.dart';
// import 'package:omogamo/views/detailsservice.dart';
// import 'package:omogamo/views/loading_widget.dart';
// import 'package:discounttour/views/menu.dart';
// import 'package:omogamo/utils/next_screen.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart' ;
import 'package:flutter/material.dart' hide SearchBar;
import 'package:http/http.dart' as http;
// import 'package:autocomplete_textfield/autocomplete_textfield.dart';
// import 'package:discounttour/utils/next_screen.dart';
// class SearchBarDemoApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//         title: 'Search Bar Demo',
//         theme: new ThemeData(primarySwatch: Colors.blue),
//         home: new Home());
//   }
// }


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

class ManMadeButton extends StatefulWidget {
  @override
  _ManMadeButton createState() => _ManMadeButton();
   _ManMadeButton createStatte() => new _ManMadeButton();
}

class _ManMadeButton extends State<ManMadeButton> {

  bool isItemAvailable = true;
  late SearchBar searchBar;

  List<PopularTourModel> popularTourModels = [];
  List<CountryModel> country = [];
  List<Service> services = [];
  List<Destination> destination = [];
  List<Destination> originalDestination = [];
  bool loading = true;

  Future<void> getdestinationData() async {
    try {
      final response = await http.get(Uri.parse("https://esruuw.github.io/tourism_destination/destination.json"));
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
    // getData();
    getdestinationData().then((_) {
      originalDestination.addAll(destination);
      country = getCountrys();
      popularTourModels = getPopularTours();
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
                "Man Made Destinations",
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
  PopularTours(
      {
  
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
                  
if(dzone == "Gamo")
{
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
                      
                    
                      
                    )
                    )
                    );
      },
        child:  Container(
        margin: const EdgeInsets.only(left: 0,top: 10),
        decoration: const BoxDecoration(

      color: Color.fromARGB(255, 179, 4, 112), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight:Radius.circular(10),topLeft:Radius.circular(5), topRight:Radius.circular(5), )),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ClipRRect(
              borderRadius:BorderRadius.circular(5),
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

                  const SizedBox(
                    height: 3,
                  ),
                                Text(
                    dfullname.length > 15 ? dfullname.substring(0, 15) + '...' : dfullname,
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
                    "" + dzone,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
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
else
{
  return Container(alignment: null, height: 0.0, width: 0.0,);
}           
  }
}



