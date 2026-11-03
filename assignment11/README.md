# Holiday Festival Explorer

[![SwiftUI](https://img.shields.io/badge/SwiftUI-iOS%2016%2B-orange.svg)](https://developer.apple.com/swiftui/)
[![Architecture](https://img.shields.io/badge/Architecture-Modular%20Views-blue.svg)](https://developer.apple.com/swiftui/)
[![Platform](https://img.shields.io/badge/Platform-iOS%20Simulator%20%2F%20Device-lightgrey.svg)](https://developer.apple.com/xcode/)

A clean, modern iOS mobile application developed using **SwiftUI** as part of coursework for **CIS 137**. This application demonstrates advanced layout principles using native `TabView` navigation, rich contextual interactions via `.contextMenu`, custom image assets, and dedicated multimedia video demonstration fields.

---

## 🎥 Demo

Check out the **Holiday Festival Explorer** in action:

https://github.com/user-attachments/assets/53377061-873c-4d68-8751-694f427d1749

*(Click the image above to watch the demo!)*

---

## 📋 Table of Contents
1. [Project Overview](#-project-overview)
2. [Features & Architecture](#-features--architecture)
3. [Featured Festivals](#-featured-festivals)
4. [App Usage & Navigation](#-app-usage--navigation)
5. [Installation & Setup](#-installation--setup)

---

## 🌍 Project Overview

The **Holiday Festival Explorer** (`Assignment_11`) provides a polished interface for exploring culturally significant global festivals. Built specifically to fulfill coursework requirements for tab-based application structures and context menus, the app invites users to explore rich histories, custom image assets, and video demonstration resources for **Día de los Muertos**, **4th of July**, and **Holi**.

---

## 🏗️ Features & Architecture

- **Tab-Based Navigation (`TabView`)**: Seamlessly switches between three distinct cultural celebration views using native SF Symbols and custom tab items.
- **Context Menus (`.contextMenu`)**: Implements interactive long-press contextual menus on festival hero graphics, providing quick access to festival summaries and metadata.
- **Custom Asset Integration**: Features dedicated image assets (`muertos`, `independence`, and `holi`) housed cleanly inside rounded layout containers.
- **Modular View Architecture**: Built using clean component structures (`MuertosView`, `IndependenceDayView`, and `HoliView`) wrapped inside native `NavigationStack` hierarchies.

---

## 🏮 Featured Festivals

1. **Día de los Muertos (Day of the Dead)**
   * *Tab Label*: `Muertos` (SF Symbol: `sparkles`)
   * *Significance*: A vibrant Mexican holiday welcoming back the souls of deceased relatives with colorful ofrendas, marigolds, and sugar skulls.
2. **4th of July (Independence Day)**
   * *Tab Label*: `4th of July` (SF Symbol: `flag.fill`)
   * *Significance*: Commemorates the adoption of the Declaration of Independence in 1776, featuring parades, fireworks, and patriotic displays.
3. **Holi (The Festival of Colors)**
   * *Tab Label*: `Holi` (SF Symbol: `paintpalette.fill`)
   * *Significance*: An ancient Hindu spring festival celebrating love and renewal through the playful sharing of colored powders and sweets.

---

## 📱 App Usage & Navigation

1. **Launch**: Upon launching the app, the home screen loads the primary `TabView` orchestrating the three festival tabs.
2. **Switch Tabs**: Tap any tab icon at the bottom of the screen (**Muertos**, **4th of July**, or **Holi**) to switch views.
3. **Explore Details**: Scroll through each festival's dedicated page to read about its cultural significance and view the feature image.
4. **View Demonstration**: Check the video demonstration section at the bottom of each view for real-world cultural context.

---

## ⚙️ Installation & Setup

1. **Clone the Repository**:
   ```bash
   git clone [https://github.com/trunortheng/cis137-ios-swift.git](https://github.com/trunortheng/cis137-ios-swift.git)
