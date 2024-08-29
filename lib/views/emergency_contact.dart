import 'package:flutter/material.dart';
import 'package:omogamo/Components/emergency_contacts_data.dart';
import 'package:omogamo/Components/personal_emergency_contacts.dart';
import 'package:omogamo/utils/colors.dart';

class EmergencyContact extends StatefulWidget {
  const EmergencyContact({required Key key}) : super(key: key);

  @override
  _EmergencyContact createState() => _EmergencyContact();
}

class _EmergencyContact extends State<EmergencyContact>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      vsync: this,
      initialIndex: 0,
      length: 2,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "1-Click Emergency Contact",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.7,
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          labelColor: tr3,
          tabs: const <Widget>[
            Tab(text: "Emergency Contacts"),
            Tab(text: "Personal Emergency"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          ContactsData(key: UniqueKey()), // Pass a unique key
          PersonalEmergencyContacts(key: UniqueKey()), // Pass a unique key
        ],
      ),
    );
  }
}
