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
          AppLocalizations.of(context)!.signIn, // Localized sign-in text
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          DropdownMenu(
            textStyle: const TextStyle(color: Colors.white),
            initialSelection: Text(
              context
                  .watch<LanguageProvider>()
                  .selectedLocale
                  .languageCode, // Get current language code
              style: const TextStyle(color: Colors.white),
            ),
            onSelected: (value) {
              context.read<LanguageProvider>().changeLanguage(
                  value as String); // Change language on selection
            },
            dropdownMenuEntries: LanguageProvider.languages
                .map((language) => DropdownMenuEntry(
                    value: language['locale'],
                    label: language['name'])) // Language options
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
              AppLocalizations.of(context)!.heading, // Localized heading
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
                          hintText: AppLocalizations.of(context)!
                              .emailHint, // Localized email hint
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
                          hintText: AppLocalizations.of(context)!
                              .passHint, // Localized password hint
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
                  height: 10, // Decreased the height
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    AppLocalizations.of(context)!
                        .forgotPass, // Localized forgot password text
                    style: const TextStyle(
                        fontSize: 13,
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
              child: Text(AppLocalizations.of(context)!
                  .loginBtn), // Localized login button text
            ),
            Column(
              children: [
                Text(
                  AppLocalizations.of(context)!
                      .txtNoAcc, // Localized text for no account
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  AppLocalizations.of(context)!
                      .txtSignUp, // Localized sign-up text
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            const SizedBox(
                height: 5), // Decreased the height between the text and buttons
            Row(
              children: [
                Expanded(
                  child: myBtn(
                    mIcon: FontAwesomeIcons.googlePlus,
                    Title: AppLocalizations.of(context)!
                        .google, // Localized Google text
                    mColor: Colors.red,
                  ),
                ),
                const SizedBox(width: 2),
                Expanded(
                  child: myBtn(
                    mIcon: FontAwesomeIcons.facebook,
                    Title: AppLocalizations.of(context)!
                        .facebook, // Localized Facebook text
                    mColor: Colors.blue,
                  ),
                ),
                const SizedBox(width: 2),
                Expanded(
                  child: myBtn(
                    mIcon: FontAwesomeIcons.twitter,
                    Title: AppLocalizations.of(context)!
                        .twitter, // Localized Twitter text
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
      minimumSize: const Size(double.infinity, 50),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}
