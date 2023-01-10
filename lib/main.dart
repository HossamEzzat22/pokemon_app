import 'package:flutter/material.dart';
import 'package:pokemon_api/services/dio_helper/dio_service.dart';
import 'package:pokemon_api/services/sp_helper/sp_helper.dart';
import 'package:pokemon_api/src/app_root.dart';


void main()
{

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferenceHelper.init();
  DioHelper.init();
  runApp(AppRoot());
}

