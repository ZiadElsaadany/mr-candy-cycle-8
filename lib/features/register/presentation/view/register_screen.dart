import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy_cycle_8/features/home/presentation/views/home_bottom_screen.dart';
import 'package:mr_candy_cycle_8/features/register/data/models/register_model.dart';

import '../../../../generated/assets.dart';
import '../../data/repo/register_repo_implee.dart';
import '../controller/register_cubit.dart';
import '../controller/register_states.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => RegisterCubit(RegisterRepoImplementation()),
        child: RegisterBody(),
      ),
    );
  }
}

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var registerCubit = BlocProvider.of<RegisterCubit>(context);
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [


        BlocBuilder<RegisterCubit, RegisterStates>(
          builder: (context, state) {
            return GestureDetector(

              onTap: () async {
                registerCubit.pickProfileImage();
              },
              child:


              registerCubit.image == null ? Image.asset(Assets.imagesFav,
                height: 90,
                width: 90,
              ) :Center(
                child: ClipOval(
                  child: Container(
                    width: 120, // double the radius of the CircleAvatar
                    height:120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(File(registerCubit.image!.path)),
                        fit: BoxFit.cover, // This will make the image cover the entire circle
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        TextFormField(
          controller: nameController,
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: phoneController,
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: emailController,
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: passwordController,
        ),
        const SizedBox(
          height: 50,
        ),
        BlocConsumer<RegisterCubit, RegisterStates>(
          listener: (context, state) {
            if (state is RegisterFailureState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errorMessage)));
            } else if (state is RegisterSuccessState) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (C)=>const HomeBottomScreen()));

              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("تم انشاء الحساب بنجاح")));
            }
          },
          builder: (context, state) {
            return state is RegisterLoadingState
                ? const Center(child: CircularProgressIndicator())
                : MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                final bool emailValid =
                RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(emailController.text.trim());

                if(!emailValid){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("دخل الايميل صح")));
                }
              else  if(registerCubit.base64==null) {
                  // show SnackBar
                }else{
                  BlocProvider.of<RegisterCubit>(context).register(
                      userModelToRegister: UserModelToRegister(
                          name: nameController.text.trim(),
                          email: emailController.text.trim(),
                          phone: phoneController.text.trim(),
                          image: registerCubit.base64!,
                          password: passwordController.text.trim()));
                }

              },
              child: Text("Register"),
            );
          },
        ),
        // TextButton(onPressed: () {}, child: Text("انشاء حساب"))
      ],
    );
  }
}
