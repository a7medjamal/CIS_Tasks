# SQL Save Books

A Flutter application demonstrating clean architecture principles with local SQLite storage for managing books.

## Project Structure

The project follows Clean Architecture principles with a well-organized directory structure that promotes separation of concerns and maintainability:

```
lib/
├── core/
│   └── db/
│       └── db_helper.dart         # SQLite database configuration and operations
├── data/
│   ├── datasource/
│   │   └── book_local_datasource.dart  # SQLite database operations implementation
│   ├── models/
│   │   └── book_model.dart        # Data transfer object for Book entity
│   └── repositories/
│       └── book_repository_impl.dart    # Concrete implementation of book repository
├── domain/
│   ├── entities/
│   │   └── book.dart              # Core Book business entity
│   ├── repositories/
│   │   └── book_repository.dart    # Abstract repository interface
│   └── usecases/
│       ├── add_book.dart          # Use case for adding new books
│       ├── delete_book.dart       # Use case for removing books
│       ├── delete_all_books.dart  # Use case for clearing all books
│       └── get_books.dart         # Use case for retrieving books
└── presentation/
    ├── cubit/
    │   ├── book_cubit.dart        # Business logic and state management
    │   └── book_state.dart        # State definitions for book operations
    ├── screens/
    │   └── home_screen.dart       # Main screen UI
    └── widgets/
        ├── add_book_bottom_sheet.dart    # Modern bottom sheet for book addition
        ├── book_item.dart         # Book display widget with image preview
        └── delete_all_books_dialog.dart  # Confirmation dialog
```

### Layer Details

#### 1. Presentation Layer (`lib/presentation/`)
Handles UI and user interactions:
- **Cubit**: Implements state management using Flutter Bloc pattern
- **Screens**: Contains main application screens
- **Widgets**: Houses reusable UI components with modern design

#### 2. Domain Layer (`lib/domain/`)
Contains business logic and rules:
- **Entities**: Defines core business objects
- **Repositories**: Declares abstract interfaces for data operations
- **Use Cases**: Implements specific business operations

#### 3. Data Layer (`lib/data/`)
Manages data operations and persistence:
- **Models**: Implements data transfer objects
- **Repositories**: Provides concrete implementations of domain repositories
- **Data Sources**: Handles local data storage operations

#### 4. Core (`lib/core/`)
Contains application-wide utilities:
- **Database**: Manages SQLite configuration and initialization

## Tools and Libraries

- **State Management**: Flutter Bloc/Cubit
- **Local Storage**: SQLite
- **Architecture**: Clean Architecture with Dependency Injection
- **Other Tools**:
  - Equatable: For value comparison
  - Get_it: Dependency injection

## Getting Started

1. Ensure you have Flutter installed on your machine
2. Clone the repository
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the application

## Features

- Add new books with title and author
- Support for book cover images via URL with validation
- View list of saved books with image previews
- Delete individual books
- Clear all books at once
- Persistent storage using SQLite
- Modern bottom sheet UI for adding books
- Real-time image URL validation
- Error handling with user feedback
