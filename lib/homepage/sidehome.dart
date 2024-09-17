import 'package:flutter/material.dart';
import 'package:semogajaditugas/appbar/appbar.dart';
import 'package:semogajaditugas/homepage/homepage.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: 50.0,
              height: 50.0,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black
              ),
            ),
            ListTile(
              leading: Icon(Icons.favorite_border_outlined),
              title: Text('Favorites'),
              onTap: () {
                // Handle tap
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                // akanmenujukehalamanprofile
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle tap
              },
            ),
          ],
        ),
      ),
      body: Homepage(),
    );
  }
}