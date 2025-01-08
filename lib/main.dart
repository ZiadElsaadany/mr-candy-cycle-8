import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mr_candy_cycle_8/features/home/presentation/views/home_bottom_screen.dart';
import 'package:mr_candy_cycle_8/features/login/presentation/views/login_screen.dart';

import 'features/home/presentation/controller/home_cubit/home_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("setting");
  print("token: ${Hive.box("setting").get("token")}");
  await ScreenUtil.ensureScreenSize();
  runApp(MrCandy());
}

class MrCandy extends StatelessWidget {
  const MrCandy({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 1006),
        minTextAdapt: true,
        splitScreenMode: true,
      builder:(_,child){
        return MaterialApp(
        home:

        Hive.box("setting").get("token") == null ?//

    LoginScreen() : HomeBottomScreen(),


    );
    }
    );
  }
}
