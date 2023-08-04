import 'package:flutter/material.dart';
import 'package:untitled/about.dart';
import 'package:untitled/developer.dart';

class Drawerr extends StatelessWidget {
  const Drawerr({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff44BCCF),
            ),
            child: Icon(Icons.star),
          ),
          ListTile(
            leading: Icon(
              Icons.people,
              size: 40,
            ),
            title: Text(
              "Developer",
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => Developer(),
              ));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 40,
            ),
            title: Text(
              "About us",
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => About(),
              ));
            },
          )
        ],
      ),
    );
  }
}
