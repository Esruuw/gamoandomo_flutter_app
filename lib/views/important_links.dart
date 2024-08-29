import 'package:flutter/material.dart';
import 'package:omogamo/Important/emergency_contacts_data.dart';
import 'package:omogamo/utils/colors.dart';
import 'package:omogamo/views/menu.dart';

class ImportantLinks extends StatefulWidget {
  const ImportantLinks({required Key key}) : super(key: key);

  @override
  _ImportantLinks createState() => _ImportantLinks();
}

class _ImportantLinks extends State<ImportantLinks>
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
        title: const Text("Important Links"),
        elevation: 0.7,
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          labelColor: tr3,
          tabs: const <Widget>[
            Tab(text: "Contacts"),
            Tab(text: "Menu")
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          ContactsData(key: UniqueKey()), // Pass a unique key
          MenuPage(key: UniqueKey()) // Pass a unique key
        ],
      ),
    );
  }
}
