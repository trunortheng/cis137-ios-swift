# Kumano Kodo Gesture Explorer

[![SwiftUI](https://img.shields.io/badge/SwiftUI-iOS%2016%2B-orange.svg)](https://developer.apple.com/swiftui/)
[![Gestures](https://img.shields.io/badge/Gestures-Interactive%20Multi--Touch-blue.svg)](https://developer.apple.com/documentation/swiftui/gestures)
[![Platform](https://img.shields.io/badge/Platform-iOS%20Simulator%20%2F%20Device-lightgrey.svg)](https://developer.apple.com/xcode/)

An interactive iOS image exploration application built with **SwiftUI** that combines multi-touch gesture recognizers with a clean, tabbed user interface. Designed around an image of Japan's historic **Kumano Kodo** pilgrimage trail, the app demonstrates gesture prioritization, simultaneous gesture composition, state-driven animations, and modular SwiftUI view architecture.

---

## 🎥 Demo

Check out the **Kumano Kodo Gesture Explorer** in action:

[![Kumano Kodo Gesture Explorer Preview](https://img.youtube.com/vi/TbsbqYLSEJw/0.jpg)](https://youtube.com/shorts/TbsbqYLSEJw?feature=share)

*(Click the image above to watch the gesture interaction and UI walkthrough!)*

---

## 📋 Table of Contents
1. [Project Overview](#-project-overview)
2. [Architecture & UI Structure](#-architecture--ui-structure)
3. [Key Features & Animations](#-key-features--animations)
4. [Gesture Mechanics & Controls](#-gesture-mechanics--controls)
5. [App Usage & Navigation](#-app-usage--navigation)
6. [Installation & Setup](#-installation--setup)

---

## 🌍 Project Overview

The **Kumano Kodo Gesture Explorer** was developed to explore advanced gesture recognition and multi-tab navigation in SwiftUI. Users can inspect high-resolution photography of the Kumano Kodo—an ancient network of cedar-lined pilgrimage paths in Japan's Kii Peninsula—using intuitive tap, double-tap, long-press, and drag interactions. Alongside the interactive canvas, the application provides dedicated tabs detailing the cultural and personal inspiration behind the location as well as a technical breakdown of how each gesture recognizer operates.

---

## 🏗️ Architecture & UI Structure

The application is organized into a modular, multi-tab SwiftUI hierarchy within `ContentView.swift` to separate interactive canvas state from informational views:

- **Root Navigation (`ContentView`)**: Implements a three-tab `TabView` (`Viewer`, `About`, and `Gestures`) using SF Symbols and consistent accent styling.
- **Interactive Canvas (`ImageViewerView` & `LegendItem`)**: Manages `@State` properties for `scale`, `offset`, and `lastOffset` inside a `GeometryReader` and `ZStack`. Renders the zoomable/pannable image beneath a frosted-glass legend card (`.ultraThinMaterial`).
- **Location Story (`AboutImageViewView`)**: Presents a scrollable `NavigationView` showcasing the Kumano Kodo photography alongside personal reflections on visiting the trail for tranquility, cycling, and studying Japanese.
- **Technical Reference (`GesturesGuideView` & `GestureDetailRow`)**: Uses a structured SwiftUI `List` to document the implementation logic and priority rules behind each gesture recognizer.

---

## ✨ Key Features & Animations

- **Multi-Gesture Composition**: Combines `.gesture()`, `.highPriorityGesture()`, and `.simultaneousGesture()` modifiers so zooming, panning, and resetting work seamlessly without input collisions.
- **Smooth Scale Transitions**: Applies `.animation(.easeInOut(duration: 0.3), value: scale)` for fluid visual feedback during zoom-in, zoom-out, and reset actions.
- **Cumulative Panning State**: Tracks both active translation (`offset`) and committed position (`lastOffset`) so users can drag across the image across multiple consecutive strokes without snapping back.
- **Automatic Centering on Reset**: Resets translation offsets back to `.zero` whenever the image returns to its baseline `1.0` scale, keeping the composition cleanly framed.
- **Frosted-Glass Gesture Legend**: Displays a persistent, non-intrusive `.ultraThinMaterial` overlay card at the bottom of the viewer so users immediately know every supported touch control.

---

## 🎮 Gesture Mechanics & Controls

1. **Single Tap (`TapGesture`) — Zoom In**: Increments the image scale factor by `0.5` (`scale += 0.5`), allowing users to progressively inspect fine details along the trail.
2. **Double Tap (`TapGesture(count: 2)`) — Zoom Out**: Registered via `.highPriorityGesture()` to intercept rapid double taps before single-tap handlers fire, reducing the scale (`scale = max(0.5, scale - 0.5)`) and re-centering the image if returned to `1.0`.
3. **Long Press (`LongPressGesture(minimumDuration: 1.0)`) — Reset**: Runs simultaneously with tap gestures; holding on the image for 1.0 second restores `scale` to `1.0` and resets both `offset` and `lastOffset` to `.zero`.
4. **Drag (`DragGesture`) — Pan Across Canvas**: Captures continuous `CGSize` drag translations (`onChanged`) and persists the final coordinates (`onEnded`), letting users explore any region of the zoomed image.

---

## 📱 App Usage & Navigation

1. **Viewer Tab**: Tap to zoom in, double-tap to zoom out, drag with one finger to pan around the scenery, or press and hold for one second to reset the view. Reference the bottom legend card at any time for quick control reminders.
2. **About Tab**: Read about the history of the Kumano Kodo and the personal inspiration behind choosing this destination.
3. **Gestures Tab**: Review a structured breakdown of each SwiftUI gesture recognizer and how priority modifiers resolve touch conflicts.

---

## ⚙️ Installation & Setup

1. **Clone the Repository**:
   ```bash
   git clone [https://github.com/trunortheng/cis137-ios-swift.git](https://github.com/trunortheng/cis137-ios-swift.git)
