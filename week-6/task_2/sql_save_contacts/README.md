# SQL Contact Manager

A Flutter application that demonstrates Clean Architecture principles for managing contacts with local SQL storage. The app allows users to add, view, edit, and delete contacts while maintaining a clean separation of concerns through its layered architecture.

## Features

- **Contact Management**
  - Add new contacts with name, phone number, and photo URL
  - View contacts in an elegant grid layout
  - Edit existing contact details
  - Delete contacts
- **Modern UI Design**
  - Grid view display with 2-column layout
  - Custom contact avatars with fallback images
  - Bottom sheet for adding new contacts
  - Dedicated contact details screen
  - Floating action button with rounded corners
- **Local SQL Database**
  - Persistent storage using SQLite
  - Efficient data management
- **Clean Architecture**
  - Separation of concerns
  - BLoC pattern (Cubit) for state management

## Project Structure

The project follows Clean Architecture principles with the following layers:

```
lib/
├── core/
│   └── db/
│       └── db_helper.dart         # SQLite database configuration
├── data/
│   ├── datasource/
│   │   └── contact_local_datasource.dart  # Local database operations
│   ├── models/
│   │   └── contact_model.dart     # Data models
│   └── repositories/
│       └── contact_repository_impl.dart  # Repository implementation
├── domain/
│   ├── entities/
│   │   └── contact.dart           # Business entities
│   ├── repositories/
│   │   └── contact_repository.dart # Repository interfaces
│   └── usecases/
│       ├── add_contact.dart       # Use case for adding contacts
│       ├── delete_contact.dart     # Use case for deleting contacts
│       └── get_contacts.dart       # Use case for retrieving contacts
└── presentation/
    ├── cubit/
    │   ├── contact_cubit.dart      # Business logic component
    │   └── contact_state.dart      # State management
    ├── screens/
    │   ├── contacts_screen.dart    # Main screen with grid view
    │   └── contact_details_screen.dart # Contact editing screen
    └── widgets/
        ├── add_contact_form.dart   # Contact creation form
        ├── contact_list.dart       # Grid view implementation
        ├── contact_list_item.dart  # Grid item component
        ├── contact_avatar.dart     # Avatar display with fallback
        ├── contact_form.dart       # Reusable contact form
        └── contact_action_buttons.dart # Contact operation buttons
```

## Architecture

The application implements Clean Architecture with three main layers:

1. **Presentation Layer**
   - Uses Flutter BLoC (Cubit) for state management
   - Contains UI components (screens and widgets)
   - Implements grid view and details screen
   - Handles user interactions and state updates

2. **Domain Layer**
   - Contains business logic and rules
   - Defines entities and repository interfaces
   - Implements use cases for business operations

3. **Data Layer**
   - Implements repository interfaces
   - Handles data persistence with SQLite
   - Manages data models and transformations

## Technologies Used

- **Flutter**: UI framework for building cross-platform applications
- **flutter_bloc**: State management solution
- **SQLite**: Local database for data persistence
- **Clean Architecture**: Software architecture pattern
- **Cubit Pattern**: Simplified version of BLoC for state management

## Getting Started

1. Clone the repository
2. Ensure Flutter is installed and set up on your system
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the application

## Dependencies

- flutter_bloc: State management
- sqflite: SQLite plugin for Flutter
- path_provider: File system locations

## Development

The application follows these development principles:

- **Clean Architecture**: Separation of concerns and dependencies pointing inwards
- **SOLID Principles**: Following object-oriented design principles
- **Repository Pattern**: Abstract data layer implementation
- **Dependency Injection**: Manual dependency injection for better testability
- **Component Reusability**: Modular widgets for consistent UI
