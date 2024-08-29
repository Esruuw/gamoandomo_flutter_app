// import 'dart:async';
// import 'dart:math';
// import 'package:flutter/material.dart';
// // import 'package:flutter/widgets.dart';
// // import 'dart:math';
// import 'package:gamoandomo/fortune_item.dart';


// void main()
// {
//   runApp(SpinCheck());
//   resetButtonPressCountIfNeeded();
// }
// void resetButtonPressCountIfNeeded()
// {
//   final now = DateTime.now();
//   if(now.day != lastPressDate.day)
//   {
//     //Reseting button press at the beginning of each day
//     lastPressDate = now;
//     buttonPressCount = 0;
//   }
// }
// int buttonPressCount = 0;
// DateTime lastPressDate = DateTime.now();
// class SpinCheck extends StatelessWidget {

// @override
// Widget build(BuildContext context) {
// return  MaterialApp(
// title: "Flutter Spin",
// theme: ThemeData(primarySwatch: Colors.blue),
// home: SpiningWheel(),
//     );
//   }
// }
// class SpiningWheel extends StatefulWidget {

//   @override
// _SpiningWheeltate createState() => _SpiningWheeltate();
// }
// class _SpiningWheeltate extends State<SpiningWheel>
// {
      
//     final StreamController _dividerController = StreamController<int>();
//     final _wheelNotifier = StreamController<double>();
     
//       @override
//      void dispose() {
//      super.dispose();
//     _dividerController.close();
//     _wheelNotifier.close();
//   }

//  void _handleStartButtonPress()
//   { 
//     if (buttonPressCount < 10) 
//     {
//        buttonPressCount++;
//        if(!_wheelNotifier.isClosed)
//        {
//         int randomValue = Random().nextInt(2);
//         //set the selected value to 1 or 5
//         _dividerController.sink.add(randomValue ==0 ? 1 : 5);
//         _wheelNotifier.sink.add(_generateRandomVelocity());
//          setState(() {}); 

//        }
//        // _wheelNotifier.sink.add(_generateRandomVelocity());
//          }
//           else
//            { 
//             showDialog( context: context,
//              builder: (BuildContext context)
//               {
//                  return AlertDialog( title: Text("Button Disabled"),
//                   content: Text("You have reached the maximum button presses for today."), 
//                   actions: [ ElevatedButton( onPressed: ()
//                    {
//                      Navigator.of(context).pop();
//                       },
//                        child: Text("OK"), 
//                        ), 
//                        ],
//                         );
//                          },
//                           );
//                            } 
//                            }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: Color(0xffDDC3FF),
//        elevation: 0.0,
//        actions: [
//         IconButton(icon: Icon(Icons.forward),
//         onPressed: (){
//           Navigator.push(context, MaterialPageRoute(builder: (context) => NewPage('Congra','abcd1234')),
//           );
//         },
//         )
//        ],
       
//        ),
       
//       backgroundColor: Color(0xffDDC3FF),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SpinningWheel(
//               Image.asset('assets/images/SpinCorrect.png'),
//               width: 310,
//               height: 310,
//               initialSpinAngle: _generateRandomAngle(),
//               spinResistance: 0.6,
//               canInteractWhileSpinning: false,
//               dividers: 8,
//               onUpdate: _dividerController.add,
//              // onEnd: _dividerController.add,
//              onEnd: (selected)
//              {
//               if(selected == 2  )
//               {
//                 Navigator.push(
//                   context,
//                 MaterialPageRoute(
//                   builder: (context) => NewPage(' Congra', 'abcd1234'),
//                 )
//                 );
//               }
//               else if(selected == 6 )
//               {
//                 Navigator.push(context, 
//                 MaterialPageRoute(builder: (context)=>NewPage('Congra','abcd5678'),
                
//                 ),
//                 );
//               }
//             _dividerController.add(selected);

//              },
//               secondaryImage:
//               Image.asset('assets/images/SpinCenter.png'),
//               secondaryImageHeight: 110,
//               secondaryImageWidth: 110,
//               shouldStartOrStop: _wheelNotifier.stream,
//             ),
//             SizedBox(height: 30),
//   //.......................Place where the texts are displayed
//             StreamBuilder(
//               stream: _dividerController.stream,
//               builder: (context, snapshot) =>
//                   snapshot.hasData ? RouletteScore(snapshot.data) : Container(),
//             ),
//             SizedBox(height: 140),
//   //.......................StartButton
//             new ElevatedButton(
//               child: new Text("Start (${10 - buttonPressCount} remaining)"),
//               onPressed:_handleStartButtonPress,
//               //Disable the button
//               style:ElevatedButton.styleFrom(
//                 primary: buttonPressCount >= 10 ? Colors.grey:null,
//               )
//               //  () =>
//               //     _wheelNotifier.sink.add(_generateRandomVelocity()),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//     double _generateRandomVelocity() => (Random().nextDouble() * 6000) + 2000;
//      double _generateRandomAngle() => Random().nextDouble() * pi * 2;
// }
// class RouletteScore extends StatelessWidget {
//   final int selected;

//   final Map<int, String> labels = {
//     1: 'Thank You',
//     2: 'Gamo Package1',
//     3: 'Gamo Package2',
//     4: 'Gamo Package3',
//     5: 'Thank You',
//     6: 'Omo Package1',
//     7: 'Omo Package2',
//     8: 'Omo Package3',
//   };

//   RouletteScore(this.selected);

//   @override
//   Widget build(BuildContext context) {
//     return Text('${labels[selected]}',
//         style: TextStyle(fontStyle: FontStyle.italic, fontSize: 24.0));
//   }
// }

// class NewPage extends StatelessWidget {
// final String text;
// final String id;
// NewPage(this.text,this.id);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(appBar: AppBar(title: Text("New Page"),
//     centerTitle: true,
//     ),
//     body: Center(child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//          // if(text.isNotEmpty && (text == '5000\$' || text == '7000\$')) // only display if text is not empty
//       //  if(text == '5000\$' || text == '7000\$')
//       if(text != null && id !=null)
//            Text(
//           text,
//           style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
//         ),
//         // if(id.isNotEmpty && (text == '5000\$' || text == '7000\$')) // only display if text is not empty
        
        
//       //  if( text == '5000\$' || text == '7000\$')
//         Text(
//           'id:$id',
//           style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
//         ),
       
//       ],
//     ),
//     ),
    
//     );
//   }
// }
