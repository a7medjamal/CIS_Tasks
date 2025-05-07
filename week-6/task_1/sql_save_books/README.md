# SQL Save Books

A Flutter application demonstrating clean architecture principles with local SQLite storage for managing books.

## Project Structure

The project follows Clean Architecture principles with three main layers:

### 1. Presentation Layer (`lib/presentation/`)
- **Cubit**: State management using Flutter Bloc
  - `book_cubit.dart`: Manages book-related business logic
  - `book_state.dart`: Defines various states for book operations
- **Screens**: UI components
  - `home_screen.dart`: Main screen for displaying books
- **Widgets**: Reusable UI components
  - `add_book_dialog.dart`: Dialog for adding new books
  - `book_item.dart`: Individual book display widget
  - `delete_all_books_dialog.dart`: Confirmation dialog for bulk deletion

### 2. Domain Layer (`lib/domain/`)
- **Entities**: Core business objects
  - `book.dart`: Core Book entity
- **Repositories**: Abstract repository interfaces
  - `book_repository.dart`: Interface for book data operations
- **Use Cases**: Business logic operations
  - `add_book.dart`: Adding new books
  - `delete_book.dart`: Removing books
  - `delete_all_books.dart`: Clearing all books
  - `get_books.dart`: Retrieving books

### 3. Data Layer (`lib/data/`)
- **Models**: Data transfer objects
  - `book_model.dart`: Book data model
- **Repositories**: Concrete repository implementations
  - `book_repository_impl.dart`: Implementation of book repository
- **Data Sources**: Data access implementations
  - `book_local_datasource.dart`: SQLite database operations

### Core (`lib/core/`)
- **Database**: SQLite configuration
  - `db_helper.dart`: Database initialization and operations

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
- View list of saved books
- Delete individual books
- Clear all books at once
- Persistent storage using SQLite
