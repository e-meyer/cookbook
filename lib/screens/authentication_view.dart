import 'package:cookbook/components/auth_fields.dart';
import 'package:cookbook/components/auth_labels.dart';
import 'package:cookbook/components/signup_section.dart';
import 'package:cookbook/helpers/colorpallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final List<FocusNode> _focusNodes = [
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
              height: MediaQuery.of(context).size.height * 0.25,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Sign in',
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
              height: MediaQuery.of(context).size.height * 0.75,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Email Field
                      const AuthLabel(fieldLabel: 'E-mail'),
                      const SizedBox(
                        height: 5,
                      ),
                      AuthField(
                        focusNode: _focusNodes[0],
                        hintText: 'Enter your e-mail',
                        prefixIcon: Icons.email,
                        controller: _emailController,
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      // Password Field
                      const AuthLabel(fieldLabel: 'Password'),
                      const SizedBox(
                        height: 5,
                      ),
                      AuthField(
                        focusNode: _focusNodes[1],
                        hintText: 'Enter your password',
                        prefixIcon: Icons.key,
                        controller: _passwordController,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'Forgot your password?',
                            style: GoogleFonts.montserrat(
                              color: ColorPallete.darkGrey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/auth',
                              (route) => false,
                            );
                          }
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
                          'Login',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SignupSection(),
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
