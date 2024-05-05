import 'package:flutter/material.dart';
import 'package:flutter_seminario/Services/UserService.dart';
import 'package:flutter_seminario/Widgets/button_sign_in.dart';
import 'package:flutter_seminario/Widgets/paramTextBox.dart';
import 'package:flutter_seminario/Screens/home_page.dart';
import 'package:flutter_seminario/Models/PlaceModel.dart';
import 'package:get/get.dart';

late UserService userService;

class EditPlaceScreen extends StatefulWidget {
  @override
  _EditPlaceScreenState createState() => _EditPlaceScreenState();
}

class _EditPlaceScreenState extends State<EditPlaceScreen> {
  final EditPlaceScreenController controller =
      Get.put(EditPlaceScreenController());

  @override
  void initState() {
    super.initState();
    userService = UserService(); // Initialize userService here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Place'), // Change app bar title to reflect editing
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Text(
                'Edit Place', // Update text to reflect editing
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const SizedBox(height: 40),
              ParamTextBox(
                controller: controller.idController,
                text: 'Id',
              ),
              const SizedBox(height: 40),
              ParamTextBox(
                controller: controller.titleController,
                text: 'Title',
              ),
              const SizedBox(height: 15),
              ParamTextBox(
                controller: controller.contentController,
                text: 'Content',
              ),
              const SizedBox(height: 15),
              ParamTextBox(
                controller: controller.photoController,
                text: 'Photo',
              ),
              const SizedBox(height: 15),
              ParamTextBox(
                controller: controller.authorController,
                text: 'Author',
              ),
              const SizedBox(height: 15),
              ParamTextBox(
                controller: controller.ratingController,
                text: 'Rating',
              ),
              const SizedBox(height: 15),
              ParamTextBox(
                controller: controller.addressController,
                text: 'Address',
              ),
              const SizedBox(height: 15),
              
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => controller.editPlace(),
                child: Text('Edit Place'), // Change button text to reflect editing
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class EditPlaceScreenController extends GetxController {
  final TextEditingController idController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController photoController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  void editPlace() {
    if (idController.text.isEmpty ) {
      Get.snackbar(
        'Error',
        'Empty ID',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Place editedPlace = Place(
        id: idController.text,
        title: titleController.text,
        content: contentController.text,
        photo: photoController.text,
        author: authorController.text,
        rating: int.tryParse(ratingController.text) ?? 0,
        address: addressController.text,
        place_deactivated: false,
        creation_date: DateTime.now().toString(),
        modified_date: DateTime.now().toString(),
      );

      userService.editPlace(editedPlace).then((statusCode) {
        if (statusCode == 200) {
          print('Place edited successfully');
          Get.snackbar(
            'Success!',
            'Place edited successfully',
            snackPosition: SnackPosition.BOTTOM,
          );
          Get.to(() => HomePage());
        } else {
          print('Error editing place');
          Get.snackbar(
            'Error',
            'Failed to edit place',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }).catchError((error) {
        Get.snackbar(
          'Error',
          'Failed to edit place: $error',
          snackPosition: SnackPosition.BOTTOM,
        );
        print('Error editing place: $error');
      });
    }
  }
}
