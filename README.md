# Flutter Google Sign-In & Remember Me App 🔐

This Flutter application demonstrates how to integrate **Google Sign-In using Firebase Authentication** and implement a **"Remember Me"** functionality using secure storage.

---

## 🚀 Features

- 🔐 Google Sign-In via Firebase  
- 🧠 "Remember Me" checkbox to persist sessions  
- 🔒 Secure token storage with `flutter_secure_storage`  
- ✅ Clean UI and responsive navigation  
- 🔄 Auto-login if the user is remembered  

---

## 📂 Folder Structure

lib/
├── main.dart
├── auth_service.dart
├── remember_me_service.dart
├── user_model.dart
├── login_screen.dart
└── home_screen.dart

## 🛠️ Setup Instructions:-

1. Clone the Repository :-
   git clone https://github.com/KPallav1204/My-Flutter-Google-login-and-remember-me-Project.git
   cd My-Flutter-Google-login-and-remember-me-Project

2. Install Flutter Dependencies:-
   flutter pub get

3. Firebase Setup:-
  Go to Firebase Console

  Create a project → Enable Google Sign-In under Authentication > Sign-in method

  Download google-services.json and add it to:
  android/app/

  (Optional for iOS) Add GoogleService-Info.plist to:
  ios/Runner/

  If needed, run:

  flutterfire configure

4. Run the App

  flutter run  

## 📦 Dependencies:-
   yaml

  firebase_core: ^2.0.0
  firebase_auth: ^4.0.0
  google_sign_in: ^6.0.0
  flutter_secure_storage: ^9.0.0
  
## 🔐 Security:-

  Sensitive files like google-services.json are excluded via .gitignore

  User tokens and preferences are stored securely using encrypted flutter_secure_storage

  No credentials are hardcoded anywhere in the project

## 🧪 To Do:-

  🔒 Add logout confirmation

  🔑 Add email/password login option

  🧬 Add biometric authentication

🙋 Author:-
  Kumar Pallav
  GitHub: @KPallav1204

This project is licensed under the MIT License. See the LICENSE file for details.





