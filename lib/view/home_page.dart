import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_user/controller/user_controller.dart';
import 'package:search_user/view/loader.dart';
import 'package:search_user/view/user_body_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());

    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: const Text('Home Screen'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => userController.fetchUserData(),
                icon: const Icon(Icons.refresh_rounded))
          ],
        ),
        body: Obx(() {
          if (userController.loading.value) {
            return const Loader();
          }
          return ListView.builder(
              itemCount: userController.userList.length,
              itemBuilder: (context, index) => UserBodyCard(
                    user: userController.userList[index],
                  ));
        }));
  }
}
