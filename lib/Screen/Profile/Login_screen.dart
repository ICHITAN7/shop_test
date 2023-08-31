import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_test/Controller/profileController.dart';
import 'package:shop_test/Screen/Profile/Register_screen.dart';
class LoginScreeen extends StatelessWidget {
  LoginScreeen({super.key});
  final emailCon = TextEditingController();
  final passwordCon = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.put(ProfileController());
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    final _primaryColor = Theme.of(context).primaryColor;
    final _border = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(color: _primaryColor),
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
                    'Login',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 10, bottom: 15),
                  child: Text(
                    'Welcome to my applycation.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  border: _border,
                                  enabledBorder: _border,
                                  focusedBorder: _border,
                                  labelText: 'Email',
                                  labelStyle: const TextStyle(color: Colors.black),
                                  hintText: 'root@example.com',
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: _primaryColor,
                                  ),
                                ),
                                cursorColor: Colors.black,
                                validator: (value) {
                                  if (value!.isEmpty || !value.isEmail) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                                controller: emailCon,
                              ),
                              const SizedBox(height: 25),
                              TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: _border,
                                  enabledBorder: _border,
                                  focusedBorder: _border,
                                  labelText: 'Password',
                                  labelStyle: const TextStyle(color: Colors.black),
                                  hintText: 'Example168',
                                  prefixIcon: Icon(
                                    Icons.key,
                                    color: _primaryColor,
                                  ),
                                ),
                                cursorColor: Colors.black,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter a password';
                                  }
                                  return null;
                                },
                                controller: passwordCon,
                              ),
                              const SizedBox(height: 25),
                              ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                    final email = emailCon.text;
                                    final pass = passwordCon.text;
                                    controller.login(email: email, password: pass);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(double.maxFinite, 60),
                                    backgroundColor: _primaryColor,
                                    shape: const ContinuousRectangleBorder(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(30))),
                                    textStyle: const TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold)),
                                child: const Text('Login'),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Divider(
                                    color: _primaryColor,
                                    thickness: 1,
                                  )),
                                  Text('Or'),
                                  Expanded(
                                      child: Divider(
                                    color: _primaryColor,
                                    thickness: 1,
                                  ))
                                ],
                              ),
                              TextButton(
                                  onPressed: () {
                                    Get.to(() => Register());
                                  },
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                        color: _primaryColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          )),
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
