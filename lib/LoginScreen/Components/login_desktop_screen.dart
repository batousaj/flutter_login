import 'package:flutter/material.dart';
import 'package:VPRO/Language/language.dart';
import 'package:VPRO/ModelEntity/LoginModelEntity/login_model_entity.dart';
import 'package:VPRO/Themes/color_picker.dart';
import 'package:VPRO/apiFlowManager/LoginFlowManager/login_flow_manager.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(width: 1.0)),
      child: SafeArea(child: child),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Size size;
  const RoundedButton({super.key, required this.size, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Hero(
        tag: "login_btn",
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6))),
              backgroundColor: MaterialStateProperty.all(Colors.green)),
          onPressed: onPressed,
          child: Text(
            context.localizeString().id_login.toUpperCase(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class LoginDesktopScreen extends StatelessWidget {
  const LoginDesktopScreen({super.key, required String title});

  static const double defaultPadding = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: const Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 330,
                  child: LoginForm(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    String _username = "";
    String _password = "";

    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/logo_black.png",
                  width: 150, height: 50, fit: BoxFit.fill),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 32, 0, 8),
            child: TextFieldContainer(
              child: TextFormField(
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                cursorColor: ColorPicker.kPrimaryColor,
                decoration: InputDecoration(
                  hintText: context.localizeString().id_account,
                  icon: const Icon(Icons.person),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  _username = value;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: TextFieldContainer(
              child: TextFormField(
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  cursorColor: ColorPicker.kPrimaryColor,
                  decoration: InputDecoration(
                    hintText: context.localizeString().id_password,
                    icon: const Icon(Icons.lock),
                    suffixIcon: const Icon(Icons.visibility),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    _password = value;
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: RoundedButton(
              size: const Size(500, 40),
              onPressed: () async {
                LoginModelEntity? entity =
                    await LoginFlowManager.instance.login(_username, _password);

                if (entity?.data?.token != null) {
                  final token = entity!.data!.token!;
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                            alignment: Alignment.center,
                            title: Text(
                              "Welcome",
                              textAlign: TextAlign.center,
                            ));
                      });
                } else {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(title: Text("Wrong password"));
                      });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
