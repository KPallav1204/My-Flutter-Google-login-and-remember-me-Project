plugins {
    id("com.android.application")
    id("kotlin-android")
<<<<<<< HEAD
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services") // ✅ Required for Firebase
}

android {
    namespace = "com.example.my_new_one" // ✅ Use your actual package name
=======
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.my_app"
>>>>>>> 4683582288b2d8b6b9983fd584d1049e26e105f1
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
<<<<<<< HEAD
        applicationId = "com.example.my_new_one" // ✅ Same as namespace
=======
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.my_app"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
>>>>>>> 4683582288b2d8b6b9983fd584d1049e26e105f1
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
<<<<<<< HEAD
=======
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
>>>>>>> 4683582288b2d8b6b9983fd584d1049e26e105f1
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
<<<<<<< HEAD

dependencies {
    implementation("com.google.firebase:firebase-auth:22.3.1") // ✅ Firebase Authentication
    implementation("com.google.android.gms:play-services-auth:21.1.0") // ✅ Google Sign-In
}
=======
>>>>>>> 4683582288b2d8b6b9983fd584d1049e26e105f1
