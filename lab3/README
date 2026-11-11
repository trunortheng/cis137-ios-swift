# What the Flip! Memory Game (Lab 3)

[![SwiftUI](https://img.shields.io/badge/SwiftUI-iOS%2016%2B-orange.svg)](https://developer.apple.com/swiftui/)
[![Architecture](https://img.shields.io/badge/Architecture-MVVM-blue.svg)](https://developer.apple.com/swiftui/)
[![Platform](https://img.shields.io/badge/Platform-iOS%20Simulator%20%2F%20Device-lightgrey.svg)](https://developer.apple.com/xcode/)

A polished, interactive iOS memory matching application developed using **SwiftUI** and structured around the **Model-View-ViewModel (MVVM)** architectural pattern. This application demonstrates clean separation of concerns, reactive state management via `@Published` and `ObservableObject`, and fluid card-flipping and fade-out animations.

---

## 🎥 Demo

Check out **What the Flip!** in action:

[![What the Flip! Preview](https://img.youtube.com/vi/ZVhcG536BYI/0.jpg)](https://youtube.com/shorts/ZVhcG536BYI)

*(Click the image above to watch the gameplay and animation demo!)*


[![What the Flip! MVVM and Animations walkthrough](https://img.youtube.com/vi/hRoAuBKiMOw/0.jpg)](https://www.youtube.com/watch?v=hRoAuBKiMOw)

*(Click the image above to watch the walkthrough of the MVVM and Animations)*

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

**What the Flip!** (`Lab 3: MVVM Architecture and Animation`) challenges players to test their memory by uncovering and matching pairs of flower cards hidden within a responsive grid layout. Built to fulfill advanced SwiftUI coursework requirements, the app emphasizes modular code organization, immutable data models, smooth transition timing curves, and a satisfying victory completion state.

---

## 🏗️ Architecture & Design Pattern

The application strictly adheres to the **MVVM (Model-View-ViewModel)** architectural pattern to ensure modularity, scalability, and testability:

- **Model (`MemoryGame.swift`)**: Manages the core game state, including card collections (`Array<Card>`), pair counts, tracking of currently flipped cards, and pure business logic rules (`chooseCard`). Completely independent of SwiftUI.
- **View-Model (`FlowerMemoryGame.swift`)**: An `ObservableObject` class acting as the reactive bridge between the Model and the View. Exposes a `@Published` model instance, read-only card streams, user action handlers (`choose(_:)`), and game state reset logic (`restart()`).
- **View (`ContentView.swift` & `FlowerCard`)**: A declarative SwiftUI interface that renders grid layouts, handles tap gestures, applies smooth animations, and conditionally displays victory banners.

---

## ✨ Key Features & Animations

- **Reactive State Flow**: Automatically re-renders the UI whenever the ViewModel's published model properties change.
- **Smooth Card Flipping**: Utilizes `.easeInOut` timing curves to create fluid, natural transitions when cards toggle between their face-down blue backing and face-up flower asset states.
- **Controlled Match Fade-Out**: Implements a deliberate delay (`.delay()`) combined with opacity transitions on matched pairs, ensuring users have enough time to recognize and register a successful match before the cards gracefully fade out.
- **Victory State Detection**: Uses Swift's native `.allSatisfy()` collection method to monitor card match states in real time, triggering a celebratory "Game Over" banner upon completion.
- **Instant Reset Functionality**: Features a dedicated restart button tied directly to the ViewModel's state reset flow, instantly reshuffling and resetting the board.

---

## 🎮 Game Rules & Mechanics

1. **Card Selection**: Tapping a face-down, unmatched card flips it face up to reveal its flower content.
2. **Pair Evaluation**: When a second card is chosen, the game evaluates whether the two cards share identical content.
   * **If they match**: Both cards are marked as matched (`isMatched = true`), lingering briefly before fading out of the grid.
   * **If they do not match**: Tapping a subsequent third card automatically flips the previous unmatched pair back face down.
3. **Victory Condition**: The game concludes successfully when every pair on the board has been matched, revealing the victory banner.

---

## 📱 App Usage & Navigation

1. **Launch**: Upon opening the application, the `ScrollView` presents the primary title, restart button, and a randomized grid of flower cards.
2. **Playing**: Tap cards sequentially to find matching flower pairs. Watch for smooth flip transitions and matched-card feedback.
3. **Restarting**: Tap the **"Restart Game"** button at the bottom of the view at any time to clear progress, reshuffle the deck, and begin a new session.

---

## ⚙️ Installation & Setup

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/trunortheng/cis137-ios-swift.git
