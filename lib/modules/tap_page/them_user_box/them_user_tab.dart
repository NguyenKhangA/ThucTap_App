import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thuc_tap_news/model/hive/boxes.dart';
import 'package:thuc_tap_news/model/hive/model_hive/user/user_model.dart';
import 'package:thuc_tap_news/model/provider/app_provider.dart';
import 'package:thuc_tap_news/modules/tap_page/them_user_box/widget/text_field_form.dart';


class ThemUserBox extends StatefulWidget {
  const ThemUserBox({super.key});

  @override
  State<ThemUserBox> createState() => _ThemUserBoxState();
}

class _ThemUserBoxState extends State<ThemUserBox> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passController;
  late AppChungKhoanProvider appProvider;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passController = TextEditingController();
    appProvider = context.read<AppChungKhoanProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(scrollDirection: Axis.vertical, children: [
        Container(
          margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Them user vao trong box",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              buildTextForm(
                  'Name', const Icon(Icons.person_add_alt), nameController),
              const SizedBox(
                height: 20,
              ),
              buildTextForm(
                  'email', const Icon(Icons.email_outlined), emailController),
              const SizedBox(
                height: 20,
              ),
              buildTextForm('password', const Icon(Icons.password_outlined),
                  passController),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  appProvider.addBox(
                      'key_${nameController.text}',
                      User(
                          name: nameController.text,
                          email: emailController.text,
                          password: passController.text));
                  User user = userBox.get('key_${nameController.text}');
                  if (user.name.isNotEmpty) {
                    nameController.clear();
                    emailController.clear();
                    passController.clear();
                  }
                },
                child: Container(
                  height: 45,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    border: Border.all(
                      style: BorderStyle.solid,
                    ),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    "Add User",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
