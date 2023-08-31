import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_test/Controller/profileController.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}
class _RegisterState extends State<Register> {
  _RegisterState(){
    selectItem = position[0];
  }

  final controller = Get.put(ProfileController());
  final _keyform = GlobalKey<FormState>();

  final _nameCon = TextEditingController();

  final _emailCon = TextEditingController();

  final _passCon = TextEditingController();

  List<String> position = [
    'seller','buyer'
  ];

  String selectItem = '';
  String choosePosition='';
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final border = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(color: primaryColor,width: 1),
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 25),
                child: Text(
                  'Register',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10),
                child: Text(
                  'Register for new user.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Center(
                child: Container(
                        padding:const EdgeInsets.all(0),
                        width: Get.width*0.3,
                        height: Get.height*0.25,
                        child: GestureDetector(
                          onTap: ()=>controller.pickImage(),
                          child: CircleAvatar(
                            radius: 60,
                            child: Obx(() {
                              if (controller.selectedImage != null) {
                                return CircleAvatar(
                                  radius: 65,
                                  backgroundImage: FileImage(controller.selectedImage!),
                                );
                              } else {
                                return const Icon(Icons.add_a_photo_outlined);
                              }
                            }),
                          ),
                        ),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:25,right: 25),
                child: Form(
                  key: _keyform,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          border: border,
                          enabledBorder: border,
                          focusedBorder: border,
                          labelText: 'Name',
                          labelStyle: const TextStyle(color: Colors.black),
                          hintText: 'ROOT',
                          prefixIcon: Icon(
                            Icons.person,
                            color: primaryColor,
                          ),
                        ),
                        cursorColor: Colors.black,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a name';
                          }
                          return null;
                        },
                        controller: _nameCon,
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        decoration: InputDecoration(
                          border: border,
                          enabledBorder: border,
                          focusedBorder: border,
                          labelText: 'Email',
                          labelStyle: const TextStyle(color: Colors.black),
                          hintText: 'root@gmail.com',
                          prefixIcon: Icon(
                            Icons.email,
                            color: primaryColor,
                          ),
                        ),
                        cursorColor: Colors.black,
                        validator: (value) {
                          if (value!.isEmpty || !value.isEmail) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        controller: _emailCon,
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: border,
                          enabledBorder: border,
                          focusedBorder: border,
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: Colors.black),
                          hintText: 'Exampler168',
                          prefixIcon: Icon(
                            Icons.key,
                            color: primaryColor,
                          ),
                        ),
                        cursorColor: Colors.black,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                        controller: _passCon,
                      ),
                      const SizedBox(height: 20,),
                      DropdownButtonFormField(
                          value: selectItem,
                          items: position
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            choosePosition = value!;
                          },
                          decoration: InputDecoration(
                            enabledBorder: border,
                            border: border,
                            labelStyle:const TextStyle(color: Colors.black),
                            focusedBorder:OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: primaryColor,width: 2),
                            ),
                            labelText: 'Position',
                            prefixIcon: Icon(
                            Icons.badge_rounded,
                            color: primaryColor,
                          ),
                          ),
                          dropdownColor: primaryColor,
                          borderRadius:const BorderRadius.all(Radius.circular(20)),
                      ),
                      const SizedBox(height: 20,),
                      ElevatedButton(
                            onPressed: () {
                              if (_keyform.currentState!.validate()) {
                                _keyform.currentState!.save();
                                final _name = _nameCon.text;
                                final _email = _emailCon.text;
                                final _pass = _passCon.text;
                                final _position = selectItem;
                                controller.register(name: _name, email: _email, password: _pass, position: _position , profile: controller.selectedImage!);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(double.maxFinite, 60),
                                backgroundColor: primaryColor,
                                shape: const ContinuousRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                textStyle: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            child: const Text('Register'),
                          ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
