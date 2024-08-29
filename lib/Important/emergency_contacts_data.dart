import 'package:flutter/material.dart';
// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:omogamo/Important/emergency_contacts.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:url_launcher/url_launcher.dart';


class ContactsData extends StatefulWidget {
  const ContactsData({required Key key}) : super(key: key);

  @override
  _ContactsDataState createState() => _ContactsDataState();
}

class _ContactsDataState extends State<ContactsData> {
  static List<String> emergencyContactsName = [
    "Arba Minch University",
    "e-Visa",
    "Tourist map web",
  ];

  static List<String> emergencyContactsInitials = [
    "EA",
    "CH",
    "PE",
    "SE"
  ];

  static List<dynamic> icons = [
    
    Icons.info_outline,
    Icons.book,
    Icons.tour,

    null
  ];
  static List<String> emergencyContactsNo = [
    "https://www.amu.edu.et/",
    "https://www.evisa.gov.et/",
    "https://google.com"
    
  ];

  final List<EmergencyContacts> emergencyContacts = List.generate(
      emergencyContactsName.length,
      (index) => EmergencyContacts(emergencyContactsInitials[index],
          emergencyContactsName[index], emergencyContactsNo[index]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(15),
            child: Wrap(children: [
              Column(children: <Widget>[
                
                Scrollbar(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        shrinkWrap: true,
                        itemCount: emergencyContactsName.length,
                        itemBuilder: (BuildContext context, index) {
                          EmergencyContacts _contacts =
                              emergencyContacts[index];
                          return SizedBox(
                              height: 100,
                              child: Card(
                                  elevation: 4,
                                  child: InkWell(
                                      onTap: () async {
                                        try{
                                          var web = _contacts.contactNo;
                                          await launcher.canLaunch(web); launch(web);

                                        }catch (err){
                                          debugPrint('Something bad happened');
                                        }
                                        
                                        
                                        // var phoneNo = _contacts.contactNo;
                                        // await FlutterPhoneDirectCaller
                                        //     .callNumber(phoneNo);
                                      },
                                      
                                      child: ListTile(
                                          title: Text(_contacts.name),
                                          subtitle: Text(_contacts.contactNo),
                                          dense: true,
                                          leading: CircleAvatar(
                                              child: Icon(icons[index]))))));
                        }))
              ])
            ])));
  }
}
