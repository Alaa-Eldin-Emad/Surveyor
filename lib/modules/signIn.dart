import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surveying_engineer/cubit/password_cubit.dart';
import 'package:surveying_engineer/cubit/password_state.dart';
import 'package:surveying_engineer/modules/signUp.dart';

class SignIn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final focusEmail = FocusNode();
    final focusPassword = FocusNode();
    var emailController = TextEditingController();
    var passController = TextEditingController();
    RegExp emailRegExp = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (BuildContext context) => PasswordCubit(),
      child: BlocConsumer<PasswordCubit, PasswordState>(
        listener: (context, state) {},
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              focusPassword.unfocus();
              focusEmail.unfocus();
            },
            child: Scaffold(
              backgroundColor: Colors.black,
              body: ListView(
                children: <Widget>[
                  Stack(
                    children: [
                      const Image(
                          image: AssetImage('assets/peakpx.jpg'),
                          fit: BoxFit.fill),
                      Column(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.fromLTRB(7, 150, 240, 10),
                            child: Text('Sign in',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(7, 10, 7, 10),
                            child: BlurryContainer(
                              blur: 5,
                              color: Colors.grey.withOpacity(0.2),
                              child: Form(
                                key: formKey,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 10, 15, 10),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (!emailRegExp.hasMatch(value!)) {
                                            return 'Enter Correct Email';
                                          }
                                          return null;
                                        },
                                        style: const TextStyle(
                                            color: Colors.deepOrange),
                                        controller: emailController,
                                        focusNode: focusEmail,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    width: 2,
                                                    color: Colors.deepOrange),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            fillColor: Colors.white,
                                            filled: true,
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  width: 2, color: Color(0xFFB71C1C)),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            width: 2,
                                                            color: Color(0xFFB71C1C)),
                                                    borderRadius: BorderRadius
                                                        .circular(10)),
                                            prefixIcon: const Icon(
                                                Icons.mail_outline_rounded,
                                                color: Colors.deepOrange),
                                            labelText: 'Email',
                                            labelStyle: const TextStyle(
                                                color: Colors.deepOrange,
                                                fontSize: 17)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 10, 15, 10),
                                      child: TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Enter your password';
                                          }
                                          return null;
                                        },
                                        style: const TextStyle(
                                            color: Colors.deepOrange),
                                        controller: passController,
                                        focusNode: focusPassword,
                                        obscureText: !PasswordCubit.get(context)
                                            .passwordVisible,
                                        decoration: InputDecoration(
                                          hintStyle: const TextStyle(
                                              fontFamily: 'Serif',
                                              color: Colors.deepOrange),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  width: 2,
                                                  color: Colors.deepOrange),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          fillColor: Colors.white,
                                          filled: true,
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 2, color: Color(0xFFB71C1C)),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          focusedErrorBorder:OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 2, color: Color(0xFFB71C1C)),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          prefixIcon: const Icon(
                                              Icons.lock_outline_rounded,
                                              color: Colors.deepOrange),
                                          labelText: 'Password',
                                          labelStyle: const TextStyle(
                                              color: Colors.deepOrange,
                                              fontSize: 17),
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              PasswordCubit.get(context)
                                                      .passwordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: Colors.deepOrange,
                                            ),
                                            onPressed: () {
                                              PasswordCubit.get(context)
                                                  .isPasswordVisible();
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 10, 15, 10),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.deepOrange,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                          ),
                                          onPressed: () {
                                            checkValidation(formKey);
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                120, 15, 120, 15),
                                            child: Text(
                                              'Sign In',
                                              style: TextStyle(fontSize: 17),
                                            ),
                                          )),
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        const Text(
                                            "If you don't have an  account ",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.deepOrange)),
                                        TextButton(
                                          onPressed: () async {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SignUp()));
                                          },
                                          child: const Text(
                                            'click here',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                                color: Colors.white,
                                                decoration:
                                                    TextDecoration.underline),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  checkValidation(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      print('Validate');
    } else {
      print('Not Valid');
    }
  }
}
