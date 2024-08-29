// import 'dart:convert';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:discounttour/data/data.dart';
// import 'package:discounttour/model/country_model.dart';
// import 'package:discounttour/model/destination_model.dart';
// // import 'package:discounttour/model/openweather.dart';
// import 'package:discounttour/model/service_model.dart';
// import 'package:discounttour/model/imagedb.dart';
// import 'package:discounttour/model/popular_tours_model.dart';
// import 'package:discounttour/views/details.dart';
// import 'package:discounttour/utils/colors.dart';
// import 'package:discounttour/views/menu.dart';
// import 'package:discounttour/views/detailsservice.dart';
// import 'package:discounttour/views/loading_widget.dart';
// // import 'package:discounttour/views/menu.dart';
// import 'package:discounttour/utils/next_screen.dart';
// // import 'package:discounttour/widgets/language.dart';
// // import 'package:url_launcher/url_launcher.dart';
// // import 'package:visit_ethiopia/pages/search.dart';
// import 'package:flutter_search_bar/flutter_search_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// // import 'package:autocomplete_textfield/autocomplete_textfield.dart';
// // import 'package:discounttour/utils/next_screen.dart';
// // class SearchBarDemoApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return new MaterialApp(
// //         title: 'Search Bar Demo',
// //         theme: new ThemeData(primarySwatch: Colors.blue),
// //         home: new Home());
// //   }
// // }


// class SearchBarDemoApp extends StatelessWidget {
//   @override
  
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       // double totalSearchBarSize;
//         title: 'Search Bar Demo',
//         theme: new ThemeData(primarySwatch: Colors.blue),
//         home: new SearchBarDemoApp()
        
//         );
//   }
  
// }

// class Home extends StatefulWidget {
  
//   @override

//   _HomeState createState() => _HomeState();
//    _HomeState createStatte() => new _HomeState();
   

// }

// class _HomeState extends State<Home> {

  
// SearchBar searchBar;
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

//   AppBar buildAppBar(BuildContext context) {
//     return new AppBar(
//         title: new Text('Search Bar Demo'),
//         actions: [searchBar.getSearchAction(context)]);
//   }

//   void onSubmitted(String value) {
//     setState(() => _scaffoldKey.currentState
    
//         .showSnackBar(new SnackBar(content: new Text('You wrote $value!'))));
//   }




  
//   List<PopularTourModel> popularTourModels = new List();
//   List<CountryModel> country = new List();
//   List<Service> services = [];
//   List<Destination> destination = [];
//   // List<Imagedb> myimage = [];
//   bool loading = true;

//   Future getData() async {
//     http.Response response = await http.get("https://raw.githubusercontent.com/davekassaw/davekassaw-services.json/main/newservice.json");
//      if (response.statusCode == 200) {
//       String data = response.body;
//       print("Got the response from destination");
//       print(data);
//       var decodedData = jsonDecode(data);
//       print("The below is decoded Destination Data");
//       print(decodedData);
//       if (decodedData['features'].isEmpty) {
//         print("Empty");
//       } else {
//         for (var i = 0; i < decodedData['features'].length; i++) {
//           // var x= decodedData['features'][i]['geometry']['coordinates']['0,1'];
          
//           Service serv = Service(
//             decodedData['features'][i]['properties']['full_name'],
//             decodedData['features'][i]['properties']['short_name'],
//             decodedData['features'][i]['properties']['zone'],
//             decodedData['features'][i]['properties']['wereda'],
//             decodedData['features'][i]['properties']['kebele'],
//             decodedData['features'][i]['properties']['locality_n'],
//             decodedData['features'][i]['properties']['phone_line'],
//             decodedData['features'][i]['properties']['email'],
//             decodedData['features'][i]['properties']['website'],
//             decodedData['features'][i]['properties']['Service'],
//             decodedData['features'][i]['properties']['service_ty'],
//             decodedData['features'][i]['properties']['code'],
//             decodedData['features'][i]['properties']['img'],
            
//             // decodedData['features'][i]['geometry']['coordinates'],

//           );
//           services.add(serv);
        
//         //print(destination[i].destinatio);
//         }
//         print("not empty");
//       }
//     } else {
//       print("OOPs we didnt");
//     }
//   }





//   // List<Destination> destination = [];

//   Future getdestinationData() async {
//     http.Response response = await http.get("https://raw.githubusercontent.com/davekassaw/davekassaw.github.io/main/destination_old.json");
//     if (response.statusCode == 200) {
//       String data = response.body;
//       print("Got the response from destination");
//       print(data);
//       var decodedDatatwo = jsonDecode(data);
//       print("The below is decoded Destination Data");
//       print(decodedDatatwo);
//       if (decodedDatatwo['features'].isEmpty) {
//         print("Empty");
//       } else {
//         for (var i = 0; i < decodedDatatwo['features'].length; i++) {
//     // for (var i = 0; i < decodedData['features'].length; i++) {
        
//           Destination destiny = Destination(
//             decodedDatatwo['features'][i]['properties']['full_name'],
//             decodedDatatwo['features'][i]['properties']['short_name'],
//             decodedDatatwo['features'][i]['properties']['zone'],
//             decodedDatatwo['features'][i]['properties']['wereda'],
//             decodedDatatwo['features'][i]['properties']['kebele'],
//             decodedDatatwo['features'][i]['properties']['organizati'],
//             decodedDatatwo['features'][i]['properties']['status'],
//             decodedDatatwo['features'][i]['properties']['area_sqkm'],
//             //decodedDatatwo['features'][i]['properties']['Estimated'],
//             decodedDatatwo['features'][i]['properties']['unesco_reg'],
//             decodedDatatwo['features'][i]['properties']['descriptio'],
//             decodedDatatwo['features'][i]['properties']['destinatio'],
//             decodedDatatwo['features'][i]['geometry']['coordinates'][0],
//             decodedDatatwo['features'][i]['geometry']['coordinates'][1],
//             decodedDatatwo['features'][i]['properties']['img'],
            
          
        
//           );
//         destination.add(destiny);
//         print("trying fullname and coordinate print");
//         print("d fullname print" + destination[i].dfullname);
//         print(destination[i].dcoordinates);
//         print(destination[i].dcoordinatesy);

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






// // Future getimagedata() async {
// //     http.Response response = await http.get("https://raw.githubusercontent.com/ermyas04/newimage/main/image.json");
// //     if (response.statusCode == 200) {
// //       String data = response.body;
// //       print("Got the response from destination");
// //       print(data);
// //       var imageData = jsonDecode(data);
// //       print("The below is decoded Destination Data");
// //       print(imageData);
// //       if (imageData['https://raw.githubusercontent.com/ermyas04/newimage/main/image.json'].isEmpty) {
// //         print("Empty");
// //       } else {
// //         for (var i = 0; i < imageData['imagejson'].length; i++) {
// //           //  Destination destiny = Destination(
// //           Imagedb img = Imagedb(
// //             imageData['imagejson']['image'],
            

// //           );
// //         myimage.add(img);
// //         print("trying fullname and coordinate print");
// //         print("d fullname print" + destination[i].dfullname);
// //         print(destination[i].dcoordinates);
// //         print(destination[i].dcoordinatesy);

// //         //print(services[i].fullname);
// //         //print(destination[i].destinatio);
// //         //print(destination[i].destimated);
// //         }
// //         print("not empty");
// //       }
// //     } else {
// //       print("OOPs we didnt");
// //     }
// //   }
// // // _users.addAll(value);
// // // _usersDisplay = _users;
//   @override
//   void initState() {
//     super.initState();
//     // destination().then((value) {
//       // setState(() {
//       //   loading = false;
//       //   destination.addAll(destination);
//         destination = destination;
//         print(destination.length);
//       // });
//     // }
//     // );
//     getData();
//     getdestinationData();
//     country = getCountrys();
//     popularTourModels = getPopularTours();
//     loading = true;
//     // _users.addAll(value);
//     // destination = _users;
//     // users.addAll(value);
//     print("Init state");
//     print(loading);
//     hotReload();
    
    
//   }
  

//   Future hotReload() async {
//     Future.delayed(Duration(seconds: 6)).then((value) {
//       setState(() {
//         print("Delayed print value");
//         loading = false;
//         print("hot reload");
//         print(loading);
//       });
//     });
//   }

//   listOfServices(index) { 
//     return CountryListTile(
//             fullname: services[index].fullname,
//             shortname: services[index].shortname,
//             // img: myimage[index].img,
//             // myData[index]['logo_url'],
//             zone: services[index].zone,
//             code: services[index].code,
            
            
//             // label: country[index].label,
//             // countryName: country[index].countryName,
//             // noOfTours: country[index].noOfTours,
//             // rating: country[index].rating,
//             // imgUrl: country[index].imgUrl,
          
            
//           );
//   }





  
//   @override
//   Widget build(BuildContext context) {
//     var inkWell = InkWell(
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 16),
//             child: Icon(
//               Icons.more_vert,
//               color: tr2,
//             ),
//           ),
//           // onTap: () {
//           //           nextScreen(context, MenuPage());
//           //         },
          
//                onTap: () {
//                     Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => MenuPage()));
//                   },
          
//           // onTap: () => Home(),
//           );
//         // Container(
//         //   child: ListView.builder(
//         //     itemBuilder: (context, index) {
//         //       if (!loading) {
//         //         return index == 0 ? TextField() : (this.destination[index - 1]);
//         //       } else {
//         //         return LoadingView();
//         //       }
//         //     },
//         //     //  itemCount: services?.length,
//         //      itemCount: destination.length,
//         //     // itemCount: destination.length,
//         //     //?? true
//         //   //  itemCount: destination?.length ?? 0
//         //     //  itemCount: destination?.length ??  0
           
//         //   ),
//         // );
//     return Scaffold(
//       appBar: AppBar(
//         leading: Container(
//           color: Colors.blue[50],
//           // padding: EdgeInsets.all(1),
//           child: Image.asset(
//              "assets/images/splash.png",
//             height: 40,
//             width: 40,    
//           ),
          
//         ),
        
//         title: Row(
          
//           mainAxisAlignment: MainAxisAlignment.center,
          

//           children: [
//             // Image.asset(
//             //   "assets/images/splash.png",
//             //   height: 60,
//             // ),
            
//             Text(
//               "Tourist-Map",
//               style:
//                   TextStyle(color: tr2, fontWeight: FontWeight.w600),
                  
//             )
            
//           ],

//         ),

        
//         actions: [
//           inkWell,
//         ],
      
//         elevation: 0.0,
        
//       ),




                  
                  
                 
      
//       body: SingleChildScrollView(
        
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               InkWell(
//                   child: Container(
//                     // alignment: Alignment.center,
//                     // margin: EdgeInsets.only(left: 15, right: 5),
//                     // padding: EdgeInsets.only(left: 15, right: 15),
//                     // height: 40,
//                     // // widthFactor: 0.8,
//                     // // width: 280,
//                     // width: 150,
//                     // decoration: BoxDecoration(
//                     //   color: Colors.grey[100],
//                     //   border: Border.all(color: Colors.grey[300], width: 0.5),
//                     //   borderRadius: BorderRadius.circular(8),
//                     // ),
                    
//       child: TextField(
//         autofocus: false,
//         onChanged: (searchText) {
//           searchText = searchText.toLowerCase();
//           setState(() {
//             destination = destination.where((u) {
//               var fName = u.dfullname.toLowerCase();
//               var lName = u.dfullname.toLowerCase();
//               var job = u.dfullname.toLowerCase();
//               return fName.contains(searchText) || lName.contains(searchText) || job.contains(searchText);
//             }).toList();
//           });
//         },
//         // controller: _textController,
//         decoration: InputDecoration(
//           border: OutlineInputBorder(),
//           prefixIcon: Icon(Icons.search),
//           hintText: 'Search Places',
//         ),
//       ),
      

//                   ),
//                   onTap: () {
//                     Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => MenuPage()));
//                   },
//                 ),
               










//               SizedBox(
//                 height: 8,
//               ),
//               Text(
//                 "Hotel and Restaurants",
//                 style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.black54,
//                     fontWeight: FontWeight.w300),
                    
//               ),
//               // Spacer(),
              
//               SizedBox(
//                 height: 16,
//               ),


//               SizedBox(
//                 height: 8,
//               ),


             
//               //  InkWell(
//               //   onTap:() => destination ,
//               //  ),
//               // Spacer(),
              
//               SizedBox(
//                 height: 16,
//               ),
//               SizedBox(
//                 height: 8,
//               ),



              
//               loading == true ? Center(child: CircularProgressIndicator()) :
//               Container(
//                 height: 240,
//                 child: ListView.builder(
//                     itemCount: destination.length,
//                     shrinkWrap: true,
//                     physics: ClampingScrollPhysics(),
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (BuildContext context, int index) {
//                       return listOfServices(index);
//                     }),
//               ),
//               SizedBox(
//                 height: 8,
//               ),
//               Text(
//                 "Popular Attractions",
//                 style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.black54,
//                     fontWeight: FontWeight.w600),
//               ),
//               // Text(
//               //   "Clinick",
//               //   style: TextStyle(
//               //       fontSize: 28,
//               //       color: Colors.black54,
//               //       fontWeight: FontWeight.w600),
//               // ),
//               SizedBox(
//                 height: 16,
//               ),

//               loading == true ? Center(child: CircularProgressIndicator()) :
//             //  Container(
//             //     height: 240,
//             //     // child: ListView.builder(
//             //     //     itemCount: destination.length,
//             //     //     shrinkWrap: true,
//             //     //     physics: ClampingScrollPhysics(),
//             //     //     scrollDirection: Axis.horizontal,
//             //     //     itemBuilder: (BuildContext context, int index) {
//             //     //       return listOfServices(index);
//             //     //     }),
//             //   ),
//               ListView.builder(
                
//                   shrinkWrap: true,
//                   physics: ClampingScrollPhysics(),
              
//                   itemCount: destination.length,
                  
//                   // scrollDirection: Axis.horizontal,
//                   itemBuilder: (BuildContext context, int index) {
//                     var popularTours2 = PopularTours(
//                       // desc: popularTourModels[index].desc,
//                       // imgUrl: popularTourModels[index].imgUrl,
//                       // title: popularTourModels[index].title,
//                       // pric  e: popularTourModels[index].price,
//                       // rating: popularTourModels[index].rating,
//                       dfullname: destination[index].dfullname,
//                       ddestinatio: destination[index].ddestinatio,
//                       dunescoreg: destination[index].dunescoreg,
//                       dshortname: destination[index].dshortname,
//                       //destimated: destination[index].destimated,
//                       destinationnnn: destination[index].destinationnnn,
//                       dcoordinates: destination[index].dcoordinates,
//                       dcoordinatesy: destination[index].dcoordinatesy,
//                       dzone: destination[index].dzone,
//                       img:destination[index].img,
                      
                      
//                     );
//                     var popularTours = popularTours2;
//                     return popularTours;
                    
//                   })
                  

                  
             
//             ],
            
//           ),
          
//         ),
        
//       ),  
//     );
    
//   }
// }



// class PopularTours extends StatelessWidget {
//   // final String imgUrl;
//   // final String title;
//   // final String desc;
//   // final String price;
//   // final double rating;
//   final String dfullname;
//   final String dshortname;
//  // final String destimated;
//   final String ddestinatio;
//   final String dunescoreg;
//   final double dcoordinates;
//   final double dcoordinatesy;
//   final String destinationnnn;
//   final String dzone;
//   final String img;
//   PopularTours(
//       {
//       //   @required this.imgUrl,
//       // @required this.rating,
//       // @required this.desc,
//       // @required this.price,
//       // @required this.title,
//   @required this.dfullname,
//   @required this.dshortname,
//   //   @required this.destimated,
//   @required this.ddestinatio,
//   @required this.dunescoreg,
//   @required this.destinationnnn,
//   @required this.dcoordinates,
//   @required this.dcoordinatesy,
//   @required this.dzone,
//   @required this.img,

      
//       });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => Details(
//                       imgUrl: "http://sunnylandethiopiatours.com/mythemes/uploads/2016/02/lake-chamo.jpg",
//                       placeName: dfullname.length > 15 ? dfullname.substring(0, 15) + '...' : dfullname,
//                       rating: 4.5,
//                       dcoordinates: dcoordinates,
//                       dcoordinatesy: dcoordinatesy,
//                       ddestinatio: ddestinatio,
//                       dfullname: dfullname,
//                       img: img,
                      
                    
                      
//                     )));
//       },
//       child: Container(
//         margin: EdgeInsets.only(bottom: 8),
//         decoration: BoxDecoration(
//             color: Color(0xffE9F4F9), borderRadius: BorderRadius.circular(20)),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20),
//                   bottomLeft: Radius.circular(20)),
//               child: CachedNetworkImage(
                
//                 imageUrl: img,
//                 width: 110,
//                 height: 90,
             
//                 fit: BoxFit.cover,
//               ),
              
                
               
               
              
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     dfullname.length > 15 ? dfullname.substring(0, 15) + '...' : dfullname,
//                     style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xff4E6059)),
//                   ),
//                   SizedBox(
//                     height: 3,
//                   ),
//                   Text(
//                     //"description", // desc
//                     "Zone:" + dzone,
//                     style: TextStyle(
//                         fontSize: 13,
//                         fontWeight: FontWeight.w400,
//                         color: Color(0xff89A097)),
//                   ),
//                   SizedBox(
//                     height: 6,
//                   ),
//                   Text(
//                     //dunescoreg + "sdafl",
//                     "Type: " + destinationnnn,
//                     style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xff4E6059)),
//                   )
//                 ],
//               ),
//             ),
//           // Container(
//           //       margin: EdgeInsets.only(bottom: 10, right: 8),
//           //       padding: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
//           //       decoration: BoxDecoration(
//           //           borderRadius: BorderRadius.circular(6),
//           //           color: Color(0xff139157)),
//           //       // child: Column(
//           //       //   children: [
//           //       //     Text(
//           //       //       "j",
//           //       //       style: TextStyle(
//           //       //           color: Colors.white,
//           //       //           fontWeight: FontWeight.w600,
//           //       //           fontSize: 12),
//           //       //     ),
//           //       //     SizedBox(
//           //       //       height: 2,
//           //       //     ),
//           //       //     Icon(
//           //       //       Icons.star,
//           //       //       color: Colors.white,
//           //       //       size: 20,
//           //       //     )
//           //       //   ],
//           //       // )
//           //       )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CountryListTile extends StatelessWidget {
//   final String fullname;
//   final String shortname;
//   // final String img;
//   final String zone;
//   final int code;
//   // final double dcoordinates;
//   // final String y;
//   // final String z;
//   // final String label;
//   // final String countryName;
//   // final int noOfTours;
//   // final double rating;
//   // final String imgUrl;
//   CountryListTile({
//       @required this.fullname,
//       @required this.shortname,
//       // @required this.img,
//       @required this.zone,
//       @required this.code,
//       // @required this.dcoordinates,
//       // @required this.y,
//       // @required this.z,

//       // @required this.countryName,
//       // @required this.label,
//       // @required this.noOfTours,
//       // @required this.rating,
//       // @required this.imgUrl
//       });



// @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
      
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => Detailsservice(
//                       imgUrl: "http://sunnylandethiopiatours.com/mythemes/uploads/2016/02/lake-chamo.jpg",
//                       placeName: fullname.length > 15 ? fullname.substring(0, 15) + '...' : fullname,
//                       rating: 4.5,
//                      fullname: fullname,
//                      zone: zone,
//                      code: code,

                      
//                     )));
//       },
//       child: Container(
//         margin: EdgeInsets.only(right: 8),
//         // margin: EdgeInsets.only(bottom: 8),
//         decoration: BoxDecoration(
//             color: Color(0xffE9F4F9), borderRadius: BorderRadius.circular(20)),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(16),
//               child: CachedNetworkImage(
//                 // myData[index]['logo_url'],
//                 // imageUrl: img,
//                 imageUrl: "https://pix10.agoda.net/hotelImages/5502207/0/9118b486f9ffd30d0a49b1860822fdfc.jpg",
//                 height: 220,
//                 width: 150,
//                 fit: BoxFit.cover,
//               ),

              
//             ),
//             Container(
//               height: 200,
//               width: 150,
//               child: Column(
//                 children: [
//                   Text(
//                     fullname.length > 15 ? fullname.substring(0, 15) + '...' : fullname,
//                     style: TextStyle(
//                         fontSize: 16,


//                         fontWeight: FontWeight.w600,
//                         color: Color(0xff4E6059)),
//                   ),
//                   SizedBox(
//                     height: 3,
//                   ),
//                   Text(
//                     //"description", // desc
//                     "Zone:" + zone,
//                     style: TextStyle(
//                         fontSize: 13,
//                         fontWeight: FontWeight.w400,
//                         color: Color(0xff89A097)),
//                   ),
//                   SizedBox(
//                     height: 6,
//                   ),
//                   // Text(
//                   //   //dunescoreg + "sdafl",
//                   //   "Type: " + destinationnnn,
//                   //   style: TextStyle(
//                   //       fontSize: 16,
//                   //       fontWeight: FontWeight.w600,
//                   //       color: Color(0xff4E6059)),
//                   // )
//                 ],
//               ),
//             ),
//             // Container(
//             //     margin: EdgeInsets.only(bottom: 10, right: 8),
//             //     padding: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
//             //     decoration: BoxDecoration(
//             //         borderRadius: BorderRadius.circular(6),
//             //         color: Color(0xff139157)),
//             //     child: Column(
//             //       children: [
//             //         Text(
//             //           "jk",
//             //           style: TextStyle(
//             //               color: Colors.white,
//             //               fontWeight: FontWeight.w600,
//             //               fontSize: 12),
//             //         ),
//             //         SizedBox(
//             //           height: 2,
//             //         ),
//             //         Icon(
//             //           Icons.star,
//             //           color: Colors.white,
//             //           size: 20,
//             //         )
//             //       ],
//             //     ))
//           ],
//         ),
//       ),
//     );
//   }

// }


























//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(right: 8),
//       child: Stack(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(16),
//             child: CachedNetworkImage(
//               imageUrl: "https://pix10.agoda.net/hotelImages/5502207/0/9118b486f9ffd30d0a49b1860822fdfc.jpg",
//               height: 220,
//               width: 150,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Container(
//             height: 200,
//             width: 150,
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                         margin: EdgeInsets.only(left: 8, top: 8),
//                         padding:
//                             EdgeInsets.symmetric(vertical: 6, horizontal: 8),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(8),
//                             color: Colors.white38),
//                         child: Text(
//                            "New",
//                           style: TextStyle(color: Colors.white),
//                          ) ),
//                   ],
//                 ),
//                 Spacer(),
//                 Row(
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(bottom: 10, left: 8, right: 8),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             child: Text(
//                               "Thailand",
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 16),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 3,
//                           ),
//                           Text(
//                             "Keble:Lante Achole",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 12),
//                           )
//                         ],
//                       ),
//                     ),
//                     Spacer(),
//                     Container(
//                         margin: EdgeInsets.only(bottom: 10, right: 8),
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 3, vertical: 7),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(3),
//                             color: Colors.white38),
//                         child: Column(
//                           children: [
//                             Text(
//                               "46",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 13),
//                             ),
//                             SizedBox(
//                               height: 2,
//                             ),
//                             Icon(
//                               Icons.star,
//                               color: Colors.white,
//                               size: 20,
//                             )
//                           ],
//                         ))
//                   ],
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

