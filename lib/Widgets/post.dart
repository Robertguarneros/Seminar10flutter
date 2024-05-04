import 'package:flutter/material.dart';
import 'package:flutter_seminario/Models/UserModel.dart';
import 'package:flutter_seminario/Screens/detalles_user.dart';
import 'package:flutter_seminario/Screens/register_screen.dart';
import 'package:flutter_seminario/Screens/detalles_user.dart';
import 'package:flutter_seminario/Resources/pallete.dart';
import 'package:get/get.dart';


class PostWidget extends StatelessWidget {
  final User user;

  const PostWidget({Key? key, required this.user}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return Card(
      child: ListTile(
        title: Text('${user.first_name} ${user.last_name}'),
        onTap: () {
          Get.to(() => UserDetailsPage(user));
        },
      ),
    );
  }
}

