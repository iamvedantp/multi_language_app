import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: false,
        title: Text(
          AppLocalizations.of(context)!.signIn,
          style: const TextStyle(color: Colors.white),
        ),
        leading: const Icon(
          Icons.keyboard_backspace_sharp,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 51.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              AppLocalizations.of(context)!.heading,
              style: const TextStyle(
                  fontSize: 47,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          width: 0.5, color: Colors.white.withOpacity(0.3))),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.account_circle_outlined,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          hintText: AppLocalizations.of(context)!.emailHint,
                          hintStyle:
                              TextStyle(color: Colors.white.withOpacity(0.4)),
                          fillColor: Colors.transparent,
                          filled: true,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_open_outlined,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          hintText: AppLocalizations.of(context)!.passHint,
                          fillColor: Colors.transparent,
                          hintStyle:
                              TextStyle(color: Colors.white.withOpacity(0.4)),
                          filled: true,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 11,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    AppLocalizations.of(context)!.forgotPass,
                    style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(AppLocalizations.of(context)!.loginBtn),
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(
                    double.infinity,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  backgroundColor: const Color(0xff1FA047),
                  foregroundColor: Colors.white),
            ),
            Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.txtNoAcc,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  AppLocalizations.of(context)!.txtSignUp,
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: myBtn(
                        mIcon: FontAwesomeIcons.googlePlus,
                        Title: AppLocalizations.of(context)!.google,
                        mColor: Colors.red)),
                const SizedBox(
                  width: 2,
                ),
                Expanded(
                    child: myBtn(
                        mIcon: FontAwesomeIcons.facebook,
                        Title: AppLocalizations.of(context)!.facebook,
                        mColor: Colors.blue)),
                const SizedBox(
                  width: 2,
                ),
                Expanded(
                    child: myBtn(
                        mIcon: FontAwesomeIcons.twitter,
                        Title: AppLocalizations.of(context)!.twitter,
                        mColor: Colors.cyan)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget myBtn(
    {required IconData mIcon, required String Title, required Color mColor}) {
  return ElevatedButton.icon(
    onPressed: () {},
    icon: FaIcon(mIcon, color: Colors.white),
    label: Text(Title, style: const TextStyle(color: Colors.white)),
    style: ElevatedButton.styleFrom(
      backgroundColor: mColor,
      minimumSize: const Size(double.infinity, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}
