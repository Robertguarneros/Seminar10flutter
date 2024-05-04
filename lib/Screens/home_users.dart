import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_seminario/Models/UserModel.dart';
import 'package:flutter_seminario/Screens/home_page.dart';
import 'package:flutter_seminario/Screens/detalles_user.dart';
import 'package:flutter_seminario/Widgets/post.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:dio/dio.dart' ;
import 'package:flutter_seminario/Services/UserService.dart';

late UserService userService;

class UserListPage extends StatefulWidget {
  UserListPage({Key? key}) : super(key: key);

  @override
  _UserListPage createState() => _UserListPage();
}

class _UserListPage extends State<UserListPage> {
  late List<User> userList;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    userService = UserService();
    getData();
  }

  void getData() async {
    try {
      userList = await userService.getUsers();
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      Get.snackbar(
        'Error',
        'Unable to fetch data.',
        snackPosition: SnackPosition.BOTTOM,
      );
      print('Error communicating with the backend: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Users List')),
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.turn_left,
                color: Colors.black,
              ),
              onPressed: () {
                Get.to(HomePage());
              },
            ),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return PostWidget(user: userList[index]);
          },
          itemCount: userList.length,
        ),
      );
    }
  }
}