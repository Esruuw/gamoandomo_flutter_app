import 'dart:convert';
// import 'dart:html';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:omogamo/data/data.dart';
import 'package:omogamo/model/country_model.dart';
import 'package:omogamo/model/destination_model.dart';
import 'package:omogamo/model/service_model.dart';
// import 'package:omogamo/views/NaturalButton.dart';
// import 'package:omogamo/views/hhome.dart';
// import 'package:omogamo/views/Man_Made.dart';
// import 'package:omogamo/views/CulturalButton.dart';
// import 'package:omogamo/views/GamoDestinations.dart';

// import 'package:omogamo/model/imagedb.dart';
import 'package:omogamo/model/popular_tours_model.dart';
// import 'package:omogamo/views/details.dart';
// import 'package:omogamo/utils/colors.dart';
import 'package:omogamo/views/menu.dart';
import 'package:omogamo/views/detailsservice.dart';
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

class HotelDetailArrow extends StatefulWidget {
  @override
  _HotelDetailArrow createState() => _HotelDetailArrow();
   _HotelDetailArrow createStatte() => new _HotelDetailArrow();
}
// class Task extends StatefulWidget {
  
//   @override

//   _HomeState createState() => _HomeState();
//    _HomeState createStatte() => new _HomeState();
// }

class _HotelDetailArrow extends State<HotelDetailArrow> {

  
late SearchBar searchBar;
  // ignore: unused_field
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        title: new Text('Search Bar Demo'),
        actions: [searchBar.getSearchAction(context)]);
  }

  // void onSubmitted(String value) {
  //   setState(() => _scaffoldKey.currentState
    
  //       .showSnackBar(new SnackBar(content: new Text('You wrote $value!'))));
  // }

  List<PopularTourModel> popularTourModels = [];
  List<CountryModel> country = [];
  List<Service> services = [];
  List<Destination> destination = [];
  // List<Imagedb> myimage = [];
  bool loading = true;

  Future getData() async {
    http.Response response = await http.get("https://raw.githubusercontent.com/davekassaw/servicegithub.json/main/s.json" as Uri);
     if (response.statusCode == 200) {
      String data = response.body;
      print("Got the response from destination");
      print(data);
      var decodedData = jsonDecode(data);
      print("The below is decoded Destination Data");
      print(decodedData);
      if (decodedData['features'].isEmpty) {
        print("Empty");
      } else {
        for (var i = 0; i < decodedData['features'].length; i++) {
          // var x= decodedData['features'][i]['geometry']['coordinates']['0,1'];
          
          Service serv = Service(
            decodedData['features'][i]['properties']['full_name'],
            decodedData['features'][i]['properties']['short_name'],
            decodedData['features'][i]['properties']['zone'],
            decodedData['features'][i]['properties']['wereda'],
            decodedData['features'][i]['properties']['kebele'],
            decodedData['features'][i]['properties']['locality_n'],
            decodedData['features'][i]['properties']['phone_line'],
            decodedData['features'][i]['properties']['email'],
            decodedData['features'][i]['properties']['Service'],
            decodedData['features'][i]['properties']['service_ty'],
            decodedData['features'][i]['properties']['code'],
            decodedData['features'][i]['properties']['img'],
            decodedData['features'][i]['properties']['website'],
            decodedData['features'][i]['geometry']['coordinates'][0],
            decodedData['features'][i]['geometry']['coordinates'][1],
            
            // decodedData['features'][i]['geometry']['coordinates'],

          );
          services.add(serv);
        
        //print(destination[i].destinatio);
        }
        print("not empty");
      }
    } else {
      print("OOPs we didnt");
    }
  }
  // List<Destination> destination = [];

  Future getdestinationData() async {
    http.Response response = await http.get("https://raw.githubusercontent.com/davekassaw/datafinal/main/finaldata.json" as Uri);
    if (response.statusCode == 200) {
      String data = response.body;
      print("Got the response from destination");
      print(data);
      var decodedDatatwo = jsonDecode(data);
      print("The below is decoded Destination Data");
      print(decodedDatatwo);
      if (decodedDatatwo.isEmpty) {
        print("Empty");
      } else {
        for (var i = 0; i < decodedDatatwo.length; i++) {
    // for (var i = 0; i < decodedData['features'].length; i++) {
        
          Destination destiny = Destination(
            decodedDatatwo[i]['full_name'],
            decodedDatatwo[i]['short_name'],
            decodedDatatwo[i]['zone'],
            decodedDatatwo[i]['wereda'],
            decodedDatatwo[i]['kebele'],
            decodedDatatwo[i]['organizati'],
            decodedDatatwo[i]['status'],
            decodedDatatwo[i]['area_sqkm'],
            //decodedDatatwo['features'][i]['properties']['Estimated'],
            decodedDatatwo[i]['unesco_reg'],
            decodedDatatwo[i]['descriptio'],
            decodedDatatwo[i]['destinatio'],
            decodedDatatwo[i]['x'],
            decodedDatatwo[i]['y'],
            decodedDatatwo[i]['image1'],
                );
        destination.add(destiny);
        print("trying fullname and coordinate print");
        print("d fullname print" + destination[i].dfullname);
        print(destination[i].dcoordinates);
        print(destination[i].dcoordinatesy);

        }
        print("not empty");
      }
    } else {
      print("OOPs we didnt");
    }
  }


  @override
  void initState() {
    super.initState();

        destination = destination;
        print(destination.length);
 
    getData();
    getdestinationData();
    country = getCountrys();
    popularTourModels = getPopularTours();
    loading = true;

    print("Init state");
    print(loading);
    hotReload();
    
    
  }
  

  Future hotReload() async {
    Future.delayed(Duration(seconds: 6)).then((value) {
      setState(() {
        print("Delayed print value");
        loading = false;
        print("hot reload");
        print(loading);
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
    var inkWell = InkWell(
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
          
          );

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
          inkWell,
        ],
      
        elevation: 0.0,
        
      ),
           
      body:SingleChildScrollView(
        
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
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
              var fName = u.fullname.toLowerCase();
              var lName = u.fullname.toLowerCase();
              var job = u.fullname.toLowerCase();
              return fName.contains(searchText) || lName.contains(searchText) || job.contains(searchText);
            }).toList();
          });
        },
        // controller: _textController,
        decoration: InputDecoration(
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
                SizedBox(
                height: 18,
              ),
Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 
                  
                  
                                  
       ],
                                                   
       ),
                                                                
     SizedBox(
    height: 4,
      ),
      Text(
     "Hotel and Restaurantss",
    style: TextStyle(
    fontSize: 20,
    color: Colors.black54,
     fontWeight: FontWeight.w600),
                                                       
      ),

                                                 SizedBox(
                                                   height: 8,
                                                 ),
Divider(
color: Colors.blue, 
),
                                   
                                                 
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
                                                )
                                                ],
                                               
       ),
                                             
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
                     phoneNobile:phoneNobile,
                     website: website,
                     xcoordinates: xcoordinates,
                     ycoordinates: ycoordinates,
                     wereda:wereda, img: '',

                      
                    )));
      },
    
      child:Container(

        margin: EdgeInsets.only(left: 0,top: 10),
        decoration: BoxDecoration(
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
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                 // maqaa isa duree
                  
                  SizedBox(
                    height: 3,
                  ),
                                    Text(
                    fullname.length > 15 ? fullname.substring(0, 15) + '...' : fullname,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),

                 
                  SizedBox(
                    height: 6,
                  ),
 
                  Text(
                    //dunescoreg + "sdafl",
                    "Zone: " + zone,
                    style: TextStyle(
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
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
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
                        margin: EdgeInsets.only(left: 8, top: 8),
                        padding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white38),
                        child: const Text(
                           "New",
                          style: TextStyle(color: Colors.white),
                         ) ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10, left: 8, right: 8),
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
                    Spacer(),
                    Container(
                        margin: EdgeInsets.only(bottom: 10, right: 8),
                        padding:
                            EdgeInsets.symmetric(horizontal: 3, vertical: 7),
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
 