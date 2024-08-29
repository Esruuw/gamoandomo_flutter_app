import 'dart:convert';
// import 'dart:html';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:omogamo/data/data.dart';
//import 'package:connectivity/connectivity.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:omogamo/model/country_model.dart';
import 'package:omogamo/model/destination_model.dart';
import 'package:omogamo/model/service_model.dart';
import 'package:omogamo/views/NaturalButton.dart';
// import 'package:omogamo/views/hhome.dart';
// import 'package:omogamo/views/Man_Made.dart';
import 'package:omogamo/views/CulturalButton.dart';
import 'package:omogamo/views/GamoDestinations.dart';
import 'package:omogamo/views/HotelDetailArrow.dart';
import 'package:omogamo/views/ManMadeButton.dart';
import 'package:omogamo/views/OmoDestinations.dart';
// import 'package:omogamo/views/SpinCheck.dart';
//import 'package:omogamo/views/SpinWheel.dart';
//import 'package:omogamo/views/NewSpinCheck.dart';

import 'package:omogamo/views/AllDestinations.dart';

// import 'dart:math';

// import 'package:omogamo/model/imagedb.dart';
import 'package:omogamo/model/popular_tours_model.dart';
import 'package:omogamo/views/details.dart';
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

class Home extends StatefulWidget {
  @override
 _HomeState createState() => _HomeState();
 _HomeState createStatte() => new _HomeState();
}

class _HomeState extends State<Home>
 {
late SearchBar searchBar;
  // ignore: unused_field
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
AppBar buildAppBar(BuildContext context) 
{
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
  // List<Destination> destination = [];

Future<void> getdestinationData() async {
  const url = "https://raw.githubusercontent.com/davekassaw/datafinal/main/finaldata.json";
  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = response.body;
      final List<dynamic> decodedDatatwo = jsonDecode(data);

      if (decodedDatatwo.isEmpty) {
        print("Data is empty");
      } else {
        for (var i = 0; i < decodedDatatwo.length; i++) {
          final item = decodedDatatwo[i];

          // Handling null values by providing default values
          final destinationItem = Destination(
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
            item['x']?.toDouble() ?? 0.0, // Ensure it's a double
            item['y']?.toDouble() ?? 0.0, // Ensure it's a double
            item['image1'] ?? '',
          );

          destination.add(destinationItem);
        }
        print("Data loaded successfully");
      }
    } else {
      print("Failed to load data: ${response.statusCode}");
    }
  } catch (e) {
    print("An error occurred: $e");
  }
}

// Future getimagedata() async {
//     http.Response response = await http.get("https://raw.githubusercontent.com/ermyas04/newimage/main/image.json");
//     if (response.statusCode == 200) {
//       String data = response.body;
//       print("Got the response from destination");
//       print(data);
//       var imageData = jsonDecode(data);
//       print("The below is decoded Destination Data");
//       print(imageData);
//       if (imageData['https://raw.githubusercontent.com/ermyas04/newimage/main/image.json'].isEmpty) {
//         print("Empty");
//       } else {
//         for (var i = 0; i < imageData['imagejson'].length; i++) {
//           //  Destination destiny = Destination(
//           Imagedb img = Imagedb(
//             imageData['imagejson']['image'],
            

//           );
// 

//         //print(services[i].fullname);
//         //print(destination[i].destinatio);
//         //print(destination[i].destimated);
//         }
//         print("not empty");
//       }
//     } else {
//       print("OOPs we didnt");
//     }
//   }
// // _users.addAll(value);
// // _usersDisplay = _users;
  
  @override
  void initState() {
    super.initState();
    checkNetworkConnectivity(context); // Check network connectivity on app startup
   //shuffleDestinations();
    // destination().then((value) {
      // setState(() {
      //   loading = false;
      //   destination.addAll(destination);
        destination = destination;
        print(destination.length);
      // });
    // }
    // );
   
    getData();
    getdestinationData();
    country = getCountrys();
    popularTourModels = getPopularTours();
    loading = true;
    // _users.addAll(value);
    // destination = _users;
    // users.addAll(value);
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
  
listOfGamodestination(index) { 
    return GamoDestination(
            dfullname: destination[index].dfullname,
            dshortname: destination[index].dshortname,
            ddestinatio: destination[index].ddestinatio,
            dunescoreg: destination[index].dunescoreg,
            dcoordinates: destination[index].dcoordinates,
            dcoordinatesy: destination[index].dcoordinatesy,
            destinationnnn: destination[index].destinationnnn,
            dzone: destination[index].dzone,
            imgdest: destination[index].imgdest         
          
            
          );
  }
  listOfOmodestination(index) { 
    return OmoDestination(
            dfullname: destination[index].dfullname,
            dshortname: destination[index].dshortname,
            ddestinatio: destination[index].ddestinatio,
            dunescoreg: destination[index].dunescoreg,
            dcoordinates: destination[index].dcoordinates,
            dcoordinatesy: destination[index].dcoordinatesy,
            destinationnnn: destination[index].destinationnnn,
            dzone: destination[index].dzone,
            imgdest: destination[index].imgdest         
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
        // Container(
        //   child: ListView.builder(
        //     itemBuilder: (context, index) {
        //       if (!loading) {
        //         return index == 0 ? TextField() : (this.destination[index - 1]);
        //       } else {
        //         return LoadingView();
        //       }
        //     },
        //     //  itemCount: services?.length,
        //      itemCount: destination.length,
        //     // itemCount: destination.length,
        //     //?? true
        //   //  itemCount: destination?.length ?? 0
        //     //  itemCount: destination?.length ??  0
           
        //   ),
        // );
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
            
            // Text(
            //   "Tourist-Map",
            //   style:
            //       TextStyle(color: tr2, fontWeight: FontWeight.w600),
                  
            // )
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
                    // alignment: Alignment.center,
                    // margin: EdgeInsets.only(left: 15, right: 5),
                    // padding: EdgeInsets.only(left: 15, right: 15),
                    // height: 40,
                    // // widthFactor: 0.8,
                    // // width: 280,
                    // width: 150,
                    // decoration: BoxDecoration(
                    //   color: Colors.grey[100],
                    //   border: Border.all(color: Colors.grey[300], width: 0.5),
                    //   borderRadius: BorderRadius.circular(8),
                    // ),
                    
      child: TextField(
        autofocus: false,
        onChanged: (searchText) {
          searchText = searchText.toLowerCase();
          setState(() {
            destination = destination.where((u) {
              var fName = u.dfullname.toLowerCase();
              var lName = u.dfullname.toLowerCase();
              var job = u.dfullname.toLowerCase();
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
                  Row(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 
                  // Link(
                  //   icon: Icon(Icons.clear_all_rounded, color: Color(0xff1A4160), 
                  //   ),
                  //   label: "",
                  // ),

//The following buttons are created for horizontal scrollable icons
Natural_Button(
  icon: const Icon(Icons.photo, color: Color(0xff1A4160)),
  label: "Natural",
  latitude: 12.34,  // Example latitude value
  longitude: 56.78, // Example longitude value
),

ManMade_Button(
  icon: const Icon(Icons.photo, color: Color(0xff1A4160)),
  label: "ManMade",
  latitude: 12.34,  // Example latitude value
  longitude: 56.78, // Example longitude value
),

Cultural_Button(
  icon: const Icon(Icons.photo, color: Color(0xff1A4160)),
  label: "Cultural",
  latitude: 12.34,  // Example latitude value
  longitude: 56.78, // Example longitude value
),

                  //   Omo_Destiny(
                  //  icon: Icon(Icons.photo, color: Color(0xff1A4160),),
                  //  label: "Cultural",
                                     
                  //    ),
                    //   BirdFly(
                    //  icon: Icon(Icons.photo, color: Color(0xff1A4160),),
                    //   label: "Cultural",
                                     
                    // ),
                   
 const Row(
  mainAxisAlignment: MainAxisAlignment.start,

  children: [
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        
        children: [
          // Natural_Button(
          //   icon: Icon(Icons.photo, color: Color(0xff1A4160),),
          //   label: "Natural",
          // ),
          // ManMade_Button(
          //   icon: Icon(Icons.photo, color: Color(0xff1A4160),),
          //   label: "ManMade",
          // ),
          // Gamo_Destiny(
          //   icon: Icon(Icons.photo, color: Color(0xff1A4160),),
          //   label: "Cultural",
         // ),
          // Cultural_Button(
          //   icon: Icon(Icons.photo, color: Color(0xff1A4160),),
          //   label: "GamoDest",
          // ),
          // Omo_Destiny(
          //   icon: Icon(Icons.photo, color: Color(0xff1A4160),),
          //   label: "OmoDest",
          // ),
          // BirdFly(
          //   icon: Icon(Icons.photo, color: Color(0xff1A4160),),
          //   label: "Birdfly",
          // ),
          // Add more buttons here as needed
        ],
      ),
    ),
  ],
) 
                  ],
                                                                      
                                                                    ),
                                                                                   
                       //  SizedBox(
                       // height: 4,
                       //   ),
                              // Divider(color:Colors.blue,),
                   
                       //   Text(
                       //  "Hotel and Restaurantss",
                       // style: TextStyle(
                       // fontSize: 20,
                       // color: Colors.black54,
                       //  fontWeight: FontWeight.w600),
                                                                          
                       //   ),
                       
                       Row(children: [

                        
                          const Text(
                                 "Hotel and Restaurant",
                                 style: TextStyle(
                                 fontSize: 20,
                                 color: Colors.black54,
                                 fontWeight: FontWeight.w600),
                               ),
                         Container(
                     margin: const EdgeInsets.only(left: 100.0),
                     child:IconButton(
                     icon: const Icon(Icons.arrow_forward
                     ),
                     onPressed: () {
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => HotelDetailArrow()),
                       );
                     },
                   )
                     ),
                     ],),
                         
                   loading == true ? Center(child: CircularProgressIndicator()) :
                   //.....1Containeeeeeeeeeeeer for hotel and restaurant
                   Container(
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
                   
                            const SizedBox(
                             height: 28,
                              ),
                                                                    
                                                                   
                                                                    
                                                                    
                                                                    // Text(
                                                                    //   "Clinick",
                                                                    //   style: TextStyle(
                                                                    //       fontSize: 28,
                                                                    //       color: Colors.black54,
                                                                    //       fontWeight: FontWeight.w600),
                                                                    // ),
                                                                   
                                                                                    
                                                                  //  Container(
                                                                  //     height: 240,
                                                                  //     // child: ListView.builder(
                                                                  //     //     itemCount: destination.length,
                                                                  //     //     shrinkWrap: true,
                                                                  //     //     physics: ClampingScrollPhysics(),
                                                                  //     //     scrollDirection: Axis.horizontal,
                                                                  //     //     itemBuilder: (BuildContext context, int index) {
                                                                  //     //       return listOfServices(index);
                                                                  //     //     }),
                                                                  //   ),
                         loading == true ? Center(child: CircularProgressIndicator()) :
                                                        
                   //.............Created for horizontal Scrollable of All destinations
                   Row(children: [
                     const Text(
                     " All Destinations",
                      style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,                                                  
                      fontWeight: FontWeight.w400),
                      ),
                     //Container for Natural forward button
                     
                     Container(
                     margin: const EdgeInsets.only(left: 160.0),
                     child:IconButton(
                     icon: Icon(Icons.arrow_forward),
                     onPressed: () {
                     Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => AllDestinations()),
                       );
                     },
                   )
                   ),
                    ],),         
                           
                      Container(
                    height: 250,
                   color: Colors.white,
                    child: ListView.builder(                                               
                    shrinkWrap: true,
                     //physics: ClampingScrollPhysics(),
                                
                      itemCount: destination.length,
                       // itemCount:6,
                        scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index)
                             {
                               if(index < 6)
                               {
                            var popularTours2 = PopularTours(
                            // desc: popularTourModels[index].desc,
                         // imgUrl: popularTourModels[index].imgUrl,
                          // title: popularTourModels[index].title,
                        // price: popularTourModels[index].price,
                       // rating: popularTourModels[index].rating,
                      dfullname: destination[index].dfullname,
                     ddestinatio: destination[index].ddestinatio,
                     dunescoreg: destination[index].dunescoreg,
                      dshortname: destination[index].dshortname,
                    //destimated: destination[index].destimated,
                      destinationnnn: destination[index].destinationnnn,
                      dcoordinates: destination[index].dcoordinates,
                      dcoordinatesy: destination[index].dcoordinatesy,
                       dzone: destination[index].dzone,
                      imgdest: destination[index].imgdest,
                                                                            
                                                                            
                        );
                      var popularTours = popularTours2;
                       return popularTours;
                   
                               }
                            else
                            {
                             return null;
                            }                                              
                         }
                                                                        
                      ),
                        ),
                    SizedBox(height: 15),
                   
                   
                     const Divider(
                   color: Colors.blue, 
                     ),


                     //.............Container of manmade scrollable attraction site
                     Row(children: [
                     const Text(
                     "Gamo Destinations",
                      style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,                                                  
                      fontWeight: FontWeight.w400),
                      ),
                     //Container for Natural forward button
                     
                     Container(
                     margin: const EdgeInsets.only(left: 140.0),
                     child:IconButton(
                     icon: const Icon(Icons.arrow_forward),
                     onPressed: () {
                     Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => GamoDestinations()
                         ),
                       );
                     },
                   )
                   ),
                    ],),
                   
                   
                   
                     Container(
                    height: 262,
                    //width: 300,
                   color: Colors.white,
                    child: ListView.builder
                    (                                               
                    shrinkWrap: true,
                     //physics: ClampingScrollPhysics(),
                     itemCount: destination.length,
                     //itemCount: 6,
                     scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) 
                           {
                      return listOfGamodestination(index);
                           }
                                                                        
                      ),
                        ),
                     const SizedBox(height: 15),
                   
                   
                          const Divider(
                   color: Colors.blue, 
                     ), 


                    //..container of  cultural destination
                     SizedBox(height: 15),
                     Row(children: [
                     const Text(
                     "Omo Destinations",
                      style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,                                                  
                      fontWeight: FontWeight.w400),
                      ),
                     //Container for Natural forward button
                     
                     Container(
                     margin: const EdgeInsets.only(left: 150.0),
                     child:IconButton(
                     icon: Icon(Icons.arrow_forward),
                     onPressed: () {
                     Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => OmoDestinations()),
                       );
                     },
                   )
                   ),
                    ],),
                   
                   
                   Container(
                    height: 262,
                   color: Colors.white,
                    child: ListView.builder
                    (                                               
                    shrinkWrap: true,
                     //physics: ClampingScrollPhysics(),
                     itemCount: destination.length,
                     //itemCount: 6,
                     scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) 
                           {
                      return listOfOmodestination(index);
                           }
                                                                        
                      ),
                        ),
                   
                     SizedBox(height: 15),
                   
                   
                           const SizedBox(height: 20),
                   
                   
                              ],
                             )
                                                                  
                              ),
                                                                
                                                              ),
                                                              
                                                            );  
                                                          
                                                          
                                                        }
                                                      }
                   

                
       
     //Class for natural icon              
class Natural_Button extends StatelessWidget {
  final Icon icon;
  final String label;
  final double latitude;
  final double longitude;
  Natural_Button({required this.label, required this.icon,required this.latitude,required this.longitude}
  
  );

                           
  @override
  Widget build(BuildContext context) {
   
    return Opacity(
      opacity: 0.7,
  
      child: InkWell(
        onTap: () 
        {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>NaturalButton()
                                    ));
                                                  },
                                                                                                                        
             // onPressed: () 
             // {
           // handleShare();
         // },
                                   child: Container(
                                        child: Column(
                                    children: [
                                   Container(
                                    padding: EdgeInsets.all(8),                                                                                                        decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xff5A6C64).withOpacity(0.5)),
                                 borderRadius: BorderRadius.circular(5)),
                                 child: icon,
                               ),
                                   SizedBox(
                                  height: 9,
                               ),
                              Container(
                              width: 80,
                                  child: Text(
                                   label,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                               fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                 color: Color(0xff5A6C64)),
                           ))
                         ],
                          ),
                   ),
                   ),
               );
                                                                                                                           
                    }
                        }
  
       //Class for manmade_button icon              
  class ManMade_Button extends StatelessWidget {
  final Icon icon;
  final String label;
  final double latitude;
  final double longitude;
  ManMade_Button({required this.label, required this.icon,required this.latitude,required this.longitude}
  
  );

                           
  @override
  Widget build(BuildContext context) {
   
    return Opacity(
      opacity: 0.7,
  
      child: InkWell(
        onTap
        : () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>ManMadeButton()
                  ));
                },
                
                                                                                                                        
                        // onPressed: () {
                        //                     handleShare()
                        //                               // },
                                                      child: Container(
                                                       child: Column(
                                                       children: [
                                                      Container(
                                                     padding: EdgeInsets.all(8),
                                                      decoration: BoxDecoration(
                                                 border: Border.all(color: Color(0xff5A6C64).withOpacity(0.5)),
                                                 borderRadius: BorderRadius.circular(5)),
                                                  child: icon,
                                                   ),
                                                     SizedBox(
                                                       height: 9,
                                                      ),
                                                     Container(
                                                     width: 80,
                                                  child: Text(
                                                 label,
                                    textAlign: TextAlign.center,
                                   style: TextStyle(
                                fontSize: 14,
                              fontWeight: FontWeight.w400,
                             color: Color(0xff5A6C64)),
                            ))
                           ],
                      ),
                    ),
                ),
               );
                                                                                                                           
                 }
                    }

  //Class for cultural_button icon              
  class Cultural_Button extends StatelessWidget {
  final Icon icon;
  final String label;
  final double latitude;
  final double longitude;
  Cultural_Button({required this.label, required this.icon,required this.latitude,required this.longitude}
  
  );

                           
  @override
  Widget build(BuildContext context) {
   
    return Opacity(
      opacity: 0.7,
  
      child: InkWell(
        onTap
        : () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>CulturalButton()
                  ));
                },
                
                                                                                                                        
                        // onPressed: () {
                        //                     handleShare()
                        //                               // },
                                                      child: Container(
                                                       child: Column(
                                                       children: [
                                                      Container(
                                                     padding: EdgeInsets.all(8),
                                                      decoration: BoxDecoration(
                                                 border: Border.all(color: Color(0xff5A6C64).withOpacity(0.5)),
                                                 borderRadius: BorderRadius.circular(5)),
                                                  child: icon,
                                                   ),
                                                     SizedBox(
                                                       height: 9,
                                                      ),
                                                     Container(
                                                     width: 80,
                                                  child: Text(
                                                 label,
                                    textAlign: TextAlign.center,
                                   style: TextStyle(
                                fontSize: 14,
                              fontWeight: FontWeight.w400,
                             color: Color(0xff5A6C64)),
                            ))
                           ],
                      ),
                    ),
                ),
               );
                                                                                                                           
                 }
                    }
                   
//   //Class for gamo_destiny icon              
// class Gamo_Destiny extends StatelessWidget {
//   final Icon icon;
//   final String label;
//   final double latitude;
//   final double longitude;
//   Gamo_Destiny({this.label, this.icon,this.latitude,this.longitude}
  
//   );

                           
//   @override
//   Widget build(BuildContext context) {
   
//     return Opacity(
//       opacity: 0.7,
  
//       child: InkWell(
//         onTap: () 
//         {
//                     Navigator.push(context,
//                     MaterialPageRoute(builder: (context) =>NaturalButton()
//                                     ));
//                                                   },
                                                                                                                        
//              // onPressed: () 
//              // {
//            // handleShare();
//          // },
//                                    child: Container(
//                                         child: Column(
//                                     children: [
//                                    Container(
//                                     padding: EdgeInsets.all(8),                                                                                                        decoration: BoxDecoration(
//                                   border: Border.all(color: Color(0xff5A6C64).withOpacity(0.5)),
//                                  borderRadius: BorderRadius.circular(5)),
//                                  child: icon,
//                                ),
//                                    SizedBox(
//                                   height: 9,
//                                ),
//                               Container(
//                               width: 80,
//                                   child: Text(
//                                    label,
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                fontSize: 14,
//                                   fontWeight: FontWeight.w400,
//                                  color: Color(0xff5A6C64)),
//                            ))
//                          ],
//                           ),
//                    ),
//                    ),
//                );
                                                                                                                           
//                     }
//                         }


//      //Class for omo_destiny icon              
//   class Omo_Destiny extends StatelessWidget {
//   final Icon icon;
//   final String label;
//   final double latitude;
//   final double longitude;
//   Omo_Destiny({this.label, this.icon,this.latitude,this.longitude}
  
//   );

//   @override
//   Widget build(BuildContext context) {
   
//     return Opacity(
//       opacity: 0.7,
  
//       child: InkWell(
//         onTap: () 
//         {
//                     Navigator.push(context,
//                     MaterialPageRoute(builder: (context) =>NaturalButton()
//                                     ));
//                                                   },
                                                                                                                        
//              // onPressed: () 
//              // {
//            // handleShare();
//          // },
//                                    child: Container(
//                                         child: Column(
//                                     children: [
//                                    Container(
//                                     padding: EdgeInsets.all(8),                                                                                                        decoration: BoxDecoration(
//                                   border: Border.all(color: Color(0xff5A6C64).withOpacity(0.5)),
//                                  borderRadius: BorderRadius.circular(5)),
//                                  child: icon,
//                                ),
//                                    SizedBox(
//                                   height: 9,
//                                ),
//                               Container(
//                               width: 80,
//                                   child: Text(
//                                    label,
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                fontSize: 14,
//                                   fontWeight: FontWeight.w400,
//                                  color: Color(0xff5A6C64)),
//                            ))
//                          ],
//                           ),
//                    ),
//                    ),
//                );
                                                                                                                           
//                     }
//                         }

//      //Class for birdfly icon              
// class BirdFly extends StatelessWidget {
//   final Icon icon;
//   final String label;
//   final double latitude;
//   final double longitude;
//   BirdFly({this.label, this.icon,this.latitude,this.longitude}
  
//   );

                           
//   @override
//   Widget build(BuildContext context) {
   
//     return Opacity(
//       opacity: 0.7,
  
//       child: InkWell(
//         onTap: () 
//         {
//                     Navigator.push(context,
//                     MaterialPageRoute(builder: (context) =>NaturalButton()
//                                     ));
//                                                   },
                                                                                                                        
//              // onPressed: () 
//              // {
//            // handleShare();
//          // },
//                                    child: Container(
//                                         child: Column(
//                                     children: [
//                                    Container(
//                                     padding: EdgeInsets.only(left:5,),                                                                                                      decoration: BoxDecoration(
//                                   border: Border.all(color: Color(0xff5A6C64).withOpacity(0.5)),
//                                  borderRadius: BorderRadius.circular(5)),
//                                  child: icon,
//                                ),
//                                    SizedBox(
//                                   height: 9,
//                                ),
//                               Container(
//                               width: 80,
//                                   child: Text(
//                                    label,
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                fontSize: 14,
//                                   fontWeight: FontWeight.w400,
//                                  color: Color(0xff5A6C64)),
//                            ))
//                          ],
//                           ),
//                    ),
//                    ),
//                );
                                                                                                                           
//                     }
//                         }


// class Link extends StatelessWidget {
//   final Icon icon;
//   final String label;
//   final double latitude;
//   final double longitude;
//   Link ({this.label, this.icon, this.latitude, this.longitude});

                           
//   @override
//   Widget build(BuildContext context) {
//     return Opacity(
//       opacity: 0.7,
//       child: InkWell(
//         onTap: () {
//                     Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => Home()));
//                   },

//         // onPressed: () {
//         //                     handleShare();
//         //                   },
//           child: Container(
//           child: Column(
//             children: [
//               Container(
//                 padding: EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                     border: Border.all(color: Color(0xff5A6C64).withOpacity(0.5)),
//                     borderRadius: BorderRadius.circular(40)),
//                 child: icon,
//               ),
//               SizedBox(
//                 height: 9,
//               ),
//               Container(
//                   width: 100,
//                   child: Text(
//                     label,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xff5A6C64)),
//                   ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//The following class contains all detail information of Attraction sites
class PopularTours extends StatelessWidget {
  // final String imgUrl;
  // final String title;
  // final String desc;
  // final String price;
  // final double rating;
  final String dfullname;
  final String dshortname;
 // final String destimated;
  final String ddestinatio;
  final String dunescoreg;
  final double dcoordinates;
  final double dcoordinatesy;
  final String destinationnnn;
  final String dzone;
  final String imgdest;
  PopularTours(
      {
      //   @required this.imgUrl,
      // @required this.rating,
      // @required this.desc,
      // @required this.price,
      // @required this.title,
  required this.dfullname,
  required this.dshortname,
  //   @required this.destimated,
  required this.ddestinatio,
  required this.dunescoreg,
  required this.destinationnnn,
  required this.dcoordinates,
  required this.dcoordinatesy,
  required this.dzone,
  required this.imgdest,

      
      });

  @override
  Widget build(BuildContext context) 
  {
    return GestureDetector
(
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
                      child:Container(
        //height: 250,
        margin: EdgeInsets.only(left: 3),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Opacity(
              opacity: 0.9,
                                      child: ClipRRect(
                          borderRadius:BorderRadius.circular(4),
                       
                             child: Stack(
                              children: [
                              CachedNetworkImage(
                              // myData[index]['logo_url'],
                              imageUrl: imgdest,
                              // imageUrl: "https://pix10.agoda.net/hotelImages/5502207/0/9118b486f9ffd30d0a49b1860822fdfc.jpg",
                              height: 240,
                              width: 340,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              bottom: 60,
                              left: 30,
                              //right: 10,
                              child:
                                Text(
                                  dfullname.length > 15 ? dfullname.substring(0, 15) + '...' : dfullname,
                                  style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                  backgroundColor: Colors.black.withOpacity(0.6)
                                  ),
                                ),
                                ),
            
                              Positioned(
                              bottom: 40,
                              left: 30,
                              //right: 10,
                              child:
                               Text(
                                  //dunescoreg + "sdafl",
                              "" + destinationnnn,
                              style: TextStyle(
                             fontSize: 18,
                            fontWeight: FontWeight.w600,
                              color: Colors.white,
                              backgroundColor: Colors.black.withOpacity(0.6),
                              ),
                                ) 
                                ),
            
                                Positioned(
                              bottom: 22,
                              left: 30,
                              right: 10,
                              child:
                               Text(
                                  //dunescoreg + "sdafl",
                              "" + dzone,
                              style: TextStyle(
                             fontSize: 15,
                            fontWeight: FontWeight.w400,
                              color: Colors.white,
                              backgroundColor: Colors.black.withOpacity(0.6)
                              ),
                                ) 
                                )
            
                          ], 
                   )               ),
                        ),
                                  Container(
                         // padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             // maqaa isa duree
                              // Text(
                              //   dfullname.length > 15 ? dfullname.substring(0, 15) + '...' : dfullname,
                              //   style: TextStyle(
                              //       fontSize: 16,
                              //       fontWeight: FontWeight.w600,
                              //       color: Colors.black),
                              // ),
                              SizedBox(
                                height: 3,
                              ),
                        //       //maqaa zoonii attaraction site kan qabatee jiru
                              // Text(
                              //   //"description", // desc
                              //   "Zone:" + dzone,
                              //   style: TextStyle(
                              //       fontSize: 13,
                              //       fontWeight: FontWeight.w600,
                              //       color: Colors.white),
                              // ),
                              SizedBox(
                                height: 6,
                              ),
                              //part type attraction site qabatee kan jiru 
                              // Text(
                              //   //dunescoreg + "sdafl",
                              //   "" + destinationnnn,
                              //   style: TextStyle(
                              //       fontSize: 14,
                              //       fontWeight: FontWeight.w600,
                              //       color: Colors.black),
                              // )
                            ],
                          ),
                        ),
                      
                      ],
                    ),
                  ),
                );
              }
   widget({required ClipRRect child}) {}

}   

//These gamoDestination is created for ManMade Horizontal Scrollable which contains forward arrow at the top of itself
class GamoDestination extends StatelessWidget {
  // final String imgUrl;
  // final String title;
  // final String desc;
  // final String price;
  // final double rating;
  final String dfullname;
  final String dshortname;
 // final String destimated;
  final String ddestinatio;
  final String dunescoreg;
  final double dcoordinates;
  final double dcoordinatesy;
  final String destinationnnn;
  final String dzone;
  final String imgdest;
  GamoDestination(
      {
      //   @required this.imgUrl,
      // @required this.rating,
      // @required this.desc,
      // @required this.price,
      // @required this.title,
  required this.dfullname,
  required this.dshortname,
  //   @required this.destimated,
  required this.ddestinatio,
  required this.dunescoreg,
  required this.destinationnnn,
  required this.dcoordinates,
  required this.dcoordinatesy,
  required this.dzone,
  required this.imgdest,

      
      });
  @override
  Widget build(BuildContext context) 
  {
  if(dzone == "Gamo")
{
    return GestureDetector
(
    

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
      

     child:Container(
        //height: 250,
        margin: EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
               borderRadius:BorderRadius.circular(20),
               child: CachedNetworkImage(
                imageUrl: imgdest,
                width: 150,
                height: 200,
                fit: BoxFit.cover,
              ),
               ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dfullname.length > 15 ? dfullname.substring(0, 15) + '...' : dfullname,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    //"description", // desc
                    "Zone:" + dzone,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  // Text(
                  //   //dunescoreg + "sdafl",
                  //   "" + destinationnnn,
                  //   style: TextStyle(
                  //       fontSize: 14,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black),
                  // )
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
  return Container(width: 0.0, height: 0.0);
}
  }  
}

//These Class is created for OmoDestination Horizontal Scrollable which contains forward arrow at the top of itself
class OmoDestination extends StatelessWidget {
  // final String imgUrl;
  // final String title;
  // final String desc;
  // final String price;
  // final double rating;
  final String dfullname;
  final String dshortname;
 // final String destimated;
  final String ddestinatio;
  final String dunescoreg;
  final double dcoordinates;
  final double dcoordinatesy;
  final String destinationnnn;
  final String dzone;
  final String imgdest;
  OmoDestination(
      {
      //   @required this.imgUrl,
      // @required this.rating,
      // @required this.desc,
      // @required this.price,
      // @required this.title,
  required this.dfullname,
  required this.dshortname,
  //   @required this.destimated,
  required this.ddestinatio,
  required this.dunescoreg,
  required this.destinationnnn,
  required this.dcoordinates,
  required this.dcoordinatesy,
  required this.dzone,
  required this.imgdest,

      
      });

  @override
  Widget build(BuildContext context) 
  {
  if(dzone == "South Omo")
{
    return GestureDetector
(
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
      

     child:Container(
        //height: 250,
        margin: EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
               borderRadius:BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: imgdest,
                width: 150,
                height: 200,
                fit: BoxFit.cover,
              ),
               ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 // maqaa isa duree
                  Text(
                    dfullname.length > 15 ? dfullname.substring(0, 15) + '...' : dfullname,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    //"description", // desc
                    "Zone:" + dzone,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  //part type attraction site qabatee kan jiru 
                  // Text(
                  //   //dunescoreg + "sdafl",
                  //   "" + destinationnnn,
                  //   style: TextStyle(
                  //       fontSize: 14,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black),
                  // )
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
  return Container(height: 0.0, width: 0.0,);
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
  
  // final String y;
  // final String z;
  // final String label;
  // final String countryName;
  // final int noOfTours;
  // final double rating;
  // final String imgUrl;
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

      // @required this.y,
      // @required this.z,

      // @required this.countryName,
      // @required this.label,
      // @required this.noOfTours,
      // @required this.rating,
      // @required this.imgUrl
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
               margin: EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
            color: Colors.blueGrey[100], borderRadius: BorderRadius.circular(0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
               borderRadius:BorderRadius.circular(10),
               
        //akka photon attraction site visible tahu kan godhudha.
              child: CachedNetworkImage(
                imageUrl: img,
                width: 170,
                height: 195,
                fit: BoxFit.cover,
              ),
               ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
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
                  //part type attraction site qabatee kan jiru 
                  // Text(
                  //   //dunescoreg + "sdafl",
                  //   "Type: " + destinationnnn,
                  //   style: TextStyle(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.white),
                  // )
                ],
              ),
            ),
                // child: Column(
                //   children: [
                //     Text(
                //       "j",
                //       style: TextStyle(
                //           color: Colors.white,
                //           fontWeight: FontWeight.w600,
                //           fontSize: 12),
                //     ),
                //     SizedBox(
                //       height: 2,
                //     ),
                //     Icon(
                //       Icons.star,
                //       color: Colors.white,
                //       size: 20,
                //     )
                //   ],
                // )
          
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
 
// Display Alert message when internet if there is no internet connection
void checkNetworkConnectivity(BuildContext context) async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  if (connectivityResult == ConnectivityResult.none) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('No Internet Connection'),
          content: Text('Please connect to the internet.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
