import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_test/Controller/profileController.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  final storage = GetStorage();

  ProfileController controller = Get.put(ProfileController());

  Future<void> _refresh() async{
    await Future.delayed(const Duration(seconds: 2));
  }
  _ProfileScreenState(){
    controller.isLoading==null?controller.isLoading==true:controller.isLoading=controller.isLoading;
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: GetBuilder<ProfileController>(
          builder: (controller){
            return controller.isLoading==true?
            const Center(child: CircularProgressIndicator()):
            RefreshIndicator(
              onRefresh: _refresh,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("My Profile",style: Theme.of(context).textTheme.bodyLarge,),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          CircleAvatar(
                            foregroundImage: NetworkImage('http://127.0.0.1:8000/images/${controller.userModel.user!.urlImage}'),
                            radius: 50,
                          ),
                          const SizedBox(width: 15,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${controller.userModel.user!.name}',style: Theme.of(context).textTheme.displayMedium,),
                              Text('${controller.userModel.user!.email}')
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      const Divider(thickness: 1),
                       ListTile(
                         leading: const Icon(Icons.location_on),
                         title: Text('Shipping Addresses',style: Theme.of(context).textTheme.bodyMedium,),
                         subtitle: Text('3 addresses',style: Theme.of(context).textTheme.bodySmall,),
                         trailing: const Icon(Icons.navigate_next),
                         onTap: (){},
                       ),
                       const Divider(thickness: 1),
                       ListTile(
                         leading: const Icon(Icons.credit_card),
                         title: Text('Payment methods',style: Theme.of(context).textTheme.bodyMedium,),
                         subtitle: Text('3 card',style: Theme.of(context).textTheme.bodySmall,),
                         trailing: const Icon(Icons.navigate_next),
                         onTap: (){},
                       ),
                       const Divider(thickness: 1),
                       ListTile(
                         leading: const Icon(Icons.settings),
                         title: Text('Settings',style: Theme.of(context).textTheme.bodyMedium,),
                         subtitle: Text('Edit profile',style: Theme.of(context).textTheme.bodySmall,),
                         trailing: const Icon(Icons.navigate_next),
                         onTap: (){},
                       ),
                      const SizedBox(height: 400,)
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
  }
}
