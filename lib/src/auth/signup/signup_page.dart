import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../const/utils/app_images.dart';
import '../../models/text_form_items.dart';
import '../../models/text_style.dart';
import 'bloc/signup_bloc.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({
    super.key,
  });

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController userNameController = TextEditingController();

  TextEditingController emailContRoller = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return BlocConsumer<SignupBloc, SignupState>(
      listener: (_, state) {
        if (state.updateState.isSuccess) {
          Navigator.pop(context, true);
        } else if (state.updateState.isError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: const Duration(milliseconds: 2000),
            content: Text(state.errorMessage),
          ));
        }
      },
      builder: (_, state) => Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  AppImages.background_image_2,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: media.size.height * 240 / 800,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      controller: userNameController,
                      keyboardType: TextInputType.text,
                      decoration: TextFormFieldItems.items(
                        text: 'Enter your name',
                        prefIcon: Icons.person,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your Email";
                        }
                        String pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
                        RegExp regExp = RegExp(pattern);
                        if (!regExp.hasMatch(value)) {
                          return "You enter invalid email";
                        }
                        return null;
                      },
                      controller: emailContRoller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: TextFormFieldItems.items(text: 'Enter your email', prefIcon: Icons.email),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      decoration: TextFormFieldItems.items(
                        text: 'Enter your password',
                        prefIcon: Icons.lock,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      controller: confirmPasswordController,
                      keyboardType: TextInputType.text,
                      decoration: TextFormFieldItems.items(
                        text: 'Confirm your password',
                        prefIcon: Icons.lock,
                      ),
                    ),
                    SizedBox(
                      height: media.size.height * 90 / 800,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 55),
                          backgroundColor: Colors.brown,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          context.read<SignupBloc>().add(
                            ChangePasswordEvent(
                              newPassword: confirmPasswordController.text,
                            ),
                          );
                        },
                        child: StyleText.items(text: 'Change Password', size: 15)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}