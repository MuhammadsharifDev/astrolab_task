import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../const/utils/app_images.dart';
import '../../models/text_form_items.dart';
import '../../models/text_style.dart';
import '../../routes/route_name.dart';
import 'bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailContRoller = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool _isPasswordUpdated = false;

  @override
  void dispose() {
    context.read<LoginBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) async {
      if (state.firebaseStatus.isSuccess) {
        if (_isPasswordUpdated) {
          await Navigator.pushNamed(context, RoutesName.main);
        } else {
          _isPasswordUpdated =
              await Navigator.pushNamed(context, RoutesName.signUp) as bool;
        }
      } else if (state.firebaseStatus.isError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(milliseconds: 2000),
          content: Text(state.errorMessage),
        ));
      }
    }, builder: (context, state) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  AppImages.background_image,
                  // Replace with your own image path
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: media.size.height * 280 / 800,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your Email";
                        }
                        String pattern =
                            r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
                        RegExp regExp = RegExp(pattern);
                        if (!regExp.hasMatch(value)) {
                          return "You enter invalid email";
                        }
                        return null;
                      },
                      controller: emailContRoller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: TextFormFieldItems.items(
                          text: 'Enter your email', prefIcon: Icons.email),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Error password';
                        }
                        return null;
                      },
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      decoration: TextFormFieldItems.items(
                          text: 'Enter your password',
                          prefIcon: Icons.lock,
                          sufIcon: Icons.visibility),
                    ),
                    SizedBox(
                      height: media.size.height * 120 / 800,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 55),
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          context.read<LoginBloc>().add(LoginBottomEvent(
                                email: emailContRoller.text,
                                password: passwordController.text,
                              ));
                        },
                        child: StyleText.items(text: 'Login', size: 15)),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
