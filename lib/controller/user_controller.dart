import 'package:get/get.dart';
import 'package:search_user/model/user_model.dart';
import '../api_services.dart';

class UserController extends GetxController {
  RxBool loading = false.obs;
  RxList<UserModel> userList = <UserModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  fetchUserData() async {
    loading.value = true;
    Response response = await Services().getResponse(
        'https://mocki.io/v1/fb79f545-25de-4217-86d7-4ce69a823f66');
    userList.clear();
    if (response.statusCode == 200) {
      for (var element in response.body) {
        userList.add(UserModel.fromJson(element));
      }
    }
    Future.delayed(const Duration(seconds: 2), (() => loading.value = false));
  }
}
