import 'package:flutter/material.dart';
import 'package:flutter_seminario/Screens/home_users.dart';
import 'package:flutter_seminario/Resources/pallete.dart';
import 'package:flutter_seminario/Screens/register_screen.dart';
import 'package:flutter_seminario/Screens/login_screen.dart';
import 'package:flutter_seminario/Screens/create_place.dart';
import 'package:flutter_seminario/Screens/edit_place.dart'; // Import the EditPlaceScreen
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('DEMO FLUTTER')),
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu,
              color: Pallete.salmonColor,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Pallete.greyColor,
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset(
                'logo.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Divider(
                color: Pallete.backgroundColor,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Get.to(() => HomePage());
              },
            ),
            ListTile(
              leading: Icon(
                Icons.add,
                color: Colors.white,
              ),
              title: Text(
                'Create Place',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Get.to(() => CreatePlaceScreen());
              },
            ),
            ListTile(
              leading: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              title: Text(
                'Edit Place',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Get.to(() => EditPlaceScreen()); // Navigate to EditPlaceScreen
              },
            ),
            ListTile(
              leading: Icon(
                Icons.flood_outlined,
                color: Colors.white,
              ),
              title: Text(
                'View Users',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Get.to(() => UserListPage());
              },
            ),
            ListTile(
              leading: Icon(
                Icons.book,
                color: Colors.white,
              ),
              title: Text(
                'Log In',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Get.to(() => LoginScreen());
              },
            ),
            ListTile(
              leading: Icon(
                Icons.ad_units,
                color: Colors.white,
              ),
              title: Text(
                'Register',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Get.to(() => RegisterScreen());
              },
            ),
          ],
        ),
      ),
      body: Center(child: Text('This is the main page.')),
    );
  }
}
