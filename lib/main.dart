import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/features/home/models/user_model.dart';
import 'package:taskati/todo_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


String userBox="user";
void main()async{
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>(userBox);
  runApp(TodoApp());
}