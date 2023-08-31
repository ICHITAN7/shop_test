import 'dart:io';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_test/Controller/api_helper.dart';
import 'package:shop_test/Model/UserModel.dart';
import 'package:shop_test/Screen/Profile/Login_screen.dart';
import '../Screen/MainPage.dart';

class ProfileController extends GetxController {

  UserModel userModel = UserModel();
  bool isLoading = false;
  final ApiHelper _helper = ApiHelper();
  final ImagePicker _imagePicker = ImagePicker();
  final storage = GetStorage();
  Rx<File?> _selectedImage = Rx<File?>(null);
  File? get selectedImage => _selectedImage.value;

  ProfileController(){
    update();
    if(storage.read('access_token')==null){
      Get.to(LoginScreeen());
    }else{
     update() ;
    }
    user();
  }

  Future<void> pickImage() async
    {
    try {
      final pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        _selectedImage.value = File(pickedImage.path);
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void register ({required String name, required String email, required String password, required String position, required File profile,}) async
    {
    try {
      final registered = await _helper.register(
        name: name,
        email: email,
        password: password,
        position: position,
        profile: profile,
      );
      Get.snackbar('Message',registered);
      Get.to(()=>LoginScreeen());
    }catch (e){
      Get.snackbar('Error',e.toString());
      print(e);
    }
  }

  void login ({required String email,required String password})async
    {
      try {
        final login = await _helper.login(
          email:email,
          password:password
        );
        Get.offAll(()=>const MainPage());
        storage.write('access_token', login.toString());
        Get.snackbar('Message', 'Success');
      }catch (e) {
        Get.snackbar('Error', e.toString());
      }
    }
  void user ()async
    {
      try {
        isLoading = true;
        update();
        final token = storage.read('access_token');
        final user = await _helper.userHelper(token: token);
        userModel = user;
        isLoading = false;
        update();
      }catch (e) {
        isLoading = false;
        update();
        Get.snackbar('Error :', e.toString());
      }
    }

}