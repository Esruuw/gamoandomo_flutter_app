import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class PlaceDetails extends StatefulWidget {
  final String tag;
  const PlaceDetails({required Key key,  required this.tag})
      : super(key: key);
  @override
  _PlaceDetailsState createState() => _PlaceDetailsState();
}
class _PlaceDetailsState extends State<PlaceDetails> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 0)).then((value) async {
     
    });
  }

  String collectionName = 'places';

  

  

  
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Hero(
                  tag: widget.tag,
                  child: Container(
                    color: Colors.white,
                    child: Container(
                      height: 320,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                     
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 15,
                  child: SafeArea(
                    child: CircleAvatar(
                      backgroundColor: Colors.lightBlue.withOpacity(0.9),
                      
                    ),
                  ),
                ),
                // Share Button

                
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        size: 20,
                        color: Colors.grey,
                      ),
                    
                         
                      // FlatButton(
                      //   child: Text("Take me there", style: TextStyle(color: Colors.white),),
                      //   color: Colors.orangeAccent,
                      //   onPressed: () {
                      //   nextScreen(context, PlaceRoute(placeData: widget.data,));
                      // },),
                      // FlatButton(
                      //   child: Icon(
                      //     Icons.view_in_ar,
                      //     size: 22,
                      //     color: Colors.orangeAccent,
                      //   ),
                      //   onPressed: () {
                      //     nextScreen(context, ArView());
                      //   },
                      // ),
                      
                      
                    ],
                  ),
                  
                  Container(
                    margin: EdgeInsets.only(top: 8, bottom: 8),
                    height: 3,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(40)),
                  ),
                  
                  const SizedBox(
                    height: 30,
                  ),
                  // Html(
                  //   data: '''${widget.data.description}''',
                  //   defaultTextStyle: TextStyle(
                  //       fontSize: 17,
                  //       fontWeight: FontWeight.w400,
                  //       color: Colors.grey[800]),
                  // ),
                  
                  

                  // PopularMotels(
                  //  state: widget.data.state,
                  //  name: widget.data.timestamp,
                  // ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
