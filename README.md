# Community Event Explorer

**Discover and bookmark sports events near you**



An iOS application that helps users discover, search, and save sports events. Built with SwiftUI and Firebase, featuring real-time event updates, smart search functionality, and persistent bookmarks.


<img width="600" height="545" alt="simulator_screenshot_64F97A4A-AD5C-4213-85CE-24D2C1706D93" src="https://github.com/user-attachments/assets/938bd6ff-bc1f-4cb1-aa10-a7bd2d94ea23" />
<img width="600" height="545" alt="simulator_screenshot_8CFC6F0E-D81D-482F-9699-C6F8F2139518" src="https://github.com/user-attachments/assets/343a6589-db87-483c-a92a-a19f54417527" />
<img width="600" height="545" alt="simulator_screenshot_827EAC46-FC77-494F-9D1A-92083745C840" src="https://github.com/user-attachments/assets/2052840e-6875-494a-b771-9c3514df8077" />
<img width="600" height="545" alt="simulator_screenshot_846BCF11-9600-4D1E-A735-8BF9AF76F1E5" src="https://github.com/user-attachments/assets/157f1bf8-7a65-4021-9302-66fc8ea444c8" />

##Overview

Community Event Explorer was developed as part of **CSE 335 – Mobile App Development** at Arizona State University. The app provides a clean, intuitive interface for users to browse sporting events (specifically Phoenix Suns games), search by team or venue, view detailed event information, and bookmark favorites for easy access.

### Key Features

- **Event Discovery** - Browse sports events with real-time Firebase updates  
- **Smart Search** - Find events by team name, opponent, or venue  
- **Bookmark System** - Save events for later viewing with persistent storage  
- **Detailed Event Info** - View venue details, dates, and event descriptions  
- **Clean UI** - Native iOS design with bottom tab navigation  
- **Offline Support** - Bookmarked events accessible without internet  

---

## Screenshots

### Home Screen - Event List
Browse all upcoming Phoenix Suns games with venue and date information. Clean list view shows matchups at Mortgage Matchup Center (formerly PHX Arena).

### Search Events
Real-time search functionality allows filtering events by team name or opponent. Search results update instantly as you type.

### Saved Events
Bookmarked events are saved locally for quick access. View your saved events even without internet connection.

### Event Details
Tap any event to see full details including venue information, date, and important event notes (e.g., cashless payment requirements, transit options).

---

## Tech Stack

### Frontend
- **SwiftUI** - Declarative UI framework for native iOS design
- **NavigationStack** - Modern iOS navigation patterns
- **List & ScrollView** - Optimized list rendering

### Backend & Data
- **Firebase Firestore** - Real-time NoSQL database for event storage
- **UserDefaults** - Local bookmark persistence
- **Codable Protocol** - JSON serialization/deserialization

### Architecture
- **MVVM Pattern** - Clean separation of concerns
- **ObservableObject** - Reactive state management
- **Protocol-Oriented** - Flexible, testable services

---

## Architecture

The app follows the **MVVM (Model-View-ViewModel)** pattern for clean, maintainable code:

```
┌─────────────────────────────────────────────────┐
│                    View Layer                    │
│  ┌─────────────┐  ┌──────────────┐  ┌────────┐ │
│  │  EventList  │  │  SearchView  │  │ Detail │ │
│  │  View.swift │  │  .swift      │  │  View  │ │
│  └──────┬──────┘  └──────┬───────┘  └───┬────┘ │
└─────────┼──────────────────┼──────────────┼──────┘
          │                  │              │
          ▼                  ▼              ▼
┌─────────────────────────────────────────────────┐
│                ViewModel Layer                   │
│  ┌─────────────────────────────────────────┐    │
│  │      EventViewModel.swift                │    │
│  │  • Fetch events from Firebase            │    │
│  │  • Handle search filtering               │    │
│  │  • Manage bookmark state                 │    │
│  │  • Expose @Published properties          │    │
│  └──────────────┬──────────────────────────┘    │
└─────────────────┼───────────────────────────────┘
                  │
                  ▼
┌─────────────────────────────────────────────────┐
│                  Model Layer                     │
│  ┌──────────┐  ┌───────────┐  ┌─────────────┐  │
│  │  Event   │  │  Venue    │  │  Bookmark   │  │
│  │  .swift  │  │  .swift   │  │  .swift     │  │
│  └──────────┘  └───────────┘  └─────────────┘  │
│                                                  │
│  ┌──────────────────────────────────────────┐   │
│  │          Services                         │   │
│  │  • FirebaseService.swift                 │   │
│  │  • BookmarkService.swift                 │   │
│  └──────────────────────────────────────────┘   │
└──────────────────────────────────────────────────┘
```

### Component Responsibilities

**View Layer (SwiftUI)**
- **EventListView**: Main screen showing all events
- **SearchView**: Search and filter interface
- **EventDetailView**: Full event information page
- **SavedEventsView**: Bookmarked events list

**ViewModel Layer**
- **EventViewModel**: 
  - Fetches events from Firebase
  - Implements search filtering logic
  - Manages loading and error states
  - Publishes data changes to views

**Model Layer**
- **Event**: Event data structure (title, date, venue, description)
- **Services**: Firebase integration and bookmark persistence

---

## Getting Started

### Prerequisites

- **Xcode 14.0+**
- **iOS 15.0+** deployment target
- **CocoaPods** or **Swift Package Manager**
- **Firebase account** (free tier works)

### Installation

**1. Clone the repository**
```bash
git clone https://github.com/Sjaisw12/community-event-explorer-ios.git
cd community-event-explorer-ios
```

**2. Install dependencies**

Using **CocoaPods**:
```bash
pod install
open CommunityEventExplorer.xcworkspace
```

Or using **Swift Package Manager** (already integrated):
- Open `CommunityEventExplorer.xcodeproj` in Xcode
- Dependencies will automatically resolve

**3. Configure Firebase**

a. Create a Firebase project at [console.firebase.google.com](https://console.firebase.google.com)

b. Download `GoogleService-Info.plist` from Firebase Console

c. Add it to your Xcode project root

d. Enable **Firestore Database** in Firebase Console

**4. Add API Keys** (if using external event APIs)

Create `Config.swift`:
```swift
enum Config {
    static let apiKey = "YOUR_API_KEY_HERE"
    static let baseURL = "https://api.example.com"
}
```

**5. Build and Run**
```bash
# Select target device/simulator in Xcode
# Press Cmd + R to build and run
```

---

## Project Structure

```
CommunityEventExplorer/
├── Models/
│   ├── Event.swift              # Event data model
│   ├── Venue.swift              # Venue/location model
│   └── Bookmark.swift           # Bookmark model
│
├── Views/
│   ├── EventListView.swift      # Main events list (Home tab)
│   ├── EventDetailView.swift    # Event details page
│   ├── SearchView.swift         # Search events (Search tab)
│   ├── SavedEventsView.swift    # Bookmarked events (Saved tab)
│   └── Components/              # Reusable UI components
│       └── EventCard.swift      # Event list item
│
├── ViewModels/
│   ├── EventViewModel.swift     # Main business logic
│   └── BookmarkViewModel.swift  # Bookmark management
│
├── Services/
│   ├── FirebaseService.swift    # Firebase Firestore integration
│   └── BookmarkService.swift    # Local bookmark persistence
│
├── Utilities/
│   ├── Extensions/              # Swift extensions
│   └── Constants.swift          # App-wide constants
│
└── Resources/
    ├── Assets.xcassets          # Images, colors
    └── GoogleService-Info.plist # Firebase config
```

---

## Firebase Configuration

### Firestore Database Structure

```
events/
  └── {eventId}
      ├── title: String
      ├── description: String
      ├── category: String
      ├── date: Timestamp
      ├── location: GeoPoint
      ├── venue: String
      ├── imageURL: String
      └── createdAt: Timestamp

bookmarks/
  └── {userId}
      └── events/
          └── {eventId}: Boolean
```

### Security Rules (Firestore)

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Events are publicly readable
    match /events/{eventId} {
      allow read: if true;
      allow write: if request.auth != null;
    }
    
    // Bookmarks are user-specific
    match /bookmarks/{userId} {
      allow read, write: if request.auth.uid == userId;
    }
  }
}
```

---

## Features in Detail

### Event Discovery
- **Real-time updates** from Firebase Firestore
- **Chronological sorting** by event date
- **Pull-to-refresh** for latest events
- **Event cards** showing matchup, venue, and date

### Search Functionality
```swift
// Real-time search filtering
events.filter { event in
    let searchLower = searchText.lowercased()
    return event.title.lowercased().contains(searchLower) ||
           event.venue.lowercased().contains(searchLower)
}
```

### Bookmark System
- **Tap to save** events from list or detail view
- **Heart icon** indicates saved status
- **Local persistence** using UserDefaults
- **Dedicated "Saved" tab** for quick access
- **Offline access** to bookmarked events
- **Persistent across app restarts**

### Event Details
- **Venue information** (name and former name)
- **Event date** with formatted display
- **Description/Notes** (e.g., cashless payment info, transit details)
- **Save/Unsave** button with visual feedback
- **Clean, readable layout**

### Navigation
- **Tab Bar** with three sections:
  - Home: Browse all events
  - Search: Filter events
  - Saved: View bookmarked events

---

## Testing

### Unit Tests
```bash
# Run tests from command line
xcodebuild test -scheme CommunityEventExplorer -destination 'platform=iOS Simulator,name=iPhone 15'

# Or press Cmd + U in Xcode
```

**Test Coverage:**
- ViewModel business logic
- API service mocking
- Data model validation
- Bookmark persistence

### UI Tests
```swift
// Example UI test
func testEventListDisplay() {
    let app = XCUIApplication()
    app.launch()
    
    XCTAssertTrue(app.navigationBars["Events"].exists)
    XCTAssertTrue(app.tables.cells.count > 0)
}
```

---

## Performance Optimizations

- **Lazy loading** of event data
- **Firebase query optimization** (indexed queries)
- **Debounced search** (reduces unnecessary filtering)
- **@Published property updates** (only re-render when needed)
- **List virtualization** (SwiftUI's built-in optimization)

---

## Known Issues & Limitations

- Currently focused on Phoenix Suns games (single team)
- Bookmark sync across devices requires iCloud implementation
- Search is client-side only (filters loaded events)

**Planned Improvements:**
- Multi-sport and multi-team support
- Category filters (basketball, football, concerts, etc.)
- Push notifications for upcoming saved events
- User authentication (Firebase Auth)
- Share events with friends
- Calendar integration (add to Apple Calendar)

---

## System Requirements

- **iOS:** 15.0 or later
- **Xcode:** 14.0 or later
- **Swift:** 5.7 or later
- **Device:** iPhone or iPad (universal app)

---

## Contributing

This is an academic project, but suggestions are welcome!

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## License

This project was developed for **CSE 335 – Mobile App Development** at Arizona State University.

For educational purposes only. Not licensed for commercial use.

---

## Author

**[Your Name]**  
Arizona State University | CSE 335 – Mobile App Development  

Email: (sjaisw12@asu.edu)   
GitHub: [@Sjaisw12](https://github.com/Sjaisw12)

---

## Acknowledgments

- **ASU CSE 335** course staff for project guidance
- **Firebase** for backend infrastructure
- **Apple Developer Documentation** for iOS best practices
- **SwiftUI community** for open-source examples

---

## Learning Resources

Resources used during development:

- [SwiftUI Tutorials](https://developer.apple.com/tutorials/swiftui) - Apple's official tutorials
- [Firebase iOS Docs](https://firebase.google.com/docs/ios/setup) - Firebase integration
- [Hacking with Swift](https://www.hackingwithswift.com/) - SwiftUI examples
- [Ray Wenderlich](https://www.raywenderlich.com/) - iOS development patterns

---

**If you found this project helpful, please consider starring the repository!**

---

*Built with Swift and SwiftUI*
