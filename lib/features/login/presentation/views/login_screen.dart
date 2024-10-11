import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy_cycle_8/features/login/data/repo/login_repo_impelemntation.dart';
import 'package:mr_candy_cycle_8/features/login/presentation/controller/login_cubit.dart';
import 'package:mr_candy_cycle_8/features/login/presentation/controller/login_states.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => LoginCubit(LoginRepoImplementation()),
        child: LoginBody(),
      ),
    );
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        TextFormField(
          controller: emailController,
        ),
        const SizedBox(height: 20,),
        TextFormField(
          controller: passwordController,
        ),
        const SizedBox(height: 50,),

        BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {

            if(state is LoginFailureState){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }else if(state is  LoginSuccessState ) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("تم تسجيل الدخول بنجاح")));

            }
          },
          builder: (context, state) {
            return

              state is LoginLoadingState ?

            Center(child: CircularProgressIndicator())
            :
              MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                BlocProvider.of<LoginCubit>(context).login(
                    email: emailController.text.trim(),
                    pass: passwordController.text.trim())
                ;
              }, child: Text("Login"),);
          },
        )

      ],
    );
  }
}

