import 'package:ezwinmobilelegend/controllers/auth_controller.dart';
import 'package:ezwinmobilelegend/styles/text_styles.dart';
import 'package:ezwinmobilelegend/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:ezwinmobilelegend/styles/app_colors.dart';
import 'package:ezwinmobilelegend/screens/signup.dart';
import 'package:ezwinmobilelegend/widgets/custom_button.dart';
import 'package:ezwinmobilelegend/widgets/custom_formfield.dart';
import 'package:ezwinmobilelegend/widgets/custom_richtext.dart';
import 'package:get/get.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final auth = Get.put(AuthController());

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
                    "Welcome Back",
                    style: KTextStyle.headerAuthTextStyle,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFormField(
                  hintText: "Email",
                  obsecureText: false,
                  suffixIcon: const SizedBox(),
                  prefixIcon: const Icon(Icons.email),
                  controller: _emailController,
                  maxLines: 1,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.emailAddress,
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
                      AuthController().login(
                          _emailController.text, _passwordController.text);
                    });
                  },
                  text: 'Sign In',
                ),
                CustomRichText(
                  discription: "Don't already Have an account? ",
                  text: "Sign Up",
                  onTap: () {
                    Get.off(() => const SignUp());
                  },
                ),
              ],
            ),
          ),
        ),
        GetBuilder<AuthController>(
          init: AuthController(),
          builder: (controller) =>
              controller.isLoading ? const Loading() : Container(),
        ),
      ],
    );
  }
}
