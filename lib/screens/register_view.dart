import 'package:cookbook/components/auth_fields.dart';
import 'package:cookbook/components/auth_labels.dart';
import 'package:cookbook/helpers/colorpallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    _focusNodes.forEach((node) {
      node.addListener(() {
        setState(() {});
      });
    });
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.darkOrange,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.20,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Sign up',
                      style: GoogleFonts.montserrat(
                        fontSize: 46,
                        color: ColorPallete.plainWhite,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Make your world tastier',
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        color: ColorPallete.plainWhite,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                color: ColorPallete.lightGrey,
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.80,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AuthLabel(fieldLabel: 'Full Name'),
                      const SizedBox(height: 5),
                      AuthField(
                        focusNode: _focusNodes[0],
                        hintText: 'Enter your name',
                        prefixIcon: Icons.perm_identity,
                        controller: _nameController,
                      ),
                      const SizedBox(height: 30),

                      const AuthLabel(fieldLabel: 'E-mail'),
                      const SizedBox(height: 5),
                      AuthField(
                        focusNode: _focusNodes[1],
                        hintText: 'Enter your e-mail',
                        prefixIcon: Icons.email,
                        controller: _emailController,
                      ),
                      const SizedBox(height: 30),

                      const AuthLabel(fieldLabel: 'Password'),
                      const SizedBox(height: 5),
                      AuthField(
                        focusNode: _focusNodes[2],
                        hintText: 'Enter your password',
                        prefixIcon: Icons.key,
                        controller: _passwordController,
                        password: _passwordController.text,
                      ),
                      const SizedBox(height: 30),

                      const AuthLabel(fieldLabel: 'Confirm Password'),
                      const SizedBox(height: 5),
                      AuthField(
                        focusNode: _focusNodes[3],
                        hintText: 'Confirm your password',
                        prefixIcon: Icons.key,
                        controller: _confPasswordController,
                        password: _passwordController.text,
                      ),

                      const SizedBox(height: 50),
                      ElevatedButton(
                        onPressed: () {
                          //print(_formKey.currentState!.validate());
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/auth',
                              (route) => false,
                            );
                          }
                          print(_nameController.text);
                          print(_emailController.text);
                          print(_passwordController.text);
                          print(_confPasswordController.text);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: const Size.fromHeight(55),
                          elevation: 0,
                          backgroundColor: ColorPallete.darkOrange,
                        ),
                        child: Text(
                          'Register',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),

                      // const SignupSection(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
