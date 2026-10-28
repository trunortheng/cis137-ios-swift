# Midterm Project: Top Artists iOS App

[![SwiftUI](https://img.shields.io/badge/SwiftUI-iOS%2015%2B-orange.svg)](https://developer.apple.com/swiftui/)
[![Architecture](https://img.shields.io/badge/Architecture-MVVM-blue.svg)](https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/MVC.html)
[![Platform](https://img.shields.io/badge/Platform-iOS%20Simulator%20%2F%20Device-lightgrey.svg)](https://developer.apple.com/xcode/)

A modern, responsive iOS application developed using **SwiftUI** and structured around the **Model-View-ViewModel (MVVM)** architectural pattern. This project dynamically decodes, parses, and displays a curated list of top music artists from a local JSON payload (`Data.json`), offering seamless stack navigation from a summary list view to an expanded item detail view.

---

## 📋 Table of Contents
1. [Project Overview](#-project-overview)
2. [Features & Architecture](#-features--architecture)
3. [App Usage & Navigation](#-app-usage--navigation)
4. [Video Demonstration](#-video-demonstration)
5. [Rubric & Requirements Verification](#-rubric--requirements-verification)
6. [Installation & Setup](#-installation--setup)

---

## 🎵 Project Overview

The **Top Artists App** (`Midterm_erickRamos`) provides a clean interface for exploring music artists across various genres including Reggae, Modern Música Mexicana, Alternative Rock, and Pop. 

The application utilizes a local bundle JSON parser to hydrate data models, iterating over them using SwiftUI's `ForEach` constructs to build an interactive, containerized UI list. Tapping any individual artist row navigates to a dedicated detail screen showing a high-resolution feature image, title header, and full biographical background.

---

## 🏗️ Features & Architecture

* **MVVM Architecture**: Clean separation between data models (`Subject.swift`), business/decoding logic (`ArtistsViewModel`), and declarative views (`ContentView`, `DetailView`).
* **JSON Data Persistence**: Data is parsed dynamically from `Data.json` using custom `Bundle` extensions (`Helper.swift`).
* **Container & Stack Views**: Organized using `NavigationView`, `List`, `VStack`, `HStack`, and `ScrollView` container views.
* **Dynamic Navigation**: Utilizes `NavigationLink` to route users smoothly between the list view and detail view with built-in back navigation support.
* **Image Asset Mapping**: Dynamic asset rendering based on dataset properties (`imageName`).

---

## 📱 App Usage & Navigation

1. **Launch**: Upon launching the app, the home screen loads a navigation stack titled **`Erick's Top Artists`**.
2. **Browse List**: Scroll through the main list view. Each row displays:
   * A circular thumbnail image of the artist.
   * The artist's primary name.
   * A secondary hint prompting interaction (`Tap to view details`).
3. **View Details**: Tap on any list entry to trigger a push navigation transition to the `DetailView`.
4. **Inspect Information**: The detailed page displays:
   * A larger feature banner image with shadow styling.
   * The full artist title.
   * A section divider and detailed biographical summary.
5. **Return**: Tap the back button in the top-left navigation bar to return to the primary list.

---

## 🎥 Video Demonstration

Below is the demonstration video showing the application running on the iOS Simulator, highlighting smooth navigation from the main list to the detailed view and back.

### [Simulator Walkthrough](https://youtube.com/shorts/xhvpRbVYDS4?feature=share)

---

## 🎯 Rubric & Requirements Verification

| Rubric Criterion | Target Standard | Implementation Details | Status |
| :--- | :--- | :--- | :---: |
| **Bundle Identifier** | Reverse URL (`com.your_name.midterm`) | Configured in Xcode Project Target Settings as `com.your_name.midterm` | ✅ Complete |
| **Documentation** | Header comment with "Midterm Project", name, and date | Included at the top of `ContentView.swift` | ✅ Complete |
| **Navigation Title** | Must include developer's name | Set via `.navigationTitle("YourName's Top Artists")` | ✅ Complete |
| **JSON File** | Fully edited data file (`Data.json`) | Populated with 13 customized artist records | ✅ Complete |
| **ContentView Navigation List** | Displays list of items with images & names | Built using `List` + `ForEach()` over decoded JSON data | ✅ Complete |
| **Navigation Functionality** | Tapping item pushes detailed view with large image & description | `NavigationLink` transitions to `DetailView` containing larger assets & text | ✅ Complete |
| **README File** | Project description, usage guide, and demo video | Fully documented in this `README.md` file | ✅ Complete |

---

## ⚙️ Installation & Setup

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/Midterm_erickRamos.git
   ```
2. **Open in Xcode**:
   * Navigate to the repository directory.
   * Open `Midterm_erickRamos.xcodeproj`.
3. **Select Target & Simulator**:
   * Select any standard iOS Simulator (e.g., *iPhone 15*, *iPhone 16*).
4. **Build & Run**:
   * Press `Cmd + R` or click the **Play** button in Xcode to build and run the application.
