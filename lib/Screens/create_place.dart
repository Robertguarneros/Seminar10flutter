import 'package:flutter/material.dart';
import 'package:flutter_seminario/Models/PlaceModel.dart';
import 'package:flutter_seminario/Services/UserService.dart';
import 'package:flutter_seminario/Widgets/button_sign_in.dart';
import 'package:flutter_seminario/Widgets/paramTextBox.dart';
import 'package:get/get.dart';

late UserService userService;

class CreatePlaceScreen extends StatefulWidget {
  CreatePlaceScreen({Key? key}) : super(key: key);

  @override
  _CreatePlaceScreenState createState() => _CreatePlaceScreenState();
}

class _CreatePlaceScreenState extends State<CreatePlaceScreen> {
  final CreatePlaceScreenController controller =
      Get.put(CreatePlaceScreenController());

  @override
  void initState() {
    super.initState();
    userService = UserService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Place'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Text(
                'Create Place',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
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
                onPressed: () => controller.createPlace(),
                child: Text('Create Place'),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class CreatePlaceScreenController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController photoController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  void createPlace() {
    if (titleController.text.isEmpty ||
        contentController.text.isEmpty ||
        photoController.text.isEmpty ||
        authorController.text.isEmpty ||
        ratingController.text.isEmpty ||
        addressController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Empty fields',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Place newPlace = Place(
        title: titleController.text,
        content: contentController.text,
        photo: photoController.text,
        author: authorController.text,
        rating: int.parse(ratingController.text),
        address: addressController.text,
        place_deactivated: false,
        creation_date: DateTime.now().toString(),
        modified_date: DateTime.now().toString(),
      );

      userService.createPlace(newPlace).then((statusCode) {
        if (statusCode == 201) {
          print('Place created successfully');
          Get.snackbar(
            'Success!',
            'Place created successfully',
            snackPosition: SnackPosition.BOTTOM,
          );
          Get.back(); // Navigate back after successful creation
        } else {
          print('Error creating place');
          Get.snackbar(
            'Error',
            'Failed to create place',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }).catchError((error) {
        Get.snackbar(
          'Error',
          'Failed to create place: $error',
          snackPosition: SnackPosition.BOTTOM,
        );
        print('Error creating place: $error');
      });
    }
  }
}
