<<<<<<< HEAD
// Root-level build.gradle.kts for a Flutter-Firebase Android project

import org.gradle.api.tasks.Delete
import org.gradle.api.file.Directory

buildscript {
    dependencies {
        // Android Gradle Plugin
        classpath("com.android.tools.build:gradle:8.1.0")
        // Google Services plugin for Firebase
        classpath("com.google.gms:google-services:4.4.2")
    }

    repositories {
        google()
        mavenCentral()
    }
}

=======
>>>>>>> 4683582288b2d8b6b9983fd584d1049e26e105f1
allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

<<<<<<< HEAD
// Custom build output directory (optional but clean)
=======
>>>>>>> 4683582288b2d8b6b9983fd584d1049e26e105f1
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
<<<<<<< HEAD

// Ensure subprojects are evaluated after `:app`
=======
>>>>>>> 4683582288b2d8b6b9983fd584d1049e26e105f1
subprojects {
    project.evaluationDependsOn(":app")
}

<<<<<<< HEAD
// Clean task
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

=======
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
>>>>>>> 4683582288b2d8b6b9983fd584d1049e26e105f1
