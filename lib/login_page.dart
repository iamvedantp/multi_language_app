import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_language_app/language_provider.dart';
import 'package:provider/provider.dart';

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
        actions: [
          DropdownMenu(
            textStyle: const TextStyle(color: Colors.white),
            initialSelection: Text(
              context.watch<LanguageProvider>().selectedLocale.languageCode,
              style: const TextStyle(color: Colors.white),
            ),
            onSelected: (value) {
              context.read<LanguageProvider>().changeLanguage(value as String);
            },
            dropdownMenuEntries: LanguageProvider.languages
                .map((language) => DropdownMenuEntry(
                    value: language['locale'], label: language['name']))
                .toList(),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 51.0),
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
                  height: 5, // Decreased the height
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    AppLocalizations.of(context)!.forgotPass,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  backgroundColor: const Color(0xff1FA047),
                  foregroundColor: Colors.white),
              child: Text(AppLocalizations.of(context)!.loginBtn),
            ),
            Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.txtNoAcc,
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  AppLocalizations.of(context)!.txtSignUp,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            const SizedBox(
                height: 1), // Decreased the height between the text and buttons
            Row(
              children: [
                Expanded(
                  child: myBtn(
                    mIcon: FontAwesomeIcons.googlePlus,
                    Title: AppLocalizations.of(context)!.google,
                    mColor: Colors.red,
                  ),
                ),
                const SizedBox(width: 2),
                Expanded(
                  child: myBtn(
                    mIcon: FontAwesomeIcons.facebook,
                    Title: AppLocalizations.of(context)!.facebook,
                    mColor: Colors.blue,
                  ),
                ),
                const SizedBox(width: 2),
                Expanded(
                  child: myBtn(
                    mIcon: FontAwesomeIcons.twitter,
                    Title: AppLocalizations.of(context)!.twitter,
                    mColor: Colors.cyan,
                  ),
                ),
              ],
            ),
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
    icon: FaIcon(mIcon, color: Colors.white, size: 20),
    label: Text(Title, style: const TextStyle(color: Colors.white)),
    style: ElevatedButton.styleFrom(
      backgroundColor: mColor,
      minimumSize: const Size(double.infinity, 60),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}
