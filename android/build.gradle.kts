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

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Custom build output directory (optional but clean)
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

// Ensure subprojects are evaluated after `:app`
subprojects {
    project.evaluationDependsOn(":app")
}

// Clean task
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

