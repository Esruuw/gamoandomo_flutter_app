// import 'dart:convert';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:discounttour/data/data.dart';
// import 'package:discounttour/model/country_model.dart';
// import 'package:discounttour/model/destination_model.dart';
// import 'package:discounttour/model/service_model.dart';
// import 'package:discounttour/model/popular_tours_model.dart';
// import 'package:discounttour/views/details.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   List<PopularTourModel> popularTourModels = new List();
//   List<CountryModel> country = new List();
//   List<Service> services = [];

//   Future getData() async {
//     http.Response response = await http.get("https://raw.githubusercontent.com/davekassaw/davekassaw-services.json/main/newservice.json");
//     if (response.statusCode == 200) {
//       String data = response.body;
//       print("Yes we got the response");
//       // print(data);
//       var decodedData = jsonDecode(data);
//       print("The below is decoded Data");
//       // Rprint(decodedData);
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
//             decodedData['features'][i]['geometry']['coordinates'][0],
//             decodedData['features'][i]['geometry']['coordinates'][1],
            
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




//   List<Destination> destination = [];

//   Future getdestinationData() async {
//     http.Response response = await http.get("https://raw.githubusercontent.com/davekassaw/destination2.json/main/destination2.json");
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

//   @override
//   void initState() {
//     getData();
//     country = getCountrys();
//     popularTourModels = getPopularTours();
//     super.initState();
//   }

//   listOfServices(index) { 
//     return services.isEmpty ? Container(child: Center(child: Text("Balmeta yeshalal"),),) : CountryListTile(
//             fullName: services[index].fullname,
//             shortName: services[index].shortname,
//             label: country[index].label,
//             countryName: country[index].countryName,
//             noOfTours: country[index].noOfTours,
//             rating: country[index].rating,
//             imgUrl: country[index].imgUrl,
          
            
//           );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Container(
//           padding: EdgeInsets.all(7),
//           child: Image.asset(
//             "assets/menu.png",
//             height: 20,
//             width: 20,
//           ),
//         ),
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               "assets/logo.png",
//               height: 30,
//             ),
//             Text(
//               "GIS Tourist map",
//               style:
//                   TextStyle(color: Colors.black54, fontWeight: FontWeight.w600),
//             )
//           ],
//         ),
//         actions: [
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 16),
//             child: Icon(
//               Icons.more_vert,
//               color: Colors.white,
//             ),
//           )
//         ],
//         elevation: 0.0,
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Hotel and Restaurants",
//                 style: TextStyle(
//                     fontSize: 28,
//                     color: Colors.black54,
//                     fontWeight: FontWeight.w600),
//               ),
//               SizedBox(
//                 height: 8,
//               ),
//               Text(
//                 "Country",
//                 style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.black54,
//                     fontWeight: FontWeight.w600),
//               ),
//               SizedBox(
//                 height: 16,
//               ),
//               // Container(
//               //   height: 240,
//               //   child: ListView.builder(
//               //       itemCount: services.length,
//               //       shrinkWrap: true,
//               //       physics: ClampingScrollPhysics(),
//               //       scrollDirection: Axis.horizontal,
//               //       itemBuilder: (context, index) {
//               //         return listOfServices(index);
//               //       }),
//               // ),
//               SizedBox(
//                 height: 8,
//               ),
//               Text(
//                 "Popular Tours",
//                 style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.black54,
//                     fontWeight: FontWeight.w600),
//               ),
//               SizedBox(
//                 height: 16,
//               ),
//               ListView.builder(
//                   shrinkWrap: true,
//                   physics: ClampingScrollPhysics(),
//                   itemCount: popularTourModels.length,
//                   itemBuilder: (context, index) {
//                     return PopularTours(
//                       desc: popularTourModels[index].desc,
//                       imgUrl: popularTourModels[index].imgUrl,
//                       title: popularTourModels[index].title,
//                       price: popularTourModels[index].price,
//                       rating: popularTourModels[index].rating,
//                     );
//                   })
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class PopularTours extends StatelessWidget {
//   final String imgUrl;
//   final String title;
//   final String desc;
//   final String price;
//   final double rating;
//   PopularTours(
//       {@required this.imgUrl,
//       @required this.rating,
//       @required this.desc,
//       @required this.price,
//       @required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => Details(
//                       imgUrl: imgUrl,
//                       placeName: title,
//                       rating: rating,
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
//                 imageUrl: imgUrl,
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
//                     title,
//                     style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xff4E6059)),
//                   ),
//                   SizedBox(
//                     height: 3,
//                   ),
//                   Text(
//                     "description", // desc
//                     style: TextStyle(
//                         fontSize: 13,
//                         fontWeight: FontWeight.w400,
//                         color: Color(0xff89A097)),
//                   ),
//                   SizedBox(
//                     height: 6,
//                   ),
//                   Text(
//                     price,
//                     style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xff4E6059)),
//                   )
//                 ],
//               ),
//             ),
//             Container(
//                 margin: EdgeInsets.only(bottom: 10, right: 8),
//                 padding: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(6),
//                     color: Color(0xff139157)),
//                 child: Column(
//                   children: [
//                     Text(
//                       "$rating",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w600,
//                           fontSize: 12),
//                     ),
//                     SizedBox(
//                       height: 2,
//                     ),
//                     Icon(
//                       Icons.star,
//                       color: Colors.white,
//                       size: 20,
//                     )
//                   ],
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CountryListTile extends StatelessWidget {
//   final String fullName;
//   final String shortName;
//   final String label;
//   final String countryName;
//   final int noOfTours;
//   final double rating;
//   final String imgUrl;
//   CountryListTile({
//       @required this.fullName,
//       @required this.shortName,
//       @required this.countryName,
//       @required this.label,
//       @required this.noOfTours,
//       @required this.rating,
//       @required this.imgUrl
//       });

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
//                           fullName ?? "New",
//                           style: TextStyle(color: Colors.white),
//                         ))
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
//                               fullName,
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 16),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 3,
//                           ),
//                           Text(
//                             "18 Tours",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 13),
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
//                               "4.5",
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
// }
