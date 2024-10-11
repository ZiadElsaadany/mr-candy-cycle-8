import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_candy_cycle_8/features/login/presentation/views/login_screen.dart';

void main( ) {
  runApp(MrCandy());
}
class MrCandy extends StatelessWidget {
  const MrCandy({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: LoginScreen(),

    ) ;

  }
}
