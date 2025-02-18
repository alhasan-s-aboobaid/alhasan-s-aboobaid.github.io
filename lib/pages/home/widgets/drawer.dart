
import 'package:alhasan_abo_obaid/core/providers/page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {

  late PageProvider pageProvider;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    pageProvider = Provider.of<PageProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
           const DrawerHeader(
            decoration: BoxDecoration(color: Colors.black87),
            child: Text("Alhasan Abo Obaid", style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
          _drawerItem("Home", 0),
          _drawerItem("Skills", 1),
          _drawerItem("Projects", 2),
          _drawerItem("Contact", 3),
        ],
      ),
    );
  }

  /// Drawer Menu Item
  Widget _drawerItem(String title, int index) {
    return ListTile(
      title: Text(title),
      onTap: () {
        print("dddddd");
        pageProvider.setCurrentIndex(index);
        Scaffold.of(context).closeDrawer();
      },
    );
  }
}