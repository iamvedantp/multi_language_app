# Multi-Language App

![Screenshot_1722856945](https://github.com/user-attachments/assets/103fa3c7-a90a-4323-bbb1-740e513a9089)
![Screenshot_1722856949](https://github.com/user-attachments/assets/601a4411-b40b-4366-9838-8a1502246bff)
![Screenshot_1722856953](https://github.com/user-attachments/assets/0f2a933a-dcdf-4bc1-a219-d40c17c2bf94)


A simple Flutter application demonstrating multi-language support using the `provider` and `shared_preferences` packages.

## Features

- Multi-language support (English, Hindi, Marathi)
- Persisting selected language using `SharedPreferences`
- Localization using `flutter_localizations` and `flutter_gen`

## Getting Started

### Prerequisites

- Flutter SDK

### Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/your-username/multi_language_app.git
    ```

2. Navigate to the project directory:
    ```bash
    cd multi_language_app
    ```

3. Install dependencies:
    ```bash
    flutter pub get
    ```

4. Generate localization files:
    ```bash
    flutter pub run intl_utils:generate
    ```

5. Run the application:
    ```bash
    flutter run
    ```

## Project Structure

- `main.dart`: Entry point of the application, sets up the `LanguageProvider` and `MaterialApp`.
- `language_provider.dart`: Provides the selected language and persists it using `SharedPreferences`.
- `login_page.dart`: Example login page with language selection dropdown.
- `lib/l10n`: Directory containing localization files (`app_en.arb`, `app_hi.arb`, `app_mr.arb`).

## Localization

The localization files are placed in the `lib/l10n` directory. Each file contains key-value pairs for the text used in the application.

Example (`app_en.arb`):
```json
{
    "helloWorld": "Hello World!",
    "counterMsg": "You have pushed the button this many times:",
    "signIn": "Sign In",
    "heading": "Hotstar",
    "emailHint": "Email or Phone number",
    "passHint": "Password",
    "forgotPass": "Forgot Password?",
    "loginBtn": "Login",
    "txtNoAcc": "Don't have an account?",
    "txtSignUp": "Sign Up with",
    "google": "Google",
    "facebook": "Facebook",
    "twitter": "Twitter"
}

## Adding a New Language ##
1.Create a new .arb file in the lib/l10n directory, e.g., app_es.arb for Spanish.
2.Add the necessary key-value pairs for the new language.
3.Update the supportedLocales list in main.dart to include the new locale:
supportedLocales: const [
    Locale('en'),
    Locale('hi'),
    Locale('mr'),
    Locale('es'), // Spanish
],
4.Generate the localization files:
flutter pub run intl_utils:generate

## Contributing
Contributions are welcome! Please open an issue or submit a pull request with your changes.

License
This project is licensed under the MIT License - see the LICENSE file for details.
