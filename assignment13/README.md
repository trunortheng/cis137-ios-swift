# What the Flip! Memory Game 

[![SwiftUI](https://img.shields.io/badge/SwiftUI-iOS%2016%2B-orange.svg)](https://developer.apple.com/swiftui/)
[![Architecture](https://img.shields.io/badge/Architecture-MVVM-blue.svg)](https://developer.apple.com/swiftui/)
[![Platform](https://img.shields.io/badge/Platform-iOS%20Simulator%20%2F%20Device-lightgrey.svg)](https://developer.apple.com/xcode/)

A polished, interactive iOS memory matching application developed using **SwiftUI** and structured around the **Model-View-ViewModel (MVVM)** architectural pattern. This application demonstrates clean separation of concerns, reactive state management via `@Published` and `ObservableObject`, fluid card-flipping animations, a real-time `ProgressView` tracking game completion, and an overlay-based victory banner.

---

## 🎥 Demo

Check out **What the Flip!** in action:

[![What the Flip! Demo](https://img.youtube.com/vi/waQBvgno03A/0.jpg)](https://youtube.com/shorts/waQBvgno03A?feature=share)

*(Click the image above to watch the gameplay and animation demo!)*

---

## 📋 Table of Contents
1. [Project Overview](#-project-overview)
2. [Architecture & Design Pattern](#-architecture--design-pattern)
3. [Key Features & Animations](#-key-features--animations)
4. [Game Rules & Mechanics](#-game-rules--mechanics)
5. [App Usage & Navigation](#-app-usage--navigation)
6. [Installation & Setup](#-installation--setup)

---

## 🌍 Project Overview

**What the Flip!** with a ProgressView and MVVM Enhancement, challenges players to test their memory by uncovering and matching pairs of AI and mobile development-themed cards hidden within a responsive grid layout. Built to fulfill advanced SwiftUI coursework requirements, the app emphasizes modular code organization, immutable data models, smooth transition timing curves, and a real-time progress tracking system.

---

## 🏗️ Architecture & Design Pattern

The application strictly adheres to the **MVVM (Model-View-ViewModel)** architectural pattern to ensure modularity, scalability, and testability:

- **Model (`MemoryGame.swift`)**: Manages the core game state, including card collections (`Array<Card>`), pair counts, tracking of currently flipped cards, pure business logic rules (`chooseCard`), and a computed `progress` variable calculating the ratio of matched cards. Completely independent of SwiftUI.
- **View-Model (`TechMemoryGame.swift`)**: An `ObservableObject` class acting as the reactive bridge between the Model and the View. Exposes a `@Published` model instance, read-only card streams, a progress accessor property, user action handlers (`choose(_:)`), and game state reset logic (`restart()`).
- **View (`ContentView.swift` & `TechCard`)**: A declarative SwiftUI interface wrapped in a `ZStack` that renders grid layouts, handles tap gestures, binds real-time progress metrics to a `ProgressView`, applies smooth animations, and conditionally displays a centered victory overlay.

---

## ✨ Key Features & Animations

- **Real-Time Progress Tracking**: Integrates a dynamic `ProgressView` coupled with a percentage caption that updates automatically as matches are found.
- **Reactive State Flow**: Automatically re-renders the UI whenever the ViewModel's published model properties change.
- **Smooth Card Flipping**: Utilizes `.easeInOut` timing curves to create fluid, natural transitions when cards toggle between their face-down blue backing and face-up custom asset states.
- **Controlled Match Fade-Out**: Implements a deliberate delay (`.delay()`) combined with opacity transitions on matched pairs, ensuring users have enough time to recognize and register a successful match before the cards gracefully fade out.
- **Centered Victory Overlay**: Utilizes an un-shifting `ZStack` overlay with an `.ultraThinMaterial` frosted-glass effect and transition scaling to display a celebration banner when all matches are found.
- **Instant Reset Functionality**: Features a dedicated restart button tied directly to the ViewModel's state reset flow, instantly reshuffling and resetting the board.

---

## 🎮 Game Rules & Mechanics

1. **Card Selection**: Tapping a face-down, unmatched card flips it face up to reveal its custom content.
2. **Pair Evaluation**: When a second card is chosen, the game evaluates whether the two cards share identical content.
   * **If they match**: Both cards are marked as matched (`isMatched = true`), updating the progress bar and lingering briefly before fading out of the grid.
   * **If they do not match**: Tapping a subsequent third card automatically flips the previous unmatched pair back face down.
3. **Victory Condition**: The game concludes successfully when every pair on the board has been matched, triggering the centered victory overlay.

---

## 📱 App Usage & Navigation

1. **Launch**: Upon opening the application, the `ScrollView` presents the title, live progress bar, restart button, and a randomized grid of cards.
2. **Playing**: Tap cards sequentially to find matching pairs while watching the progress bar update in real-time.
3. **Restarting**: Tap the **"Restart Game"** button at the bottom of the view at any time to clear progress, reshuffle the deck, and begin a new session.

---

## ⚙️ Installation & Setup

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/trunortheng/cis137-ios-swift.git
