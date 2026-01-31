import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/app_contstants.dart';
import 'package:taskati/core/widgets/custom_app_button.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/features/home/models/user_model.dart';
import 'package:taskati/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user=Hive.box<UserModel>(AppContstants.userBox).getAt(0);
  final ImagePicker picker = ImagePicker();
  XFile? image;
  TextEditingController nameController=TextEditingController();
  void openCamera()async{
   image= await picker.pickImage(source: ImageSource.camera);
   setState(() {
   });
  }
  void openGallery()async{
   image= await picker.pickImage(source: ImageSource.gallery);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding:  EdgeInsets.only(left: 16.0,right: 16,top: 200),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
              children: [
        Visibility(visible: image==null
          ,child:CircleAvatar(
          radius: 100.r,
          child: Icon(Icons.person,size: 100),
        ),
          replacement:Container(
            width: 200.w,
            height: 200.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                  image:Image.file(File(image?.path??"")).image,
              )
            ),
          ),
        ),
              CustomAppButton(
        title: " Upload From Camera",
                onPressed: (){
                  openCamera();
                },
              ),
                CustomAppButton(
                  title:"Upload From Gallery" ,
                  onPressed: (){
                    openGallery();
                  },
                ),
                Divider(
                  color: Colors.indigo,
                ),
                TextFormField(
                  controller: nameController ,
                  onTapOutside: (v){
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.indigo
                      )
                    )
                  ),
                ),
                CustomAppButton(
                  title: "Login",
                  onPressed: (){
                    Hive.box<UserModel>(AppContstants.userBox).add(UserModel(image: image?.path??""
                        , name: nameController.text)).then((v){
                    print("success");
                    }).catchError((e){
                      print("error$e");
                    });
                  },
                ),
                Text(user?.name??""),
                Image.file(File(user?.image??""))



          ],
        ),
      ),
    );
  }
}
