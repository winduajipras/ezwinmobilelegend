import 'package:ezwinmobilelegend/controllers/auth_controller.dart';
import 'package:ezwinmobilelegend/styles/text_styles.dart';
import 'package:ezwinmobilelegend/widgets/custom_button.dart';
import 'package:ezwinmobilelegend/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final auth = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 1.8,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50)),
                child: Image.asset(
                  "assets/images/login.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Windu Aji Prasetiyo",
              style: KTextStyle.profileNameTextStyle,
            ),
            const Text(
              "Perfect Win is Easy",
              style: KTextStyle.profileStatusTextStyle,
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const Text(
                    'Statistics',
                    style: KTextStyle.textFieldHintStyle,
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.hive)),
                          const Text(
                            "Hero",
                            style:
                                KTextStyle.bottomNavigationBarSelectedTextStyle,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.build_circle_outlined)),
                          const Text(
                            "Build",
                            style:
                                KTextStyle.bottomNavigationBarSelectedTextStyle,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.people_alt_outlined)),
                          const Text(
                            "Role",
                            textAlign: TextAlign.center,
                            style:
                                KTextStyle.bottomNavigationBarSelectedTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.history)),
                          const Text(
                            "History",
                            style:
                                KTextStyle.bottomNavigationBarSelectedTextStyle,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.card_membership)),
                          const Text(
                            "Member",
                            style:
                                KTextStyle.bottomNavigationBarSelectedTextStyle,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.theater_comedy_outlined)),
                          const Text(
                            "Theme",
                            textAlign: TextAlign.center,
                            style:
                                KTextStyle.bottomNavigationBarSelectedTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AuthButton(
                    onTap: () {
                      setState(() {
                        AuthController().logout();
                      });
                    },
                    text: 'Log Out',
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned.fill(
          top: MediaQuery.of(context).size.width / 2.7,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 5),
                borderRadius: const BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(100),
                ),
                child: Image.asset(
                  "assets/images/windu.jpg",
                  fit: BoxFit.cover,
                ),
              ),
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
