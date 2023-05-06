import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surveying_engineer/cubit/password_cubit.dart';
import 'package:surveying_engineer/cubit/password_state.dart';
import 'package:surveying_engineer/modules/signIn.dart';
import '../network/signUpNetwork.dart';

class SignUp extends StatelessWidget {
  Future<Album>? _futureAlbum;
  RegExp emailRegExp = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
  RegExp phoneRegExp =RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{5}$');
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  final phoneController = TextEditingController();
  final confPasswordController = TextEditingController();
  final focusName = FocusNode();
  final focusEmail = FocusNode();
  final focusPassword = FocusNode();
  final focusConfPassword = FocusNode();
  final focusPhone = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PasswordCubit(),
      child: BlocConsumer<PasswordCubit, PasswordState>(
        listener: (context, state) {},
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              focusEmail.unfocus();
              focusConfPassword.unfocus();
              focusName.unfocus();
              focusPassword.unfocus();
              focusPhone.unfocus();
            },
            child: Scaffold(
                backgroundColor: Colors.black,
                body: ListView(
                    children: <Widget>[
                Stack(
                children:  [
                const Image(
                    image: AssetImage('assets/peakpx.jpg'),
                    fit: BoxFit.fill),
                  Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.fromLTRB(7, 150, 240, 10),
                        child: Text('Sign up',
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
                                      if (value!.isEmpty) {
                                        return 'Enter your name';
                                      }
                                      return null;
                                    },
                                    style: const TextStyle(
                                        color: Colors.deepOrange),
                                    controller: nameController,
                                    focusNode: focusName,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.transparent),
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
                                            Icons.person,
                                            color: Colors.deepOrange),
                                        labelText: 'Name',
                                        labelStyle: const TextStyle(
                                            color: Colors.deepOrange,
                                            fontSize: 17)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      15, 10, 15, 10),
                                  child: TextFormField(
                                    validator: (value) {
                                      if(value!.isEmpty){
                                        return 'Enter your phone number';
                                      }
                                      else if (!phoneRegExp.hasMatch(value!)) {
                                        return 'Enter the correct phone number';
                                      }
                                      return null;
                                    },
                                    style: const TextStyle(
                                        color: Colors.deepOrange),
                                    controller: phoneController,
                                    focusNode: focusPhone,
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
                                            Icons.phone,
                                            color: Colors.deepOrange),
                                        labelText: 'Phone number',
                                        labelStyle: const TextStyle(
                                            color: Colors.deepOrange,
                                            fontSize: 17)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      15, 10, 15, 10),
                                  child: TextFormField(
                                    validator: (value) {
                                      if(value!.isEmpty){
                                        return 'Enter your Email address';
                                      }
                                      else if (!emailRegExp.hasMatch(value!)) {
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
                                      else if (value.length<8){
                                        return 'Enter a password with length at least 8';
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
                                      focusedErrorBorder:  OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 2, color: Color(0xFFB71C1C)),
                                        borderRadius:
                                        BorderRadius.circular(10),
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
                                  child: TextFormField(
                                    autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter your password for confirmation';
                                      }
                                      else if(passController.text!=value){
                                        return 'The password Not Match.';
                                      }
                                      return null;
                                    },
                                    style: const TextStyle(
                                        color: Colors.deepOrange),
                                    controller: confPasswordController,
                                    focusNode: focusConfPassword,
                                    obscureText: !PasswordCubit.get(context).confirmPasswordVisible,
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
                                      focusedErrorBorder:  OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 2, color: Color(0xFFB71C1C)),
                                        borderRadius:
                                        BorderRadius.circular(10),
                                      ),
                                      prefixIcon: const Icon(
                                          Icons.lock_outline_rounded,
                                          color: Colors.deepOrange),
                                      labelText: 'Confirm your Password',
                                      labelStyle: const TextStyle(
                                          color: Colors.deepOrange,
                                          fontSize: 17),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          PasswordCubit.get(context).confirmPasswordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.deepOrange,
                                        ),
                                        onPressed: () {
                                          PasswordCubit.get(context)
                                              .isConfirmPasswordVisible();
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
                                        if (_futureAlbum == null) {
                                                        _futureAlbum = createAlbum(
                                                          nameController.text,
                                                          emailController.text,
                                                          phoneController.text,
                                                          passController.text,
                                                        );
                                                      } else {
                                                        buildFutureBuilder();
                                                      }
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            120, 15, 120, 15),
                                        child: Text(
                                          'Sign up',
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
                                        "If you already have account ",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.deepOrange)),
                                    TextButton(
                                      onPressed: () async {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignIn()));
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

            // Scaffold(
            //   appBar: AppBar(
            //     title: const Text('Sign Up',
            //         style: TextStyle(
            //             fontWeight: FontWeight.w600,
            //             fontFamily: 'Serif',
            //             color: Colors.white)),
            //     backgroundColor: Colors.indigo,
            //   ),
            //   backgroundColor: Colors.white,
            //   body: ListView(
            //     children: <Widget>[
            //       Padding(
            //         padding: const EdgeInsets.fromLTRB(15, 50, 15, 5),
            //         child: TextFormField(
            //           controller: nameController,
            //           focusNode: focusName,
            //           decoration: InputDecoration(
            //             enabledBorder: OutlineInputBorder(
            //               borderSide: const BorderSide(color: Colors.indigo),
            //               borderRadius: BorderRadius.circular(25),
            //             ),
            //             hintText: "Name",
            //             hintStyle: const TextStyle(
            //                 fontFamily: 'Serif', color: Colors.indigo),
            //             focusedBorder: OutlineInputBorder(
            //                 borderSide: const BorderSide(color: Colors.indigo),
            //                 borderRadius: BorderRadius.circular(10)),
            //             fillColor: Colors.white10,
            //             filled: true,
            //           ),
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.fromLTRB(15, 25, 15, 10),
            //         child: TextFormField(
            //           controller: phoneController,
            //           focusNode: focusPhone,
            //           decoration: InputDecoration(
            //             enabledBorder: OutlineInputBorder(
            //                 borderSide: const BorderSide(color: Colors.indigo),
            //                 borderRadius: BorderRadius.circular(25)),
            //             hintText: "Phone Number",
            //             hintStyle: const TextStyle(
            //                 fontFamily: 'Serif', color: Colors.indigo),
            //             focusedBorder: OutlineInputBorder(
            //                 borderSide: const BorderSide(color: Colors.indigo),
            //                 borderRadius: BorderRadius.circular(10)),
            //             fillColor: Colors.white,
            //             filled: true,
            //           ),
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.fromLTRB(15, 25, 15, 10),
            //         child: TextFormField(
            //           controller: emailController,
            //           focusNode: focusEmail,
            //           decoration: InputDecoration(
            //             enabledBorder: OutlineInputBorder(
            //                 borderSide: const BorderSide(color: Colors.indigo),
            //                 borderRadius: BorderRadius.circular(25)),
            //             hintText: "Email",
            //             hintStyle: const TextStyle(
            //                 fontFamily: 'Serif', color: Colors.indigo),
            //             focusedBorder: OutlineInputBorder(
            //                 borderSide: const BorderSide(color: Colors.indigo),
            //                 borderRadius: BorderRadius.circular(10)),
            //             fillColor: Colors.white,
            //             filled: true,
            //           ),
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.fromLTRB(15, 25, 15, 10),
            //         child: TextFormField(
            //           controller: passController,
            //           focusNode: focusPassword,
            //           obscureText: !PasswordCubit.get(context).passwordVisible,
            //           decoration: InputDecoration(
            //             hintText: "Password",
            //             hintStyle: const TextStyle(
            //                 fontFamily: 'Serif', color: Colors.indigo),
            //             enabledBorder: OutlineInputBorder(
            //                 borderSide: const BorderSide(color: Colors.indigo),
            //                 borderRadius: BorderRadius.circular(25)),
            //             focusedBorder: OutlineInputBorder(
            //                 borderSide: const BorderSide(color: Colors.indigo),
            //                 borderRadius: BorderRadius.circular(10)),
            //             fillColor: Colors.white,
            //             filled: true,
            //             suffixIcon: IconButton(
            //               icon: Icon(
            //                 PasswordCubit.get(context).passwordVisible
            //                     ? Icons.visibility
            //                     : Icons.visibility_off,
            //                 color: Colors.indigo,
            //               ),
            //               onPressed: () {
            //                 PasswordCubit.get(context).isPasswordVisible();
            //               },
            //             ),
            //           ),
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.fromLTRB(15, 25, 15, 25),
            //         child: TextFormField(
            //           controller: confPasswordController,
            //           focusNode: focusConfPassword,
            //           obscureText:
            //               !PasswordCubit.get(context).confirmPasswordVisible,
            //           decoration: InputDecoration(
            //             hintText: "Confirm Password",
            //             hintStyle: const TextStyle(
            //                 fontFamily: 'Serif', color: Colors.indigo),
            //             enabledBorder: OutlineInputBorder(
            //                 borderSide: const BorderSide(color: Colors.indigo),
            //                 borderRadius: BorderRadius.circular(25)),
            //             focusedBorder: OutlineInputBorder(
            //                 borderSide: const BorderSide(color: Colors.indigo),
            //                 borderRadius: BorderRadius.circular(10)),
            //             fillColor: Colors.white,
            //             filled: true,
            //             suffixIcon: IconButton(
            //               icon: Icon(
            //                 PasswordCubit.get(context).confirmPasswordVisible
            //                     ? Icons.visibility
            //                     : Icons.visibility_off,
            //                 color: Colors.indigo,
            //               ),
            //               onPressed: () {
            //                 PasswordCubit.get(context)
            //                     .isConfirmPasswordVisible();
            //               },
            //             ),
            //           ),
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            //         child: ElevatedButton(
            //             style: ElevatedButton.styleFrom(
            //               backgroundColor: Colors.indigo,
            //               shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(25)),
            //             ),
            //             onPressed: () {
            //               if (_futureAlbum == null) {
            //                 _futureAlbum = createAlbum(
            //                   nameController.text,
            //                   emailController.text,
            //                   phoneController.text,
            //                   passController.text,
            //                 );
            //               } else {
            //                 buildFutureBuilder();
            //               }
            //             },
            //             child: const Padding(
            //               padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            //               child: Text(
            //                 'Sign Up',
            //                 style: TextStyle(fontSize: 17),
            //               ),
            //             )),
            //       ),
            //       const SizedBox(
            //         height: 10,
            //       ),
            //       Row(
            //         children: [
            //           const SizedBox(
            //             width: 25,
            //           ),
            //           const Text('if you already have account ',
            //               style: TextStyle(fontSize: 16)),
            //           TextButton(
            //             onPressed: () {
            //               Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                       builder: (context) => SignIn()));
            //             },
            //             child: const Text(
            //               'click here',
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 17,
            //                   color: Colors.indigo,
            //                   decoration: TextDecoration.underline),
            //             ),
            //           )
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
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

  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.name +
              snapshot.data!.phoneNumber +
              snapshot.data!.email +
              snapshot.data!.password);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
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
