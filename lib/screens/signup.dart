import 'package:ezwinmobilelegend/controllers/auth_controller.dart';
import 'package:ezwinmobilelegend/styles/app_colors.dart';
import 'package:ezwinmobilelegend/styles/text_styles.dart';
import 'package:ezwinmobilelegend/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:ezwinmobilelegend/screens/signin.dart';
import 'package:ezwinmobilelegend/widgets/custom_button.dart';
import 'package:ezwinmobilelegend/widgets/custom_formfield.dart';
import 'package:ezwinmobilelegend/widgets/custom_richtext.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _userName = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String get userName => _userName.text.trim();
  String get email => _emailController.text.trim();
  String get password => _passwordController.text.trim();

  bool _obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppColors.navy,
          ),
        ),
        ShaderMask(
          shaderCallback: (rect) {
            return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.transparent])
                .createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
          },
          blendMode: BlendMode.dstIn,
          child: Image.asset(
            "assets/images/login.jpg",
            height: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: MediaQuery.of(context).size.width / 1.5,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Create Account",
                    style: KTextStyle.headerAuthTextStyle,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFormField(
                  hintText: "Username",
                  obsecureText: false,
                  suffixIcon: const SizedBox(),
                  prefixIcon: const Icon(Icons.person),
                  maxLines: 1,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.name,
                  controller: _userName,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFormField(
                  hintText: "Email",
                  obsecureText: false,
                  suffixIcon: const SizedBox(),
                  prefixIcon: const Icon(Icons.email),
                  maxLines: 1,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.emailAddress,
                  controller: _emailController,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFormField(
                  maxLines: 1,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.text,
                  hintText: "Password",
                  obsecureText: _obsecureText,
                  suffixIcon: IconButton(
                      icon: _obsecureText
                          ? const Icon(
                              Icons.visibility,
                            )
                          : const Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _obsecureText = !_obsecureText;
                        });
                      }),
                  prefixIcon: const Icon(Icons.lock),
                  controller: _passwordController,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 24),
                      child: InkWell(
                        onTap: () {},
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: AppColors.lime,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
                AuthButton(
                  onTap: () {
                    setState(() {
                      AuthController().register(
                          _emailController.text, _passwordController.text);
                    });
                  },
                  text: 'Sign Up',
                ),
                CustomRichText(
                  discription: 'Already Have an account? ',
                  text: 'Log In here',
                  onTap: () {
                    Get.off(() => const Signin());
                  },
                )
              ],
            ),
          ),
        ),
        GetBuilder<AuthController>(
          builder: (controller) =>
              controller.isLoading ? const Loading() : Container(),
        ),
      ],
    );
  }
}
